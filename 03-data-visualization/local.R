# Examples I need to run locally

library(ggplot2)
library(gcookbook)

# Basics of grammar of graphics
# Differnt plot types
# Dealing with colors
# Dealing with scales
# Making publication quality figures

# Barplots
#
ggplot(pg_mean, aes(x=group, y=weight)) +
        geom_bar(stat="identity", fill="lightblue", colour="black")

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
        geom_bar(position="dodge", colour="black") +
        scale_fill_brewer(palette="Pastel1")

    library(gcookbook) # For the data set
csub <- subset(climate, Source=="Berkeley" & Year >= 1900)
csub$pos <- csub$Anomaly10y >= 0
   ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
      geom_bar(stat="identity", position="identity") + ggtitle("Foo") + scale_fill_brewer(palette="Set1")

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
geom_bar(stat="identity", position="identity", colour="black", size=0.25) + scale_fill_manual(values=c("#CCEEFF", "#FFDDDD"), guide=FALSE)
# Histogram
h <- ggplot(faithful, aes(x=waiting)) # Save the base object for reuse
 h + geom_histogram(binwidth=8, fill="white", colour="black", origin=31) h + geom_histogram(binwidth=8, fill="white", colour="black", origin=35)
# Colored bars.
ggplot(birthwt1, aes(x=bwt, fill=smoke)) +
        geom_histogram(position="identity", alpha=0.4)
ggplot(birthwt, aes(x=bwt)) + geom_histogram(fill="white", colour="black") +
        facet_grid(smoke ~ .)
# scatter plots
ggplot(heightweight, aes(x=ageYear, y=heightIn, size=weightLb, colour=sex)) + geom_point(alpha=.5) +
scale_size_area() + # Make area proportional to numeric value scale_colour_brewer(palette="Set1")
# lines
ggplot(BOD, aes(x=Time, y=demand)) + geom_line()
ggplot(worldpop, aes(x=Year, y=Population)) + geom_line() + geom_point()
ggplot(tg, aes(x=dose, y=length, colour=supp)) + geom_line()
ggplot(tg, aes(x=dose, y=length, colour=supp)) +
        geom_line(linetype="dashed") +
        geom_point(shape=22, size=3, fill="white")

# Lines - density
ggplot(faithful, aes(x=waiting)) +
        geom_line(stat="density", adjust=.25, colour="red") +
        geom_line(stat="density") +
        geom_line(stat="density", adjust=2, colour="blue")

# Area graphs
 sunspotyear <- data.frame(
        Year     = as.numeric(time(sunspot.year)),
        Sunspots = as.numeric(sunspot.year)
    )
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) +
        geom_area(colour="black", fill="blue", alpha=.2)
#stacked area
 ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area()
# confidence intervals
clim <- subset(climate, Source == "Berkeley",
                   select=c("Year", "Anomaly10y", "Unc10y"))
clim
ggplot(clim, aes(x=Year, y=Anomaly10y)) +
    geom_ribbon(aes(ymin=Anomaly10y-Unc10y, ymax=Anomaly10y+Unc10y))
+ geom_line()

ggplot(clim, aes(x=Year, y=Anomaly10y)) +
geom_line(aes(y=Anomaly10y-Unc10y), colour="grey50", linetype="dotted") +
        geom_line(aes(y=Anomaly10y+Unc10y), colour="grey50", linetype="dotted") + geom_line()

# Faceting plots

# cleaning up plots

# Themes

theme_update()

# Multiple plots per page

# Saving plots

# useful tricks
# Remove legend title
+ guides(fill=guide_legend(title=NULL))
# Change the legend labels
p + scale_fill_discrete(labels=c("Control", "Treatment 1", "Treatment 2"))

# Common legends
# • scale_fill_discrete()
# • scale_fill_hue()
# • scale_fill_manual()
# • scale_fill_grey()
# • scale_fill_brewer()
# • scale_colour_discrete()
# • scale_colour_hue()
# • scale_colour_manual()
# • scale_colour_grey()
# • scale_colour_brewer()
# • scale_shape_manual()
# • scale_linetype()



world_map <- map_data("world")
east_asia <- map_data("world", region=c("Australia", "Hawaii"))
ggplot(east_asia, aes(x=long, y=lat, group=group, fill=region)) +
        scale_fill_brewer(palette="Set2") + geom_polygon()


