# BTYD2

A patch for the `pnbd.LL()` function in the original [BTYD](http://cran.r-project.org/web/packages/BTYD/index.html) package, first proposed by [Theo Strinopoulos](https://github.com/theofilos). 

## Justification

The original version of the `pnbd` (Pareto/NBD) part of the BTYD package failed for me, as it did for Theo, for reasons he explained [here](https://github.com/theofilos/BTYD). So, I implemented Theo's proposed log-sum-exp trick almost identically to his solution, rebuilt from source, and then it worked. This is the short version. The long version is that in the process of implementing the log-sum-exp fix I made some changes to the choice of optimization routine (now using `optimx` as opposed to `optim`), Gaussian hypergeometric (now you have the option of using the `hypergeo` package) and I found some opportunities for refactoring functions defined in both the `pnbd` and the `bgnbd` (Beta-Geometric Negative Binomial) groups. Along the way I defined some new supporting functions in the `dc` (data conversion) group. Finally, I rebuilt BTYD2 and checked that it would return the same numbers as BTYD did when running the examples in the original BTYD vignette (see threeway_walkthrough.R).

BTYD2 is for the curious and impatient: you can install it now, side-by-side with the unaltered BTYD from CRAN. There is a [GitHub-hosted version of BTYD](https://github.com/cran/BTYD) but it's read-only. If the original BTYD were still maintained, and there were a way to submit a pull request, I would. As it is, BTYD2 replicates the functionality of BTYD exactly in the original set of functions whose names start with `dc` (data conversion) and `bgbb` (Beta-geometric/Beta-binomial model) with one exception: there's an internal helper to `bgbb.LL`, called `addition`, which now also implements the log-sum-exp trick. 

This means that you could use BTYD2 like I do, to replace BTYD altogether, once you're satisfied that the patches it proposes 
to the `pnbd` and `bgnbd` groups of functions meet your needs. But, caveat emptor.

## How to install

The `devtools` way is the easiest: `install_github('ghuiber/BTYD2', build_vignettes = TRUE)`. 

## How to tinker

First `git clone`. Then, install it the devtools way: `document(); build(); install(build_vignettes = TRUE)`. If you want to build your cloned source package the standard way, it's a two-step process:

First, at the command line, do this:

```
R CMD build BTYD2
R CMD check BTYD2
```

Then, at the R console, do this:

```
install.packages("BTYD2_2.4.tar.gz", repos = NULL, type = "source")
system(paste('gunzip', file.path(.libPaths(), 'BTYD2', 'data', 'discreteSimElog.csv.gz')))
system(paste('gunzip', file.path(.libPaths(), 'BTYD2', 'data', 'cdnowElog.csv.gz')))
# works only in RStudio:
.rs.restartR()
```

If you change any functions or add yours, keep it modern: use `devtools` (while it's still [there](https://www.tidyverse.org/blog/2018/10/devtools-2-0-0/#conscious-uncoupling)) and follow the advice from [R Packages](https://r-pkgs.org). I went by the first edition and I only read the parts I needed as I went along to boot, but the general idea is to document your functions with Roxygen2 headers and do `document(); build(); install()` as often as needed. If that workflow is no longer the recommended way, do as [R Packages](https://r-pkgs.org) says. 

A work-in-progress example of BTYD2 extensions is in `R/equi.R`. See also `?ace_snackfoods`. 
