# BTYD2

A patch for the `pnbd.LL()` function in the original [BTYD](http://cran.r-project.org/web/packages/BTYD/index.html) package, 
first proposed by [Theo Strinopoulos](https://github.com/theofilos). 

## Justification

In its original version the Pareto/NBD (pnbd) part of the BTYD package failed for me, as it did for Theo, for reasons he explained 
[here](https://github.com/theofilos/BTYD). So, I implemented his fix, rebuilt from source, and then it worked. This is the short
version. The long version is that in the process of implementing the fix I made some changes to the choice of optimization routine 
(now using `optimx` as opposed to `optim`), Gaussian hypergeometric (now you have the option of using the `hypergeo` package) and 
I found some opportunities for refactoring functions defined in both the `pnbd` and the `bgnbd` (Beta-Geometric Negative Binomial) 
groups. Finally, I rebuilt BTYD2
and checked that it would return the same numbers as BTYD did when running the examples in the original BTYD vignette (see 
threeway_walkthrough.R).

BTYD2 is for the curious and impatient: you can install it now, side-by-side with the unaltered BTYD from CRAN. There is a 
[GitHub-hosted version of BTYD](https://github.com/cran/BTYD) but it's read-only. If the original BTYD were still maintained, 
and there were a way to submit a pull request, I would. As it is, BTYD2 replicates the functionality of BTYD exactly in the 
set of functions whose names start with `dc` (data conversion) and `bgbb` (Beta-geometric/Beta-binomial model). 

This means that you could use BTYD2 like I do, to replace BTYD altogether, once you're satisfied that the patches it proposes 
to the `pnbd` and `bgnbd` groups of functions meet your needs. But, caveat emptor.

## How to install

First `git clone`, then __build the standard way, not with the `devtools` kit.__

So, at the command line, just do this:

```
R CMD build BTYD2
R CMD check BTYD2
```

And then at the R console do this:

```
install.packages("BTYD2_2.4.tar.gz", repos = NULL, type = "source")
system(paste('gunzip', file.path(.libPaths(), 'BTYD2', 'data', 'discreteSimElog.csv.gz')))
system(paste('gunzip', file.path(.libPaths(), 'BTYD2', 'data', 'cdnowElog.csv.gz')))
# works only in RStudio:
.rs.restartR()
```

That ought to work.