# Working out line plot
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point() + theme_gray()
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point() + theme_gray()

ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color= Species)) + theme_gray()

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point() + geom_path()

ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = Species)) + geom_path()

ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = Species)) + facet_grid(. ~ Species)
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = Species)) + facet_grid(Species ~ .)
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_line(aes(color = Species, linetype = Species)) + facet_grid(Species ~ .) + theme(axis.title.y=element_text(angle=0)) + theme(axis.line=element_line(color="steelblue")) + theme(strip.background = )

#-------------------------------------------------------------------
##-------------------------------------------------------------------
# Bar plots with the Iris dataset
# The heights of the bars commonly represent one of two things: either a count of cases in each group, or the values in a column of the data frame. By default, geom_bar uses stat="bin". This makes the height of each bar equal to the number of cases in each group, and it is incompatible with mapping values to the y aesthetic. If you want the heights of the bars to represent values in the data, use stat="identity" and map a value to the y aesthetic.
#By default, multiple x's occuring in the same place will be stacked a top one another by position_stack. If you want them to be dodged from side-to-side, see position_dodge. Finally, position_fill shows relative propotions at each x by stacking the bars and then stretching or squashing to the same height.
#
ggplot(iris, aes(Species, Sepal.Length)) + geom_bar(stat="identity", postiion = "dodge")
# + scale_x_discrete(labels=c("A", "B", "C"))
#

df =melt(iris, measured.vars="Species")

ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity")
ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity", position="dodge")
ggplot(df, aes(Species, value, fill = variable, )) + geom_bar(stat="identity", position="dodge", color = "black")

ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity", width=0.4, position= position_dodge(0.9)) + scale_fill_brewer(palette="Set1")

ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity", width=0.4, position= position_dodge(0.9)) + scale_fill_brewer(palette="Set1")   + geom_bar(stat="identity", color="black", show_guide = FALSE, position="dodge")


# bin vesus identity
ggplot(df, aes(Species, fill = variable)) + geom_bar(stat="bin")
ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity")
ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity", position = "dodge")



df2 <- ddply(df, .(Species), function(x) {
        ddply(x, .(variable), transform, percent = value/sum(value) * 100)
    })
ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity", position="fill")

df2 <- ddply(df, .(Species), function(x) {
        x$total <- sum(x$value)
        ddply(x, .(variable), transform, percent = value/total * 100)
    })

ggplot(df2, aes(Species, percent, fill = variable)) + geom_bar(stat="identity")


ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity", width=0.7, position= position_dodge(0.9)) + scale_fill_brewer(palette="Set1") + scale_y_continuous(name = "foo",expand = c(0,0)) + theme(legend.position = "top")

ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat="identity", width=0.7, position= position_dodge(0.9)) + scale_fill_brewer(palette="Set1") + scale_y_continuous(name = "foo",expand = c(0,0)) + theme(legend.position = "top")

## Colors!
#
#


## Scales!
#

# Alphas
# "scale_alpha", "scale_alpha_discrete",  "scale_alpha_identity" ,"scale_alpha_manual"

# Colors
# "scale_color_brewer"
# To see all available colors
library(RColorBrewer)
display.brewer.all()

# "scale_color_continuous"
# "scale_color_discrete"      "scale_color_gradient"
# "scale_color_gradient2"     "scale_color_gradientn"
# "scale_color_grey"          "scale_color_hue"
# "scale_color_identity"      "scale_color_manual"
# "scale_colour_brewer"       "scale_colour_continuous"
# "scale_colour_discrete"     "scale_colour_gradient"
# "scale_colour_gradient2"    "scale_colour_gradientn"
# "scale_colour_grey"         "scale_colour_hue"
# "scale_colour_identity"     "scale_colour_manual"
# "scale_fill_brewer"         "scale_fill_continuous"
# "scale_fill_discrete"       "scale_fill_gradient"
# "scale_fill_gradient2"      "scale_fill_gradientn"
# "scale_fill_grey"           "scale_fill_hue"
# "scale_fill_identity"       "scale_fill_manual"
# "scale_linetype"            "scale_linetype_continuous"
# "scale_linetype_discrete"   "scale_linetype_identity"
# "scale_linetype_manual"     "scale_shape"
# "scale_shape_continuous"    "scale_shape_discrete"
# "scale_shape_identity"      "scale_shape_manual"
# "scale_size"                "scale_size_area"
# "scale_size_continuous"     "scale_size_discrete"
# "scale_size_identity"       "scale_size_manual"
# "scale_x_continuous"        "scale_x_date"
# "scale_x_datetime"          "scale_x_discrete"
# "scale_x_log10"             "scale_x_reverse"
# "scale_x_sqrt"              "scale_y_continuous"
# "scale_y_date"              "scale_y_datetime"
# "scale_y_discrete"          "scale_y_log10"
# "scale_y_reverse"           "scale_y_sqrt"

