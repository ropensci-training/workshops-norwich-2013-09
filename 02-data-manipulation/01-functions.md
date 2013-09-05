
# Writing functions in R

> If you have to repeat the same few lines of code more than once, then you really need to write a function.

A very basic function

```coffee
first <- function(x, y) {
    z <- x + y
    return(z)
}
```

## What does this function return?

```coffee
x <- 5
f <- function() {
y <- 10
c(x = x, y = y) }
f()
```

## What does this function return?

```coffee
x <- 5
g <- function() {
  x <- 20
  y <- 10
  c(x = x, y = y)
} g()
```

## What does this function return??

```coffee
x <- 5
h <- function() {
  y <- 10
  i <- function() {
z <- 20
    c(x = x, y = y, z = z)
  }
i() }
h()
```
