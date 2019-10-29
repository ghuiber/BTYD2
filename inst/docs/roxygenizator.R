# Run this from the command line with Rscript with
# one trailing argument that will be the name of your
# new BTYD package, such as:
# Rscript roxygenizator.R BTYD2

args <- commandArgs(trailingOnly = TRUE)
# When you roxygenise, you destroy the help files for 
# the original BTYD functions that you left unchanged,
# because those functions don't have Roxygen headers.
library("purrr")

# This script rebuilds them, if you have the original 
# BYTD source cloned somewhere. The most sensible place
# for it would be the BTYD sub-folder created by
# `$ git submodule add git@github.com:cran/BTYD.git`.
# But, wherever you keep it, declare the path to 
# that place as `btydpath` here, like so:
btydpath <- file.path(here::here(), 'BTYD')

# Whatever you named your version of the BTYD package
# (e.g. BTYD2) assign it to the `where` variable here:
where <- args[1]

# make sure the `vignettes` subdirectory is there
# and that it has a `figure` subdirectory of its own:
foo <- setwd(where)
dir.create(file.path('vignettes', 'figure'))
devtools::document()
setwd(foo)
rm(foo)
foo <- setwd(file.path(where, 'man'))

# a helper for getting the package version
getPackageVersion <- function(where) {
  x <- readLines(file.path(here::here(), 
                           where, 
                           'DESCRIPTION'))
  v <- 'Version: '
  gsub(pattern = v, 
       replacement = '', 
       x[grepl(v, x)])
}
# Obliterate the current source tarball
system(paste('rm', 
             paste(paste(where, 
                         getPackageVersion(where), 
                         sep = '_'), 
                   'tar.gz', 
                   sep = '.')))
## This section has obsolete .Rd files, 
## now produced from Roxygen headers. 
## They are listed here for reference. 

# system(paste('cp ', btydpath, '/man/pnbd.EstimateParameters.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.LL.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PAlive.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.ConditionalExpectedTransactions.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.DERT.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.pmf.General.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.pmf.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PlotFrequencyInCalibration.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PlotFreqVsConditionalExpectedFrequency.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.Plot.DERT.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PlotRecVsConditionalExpectedFrequency.Rd .', sep = ''))

# system(paste('cp ', btydpath, '/man/bgnbd.ConditionalExpectedTransactions.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.LL.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.EstimateParameters.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.Expectation.Rd .', sep = ''))

## This section has .Rd files that are still needed.
## That is unfortunate. Ideally, all functions would
## have Roxygen2 headers so you can do away with 
## copying .Rd files. Over time, build these headers
## from help files. As you do so, comment out the
## corresponding lines. That will give you a nice
## feeling of making progress. Also, when all are 
## commented you will be able to do the devtools 
## chain of document(); build(); install() and this 
## script will no longer be needed -- and neither will
## you need to keep a local copy of the original BTYD.

system(paste('cp ', btydpath, '/man/bgbb.ConditionalExpectedTransactions.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.DERT.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.EstimateParameters.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.Expectation.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.HeatmapHoldoutExpectedTrans.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.LL.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PAlive.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotDropoutRateHeterogeneity.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotFrequencyInCalibration.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotFrequencyInHoldout.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotFreqVsConditionalExpectedFrequency.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotRecVsConditionalExpectedFrequency.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotTrackingCum.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotTrackingInc.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PlotTransactionRateHeterogeneity.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.pmf.General.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.pmf.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PosteriorMeanDropoutRate.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PosteriorMeanLmProductMoment.Rd .', sep = ''))
system(paste('cp ', btydpath, '/man/bgbb.PosteriorMeanTransactionRate.Rd .', sep = ''))

# system(paste('cp ', btydpath, '/man/bgnbd.PAlive.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.compress.cbs.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.ExpectedCumulativeTransactions.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.PlotDropoutRateHeterogeneity.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.PlotFrequencyInCalibration.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.PlotFreqVsConditionalExpectedFrequency.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.PlotRecVsConditionalExpectedFrequency.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.PlotTrackingCum.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.PlotTrackingInc.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.PlotTransactionRateHeterogeneity.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.pmf.General.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/bgnbd.pmf.Rd .', sep = ''))