# Commonly used scales
scale_fill_discrete()
scale_colour_discrete()

scale_fill_hue()
scale_color_hue()

scale_fill_manual()
scale_color_manual()

scale_fill_grey()
scale_fill_brewer()
scale_color_brewer()

scale_linetype()
scale_shape_manual()

# For discrete scales
#
# aesthetics: the names of the aesthetics that this scale works with

# scale_name: the name of the scale

# palette: a palette function that when called with a single integer argument

# name :the name of the scale - used as the axis label or the legend title

# drop: drop unused factor levels from the scale (TRUE or FALSE)

# breaks: control the breaks in the guide. There are four possible types of input:
# NULL: don't display any breaks a character vector giving the breaks as they should appear on the axis or in the legend.


# limits: A character vector specifying the data range for the scale. and the default order of their display in guides.

# labels: NULL for no labels, waiver() for default labels (labels the same as breaks), a character vector the same length as breaks, or a named character vector whose names are used to match replacement the labels for matching breaks.


# expand: a numeric vector of length two, giving a multiplicative and additive constant used to expand the rangeof the scales so that there is a small gap between the data and the axes.

# na.value: how should missing values be displayed?
# guide: the name of, or actual function, used to create the guide.


# Facets!

# ---------------------------------------------

names(iris)
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point(size=4, shape=16) + facet_grid(Species ~ .)
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point(size=4, shape=16) + facet_grid(. ~ Species)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point(size=2.5, shape=16) + facet_wrap( ~ Species)


ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point(size=2.5, shape=16) + facet_wrap( ~ Species) + theme(legend.key=element_rect(fill=NA), legend.position="bottom", strip.background=element_rect(fill=NA), strip.text=element_text(size=25), axis.title.y=element_text(angle=0))


dd <- ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point(size=4, shape=16) + facet_grid(. ~Species)
dd + scale_y_continuous(breaks=seq(2,8,by=1), labels=paste0(2:8, " cm"))

dd + theme_gray() + theme(panel.grid.minor=element_line(color="blue"))
                # Legends

# bar plots, exercise
clim <- read.csv(file="~/Github/ggplot2-lecture/climate.csv", header=T)
d <- ggplot(clim, aes(Year, Anomaly10y, fill=pos)) + geom_bar(stat="identity", position="identity", show_guide=FALSE) + scale_fill_brewer(palette="Set1")

# LINE PLOTS


ggplot(clim, aes(Year, Anomaly10y)) + geom_line()

ggplot(clim, aes(Year, Anomaly10y)) + geom_ribbon(aes(ymin=Anomaly10y-Unc10y, ymax=Anomaly10y+Unc10y), fill="blue", alpha=.1) + geom_line(color="steelblue")

# Boxplot
 library(MASS)
 names(birthwt)
 [1] "low"   "age"   "lwt"   "race"  "smoke" "ptl"   "ht"
 [8] "ui"    "ftv"   "bwt"
 ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
 ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot(width=.2)

Arrrr> ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot(width=.2) + scale_y_continuous(labels=(paste0(1:4, " K")), breaks=seq(1000, 4000, by = 1000)) + theme(axis.text.y=element_text(color="red")) + geom_vline(x=1.2, linetype="dashed", color="steelblue")

# Density plot
ggplot(faithful, aes(waiting)) + geom_density()
ggplot(faithful, aes(waiting)) + geom_density(fill="blue", alpha=0.1)
ggplot(faithful, aes(waiting)) + geom_line(stat="density", fill="blue")


# Themes
?theme

