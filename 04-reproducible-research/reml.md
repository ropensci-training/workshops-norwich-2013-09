
```r
library(rfisheries)
```

```
## Loading required package: RCurl Loading required package: bitops Loading
## required package: RJSONIO
```

```r
library(reshape2)
library(ggplot2)
```



```r
species <- species_codes(progress = "none")
tunas <- grep("Tuna", species$english_name)
```



```r
who <- c("TUX", "COD", "VET", "NPA")
by_species <- lapply(who, function(x) landings(species = x))
names(by_species) <- who
```



```r
dat <- melt(by_species, id = c("catch", "year"))
names(dat) <- c("catch", "year", "a3_code")
```


Tidy data is easy to plot:


```r
ggplot(dat, aes(year, catch)) + geom_line() + facet_wrap(~a3_code, scales = "free_y")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 






```r
library(data.table)
```

```
## data.table 1.8.8 For help type: help("data.table")
```

```r
species <- data.table(species)
setkey(species, "a3_code")
code_names <- species[who, scientific_name]
```



```r
code_names[[2]] <- factor(code_names[[2]])
```



or as a named string,


```r
codes <- code_names$scientific_name
names(codes) <- code_names$a3_code
codes
```

```
##               TUX               COD               VET               NPA 
##       Scombroidei      Gadus morhua Engraulis ringens  Engraulis mordax 
## Levels: Engraulis mordax Engraulis ringens Gadus morhua Scombroidei
```


Perhaps we want date formats


```r
# dat[[2]] <- as.POSIXlt.character(dat[[2]], format = '%Y')
```




```r
meta <- list(catch = list("catch", "Global Landings of fish", "tonnes"), year = list("year", 
    "the year for which data was reported", "YYYY"), a3_code = list("a3_code", 
    "3 digit country code", codes))
```


We must make sure that column classes are correct.  


```r
# dat$year = as.Date(as.character(dat$year), format='%Y')
dat$a3_code <- as.factor(dat$a3_code)
```



```r
require(reml)
```

```
## Loading required package: reml
```

```r
description <- "Landings data for several species by year, from the OpenFisheries database"
eml_write(dat = dat, meta, title = "Landings Data", description = description, 
    creator = "Karthik Ram <karthik@ropensci.org>", file = "landings.xml")
```

```
## Loading required package: uuid
```

```
## Warning: there is no package called 'uuid'
```

```
## [1] "landings.xml"
```



## Publish to rfigshare


```r
eml_publish("landings.xml", description = description, categories = "Ecology", 
    tags = "fisheries", destination = "figshare", visibility = "public")
```

```
## Loading required package: rfigshare text_content() deprecated. Use
## parsed_content(x, as = 'parsed') Loading required package: rjson
## 
## Attaching package: 'rjson'
## 
## The following object is masked from 'package:RJSONIO':
## 
## fromJSON, toJSON
## 
## Your article has been created! Your id number is 788983 text_content()
## deprecated. Use parsed_content(x, as = 'parsed') text_content()
## deprecated. Use parsed_content(x, as = 'parsed')
```

```
## [1] 788983
```



## Adding Location context with GBIF


```r
library(rgbif)
omany <- failwith(NULL, occurrencelist_many)
locations <- llply(as.list(code_names$scientific_name), omany, .progress = "none")
names(locations) <- who
species_loc <- lapply(locations, function(x) data.frame(species = x[1], Lat = x[3], 
    Long = x[4]))
loc <- melt(species_loc, id = names(species_loc[[1]]))
names(loc) <- c("scientific_name", "Lat", "Long", "a3_code")
a <- join(dat, loc, by = "a3_code")
```






Richer GBIF record ...


```r
omany <- failwith(NULL, occurrencelist)
locations <- llply(as.list(code_names$scientific_name), omany, format = "darwin", 
    .progress = "none")
gbif_dat <- lapply(locations, gbifdata, minimal = FALSE)
```




