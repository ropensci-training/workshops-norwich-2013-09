
# Exercise 02

1. Take the `iris` dataset. Using `Species` as the indicator variable, convert the wide dataset to long such that it appears as below:

```
  Species     variable value
1  setosa Sepal.Length   5.1
2  setosa Sepal.Length   4.9
3  setosa Sepal.Length   4.7
4  setosa Sepal.Length   4.6
5  setosa Sepal.Length   5.0
6  setosa Sepal.Length   5.4
```

2.  Save this dataset to disk as `"species1.csv"`. Duplicate the previous function call and save it again as `"species2.csv"``

Write code that does the following:

* Reads all file names in your working directory with a `.csv` extension.  
* Treating that as a list, run the `read.csv` function on each item so you get a list of size 2 that contains all the data.

*Note: If this is a hard problem. Work with your neighbor*

3. With the list from the previous result, write a `lappy or llply` function call that will retrieve row number 1 from each dataset and return that back to a list.

---

