# BTYD2

A patch for the `pnbd.LL()` function in the original [BTYD](http://cran.r-project.org/web/packages/BTYD/index.html) package, first proposed by [Theo Strinopoulos](https://github.com/theofilos). 

## Justification

In its original version the Pareto/NBD part of the BTYD packages failed for me, as it did for Theo, for reasons he explained [here](https://github.com/theofilos/BTYD). So, I implemented his fix, rebuilt from source, and then it worked.

BTYD2 is for the curious and impatient: you can install it now, side-by-side with the unaltered BTYD from CRAN. I also opened a pull request to the [GitHub-hosted version of BTYD](https://github.com/cran/BTYD). If it is accepted, BTYD2 will be obsolete. Until then, you can use it as an alternative.

## How to install

First `git clone`, then build the standard way, not with the `devtools` kit. The original BTYD package documentation is not compatible with `devtools::document()` and you risk obliterating most of your help files.

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

