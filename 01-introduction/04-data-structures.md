
# Data structures in R

![The basic data types in R](data-types.png)

## Vectors

A vector is the basic data structure and the workhorse of R. Comes in two forms: 

* Atomic vectors
* Lists

Each vector has the following properties:

```coffee
typeof() # what is it?
length() # how long is it?
attributes() # does it have any metadata?
```

**Atomic vectors**

logical, integer, double (numeric), character

```coffee
x <- c(1,2,3)
mode(x)
y <- c("Alex", "Jason", "Brad")
mode(y)
```

```coffee
# A logical vector

x <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)
length(x)
x_num <- c(1, 3, 4,6, 14)
x_integers <- c(1L, 3L, 4L, 6L, 14L)
character <- c("This is a string", "This is another string")
```


## Lists

In R lists act as containers. Unlike atomic vectors, its contents are not restricted to a single mode and can encompass any data type. Lists are sometimes called recursive vectors, because a list can contain other lists. This makes them fundamentally different from atomic vectors. 
Create lists using `list` or coerce other objects using `as.list()`

```
x <- 1:10
x <- as.list(x)
length(x)
```

What is the class of `x[1]`?  
how about `x[[1]]`?

xlist <- list(a= "Karthik Ram", b= 1:10, data= head(iris))

what is the length of this object?
what about its structure?

List can contain as many lists nested inside.

```
temp <- list(list(list(list())))
temp
is.recursive(temp)
```


## Data Frames

A data frame is the most common way of storing data in R, and if used systematically (http://vita.had.co.nz/papers/tidy-data.pdf) make data analysis easier. Under the hood, a data frame is a list of equal-length vectors. This makes it a 2d dimensional structure, so it shares properties of both the matrix and the list. 

```coffee
df <- data.frame(id = c("a","b","c","d","e","f","g","h","i","j"), x = 1:10, y = rnorm(10))
str(df)
```

# Factors

The class attribute can be used to add new behaviour to atomic vectors. For example, the factor is a vector that can contain only predefined values, and is R's structure for dealing with qualitative data. Factors have two key attributes: their , "factor", which controls their behaviour; and their , the set of allowed values.

```
x <- factor(c("a", "b", "c", "f"))
x
class(x)

x[2] <- "x"
```

> While factors look (and often behave) like character vectors, they are actually integers under the hood, and you need to be careful when treating them like strings. Some string methods (like and ) will coerce factors to strings, while others (like ) will throw an error.


# Combining R objects

Most often you can just concatenate R objects using `c(...)`

```
x <- c(1, 2, 3)
y <- c(4, 5, 6)
c(x, y)
```

**Combining data frames**

```
df
> df
   id  x           y
1   a  1  1.56758558
2   b  2  0.09064817
3   c  3 -0.15613957
4   d  4  1.30902880
5   e  5  1.08658558
6   f  6 -0.04338139
7   g  7 -0.74708318
8   h  8  0.71568172
9   i  9  1.60303300
10  j 10 -1.22455994
```

`cbind(df, data.frame(z = 4))`

When you combine column wise, only row numbers need to match. If you are adding a vector, it will get repeated.


