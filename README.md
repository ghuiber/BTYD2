# BTYD2

A patch for the original [BTYD](http://cran.r-project.org/web/packages/BTYD/index.html)

In its original version the Pareto/NBD part of this failed for me for reasons explained [here](https://github.com/theofilos/BTYD). So, I implemented the fix that Theo Strinopoulos proposed, rebuilt from source, and then it worked.

To build and install after `git clone`, use the standard way, not the `devtools` kit. The original BTYD package documentation is not compatible with `devtools` and you risk obliterating most of your help files.

So, at the command line, just do this:

```
R CMD build BTYD2
R CMD check BTYD2
````

And then at the R console do this:

```
install.packages("BTYD2_2.4.tar.gz", repos = NULL, type = "source")
```

That ought to work.