# system(paste('cp ', btydpath, '/man/dc.BuildCBTFromElog.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.BuildCBSFromCBTAndDates.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.check.model.params.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.CreateFreqCBT.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.CreateReachCBT.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.CreateSpendCBT.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.CumulativeToIncremental.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.DissipateElog.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.ElogToCbsCbt.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.FilterCustByBirth.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.GetFirstPurchasePeriodsFromCBT.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.GetLastPurchasePeriodsFromCBT.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.MakeRFmatrixCal.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.MakeRFmatrixHoldout.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.MakeRFmatrixSkeleton.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.MergeCustomers.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.MergeTransactionsOnSameDate.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.PlotLogLikelihoodContour.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.PlotLogLikelihoodContours.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.ReadLines.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.RemoveTimeBetween.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.SplitUpElogForRepeatTrans.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/dc.WriteLine.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/addLogs.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/subLogs.Rd .', sep = ''))

# system(paste('cp ', btydpath, '/man/pnbd.compress.cbs.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.Expectation.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.ExpectedCumulativeTransactions.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PlotDropoutRateHeterogeneity.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PlotTrackingCum.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PlotTrackingInc.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/pnbd.PlotTransactionRateHeterogeneity.Rd .', sep = ''))

# system(paste('cp ', btydpath, '/man/spend.EstimateParameters.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/spend.expected.value.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/spend.LL.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/spend.marginal.likelihood.Rd .', sep = ''))
# system(paste('cp ', btydpath, '/man/spend.plot.average.transaction.value.Rd .', sep = ''))

# # change BTYD references in .Rd files
# # copied from the original BTYD package
# # a helper for making edits in md files
# # (a crude hack, it will have to do)
# changeThis <- function(rdfile, 
#                        from = "BTYD", 
#                        to = where) {
#   readLines(rdfile) %>% 
#     gsub(pattern = from, 
#          replacement = to) %>% 
#     writeLines(con = rdfile)
# }
# c('dc.ReadLines.Rd', 
#   'dc.BuildCBSFromCBTAndDates.Rd', 
#   'dc.CreateFreqCBT.Rd', 
#   'dc.CreateReachCBT.Rd', 
#   'dc.CreateSpendCBT.Rd', 
#   'dc.ElogToCbsCbt.Rd', 
#   'dc.MakeRFmatrixCal.Rd', 
#   'dc.MergeCustomers.Rd', 
#   'dc.RemoveTimeBetween.Rd') %>%
#   map(changeThis)

setwd(foo)
rm(foo)
system(paste("cp", 
             "NAMESPACE", 
             paste(where, 
                   "NAMESPACE", 
                   sep = "/")))

# Now rebuild, re-install. This will throw an
# error if you screwed anything up. 
sourcepath <- file.path(here::here(), where)
system(paste('rm', 
             file.path(sourcepath, 
                       '.DS_Store')))
system(paste('rm -Rf', 
             file.path(sourcepath, 
                       'inst', 
                       'doc/')))
system(paste("R CMD build", where))
# Now check the build; but first,
# copy new vignette goods where 
# R CMD check wants to see them:
system(paste('cp -R', 
             file.path(sourcepath, 
                       'vignettes/'), 
             file.path(sourcepath, 
                       'inst/doc')))
system(paste("R CMD check", where))
# to build the reference manual directly:
# system(paste("rm", paste(where, "pdf", sep = ".")))
# system(paste("R CMD Rd2pdf", where))
# install the newest version:
remove.packages(where)
install.packages(paste(paste(where, 
                       getPackageVersion(where), 
                       sep = '_'), 
                       'tar.gz', 
                       sep = '.'), 
                 repos = NULL, 
                 type = 'source')
# you need this to run code examples from the vignette:
system(paste('gunzip', file.path(.libPaths(), where, 'data', 'discreteSimElog.csv.gz')))
system(paste('gunzip', file.path(.libPaths(), where, 'data', 'cdnowElog.csv.gz')))
# you need this to rebuild the help library, 
# but it only works if you're in RStudio already:
# .rs.restartR()
