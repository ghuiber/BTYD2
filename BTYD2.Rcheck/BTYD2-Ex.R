pkgname <- "BTYD2"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('BTYD2')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("bgbb.ConditionalExpectedTransactions")
### * bgbb.ConditionalExpectedTransactions

flush(stderr()); flush(stdout())

### Name: bgbb.ConditionalExpectedTransactions
### Title: BG/BB Conditional Expected Transactions
### Aliases: bgbb.ConditionalExpectedTransactions

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# the number of transactions a customer is expected
# to make in the 10 transaction opportunities
# following the calibration period, which consisted
# of 6 transaction opportunities (during which they
# made 3 transactions, the last of which occurred
# in the 4th opportunity)
bgbb.ConditionalExpectedTransactions(params, n.cal=6, n.star=10, x=3, t.x=4)

# We can also use vectors as input:
bgbb.ConditionalExpectedTransactions(params, n.cal=6, n.star=1:10, x=3, t.x=4)
bgbb.ConditionalExpectedTransactions(params, n.cal=6, n.star=10, x=1:4, t.x=4)



cleanEx()
nameEx("bgbb.DERT")
### * bgbb.DERT

flush(stderr()); flush(stdout())

### Name: bgbb.DERT
### Title: BG/BB Discounted Expected Residual Transactions
### Aliases: bgbb.DERT bgbb.rf.matrix.DERT

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# Compute DERT for a customer who made 3 transactions
# in the calibration period(consisting of 6 transaction
# opportunities), with the last transaction occurring
# during the 4th transaction opportunity, discounted at
# 10%.
bgbb.DERT(params, x=3, t.x=4, n.cal=6, d=0.1)

# We can also compare DERT for several customers:
bgbb.DERT(params, x=1:6, t.x=6, n.cal=6, d=0.1)

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# compute DERT for a customer from every row in rf.matrix,
# discounted at 10%.
bgbb.rf.matrix.DERT(est.params, rf.matrix, d=0.1)



cleanEx()
nameEx("bgbb.EstimateParameters")
### * bgbb.EstimateParameters

flush(stderr()); flush(stdout())

### Name: bgbb.EstimateParameters
### Title: BG/BB Parameter Estimation
### Aliases: bgbb.EstimateParameters

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)
# log-likelihood of estimated parameters
bgbb.rf.matrix.LL(est.params, rf.matrix)



cleanEx()
nameEx("bgbb.Expectation")
### * bgbb.Expectation

flush(stderr()); flush(stdout())

### Name: bgbb.Expectation
### Title: BG/BB Expectation
### Aliases: bgbb.Expectation

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# Expected number of transactions that a randomly chosen customer
# will make in the first 10 transaction opportunities.
bgbb.Expectation(params, n=10)

# We can also compare expected transactions over time:
bgbb.Expectation(params, n=1:10)



cleanEx()
nameEx("bgbb.HeatmapHoldoutExpectedTrans")
### * bgbb.HeatmapHoldoutExpectedTrans

flush(stderr()); flush(stdout())

### Name: bgbb.HeatmapHoldoutExpectedTrans
### Title: BG/BB Heatmap of Holdout Period Expected Transactions
### Aliases: bgbb.HeatmapHoldoutExpectedTrans

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# Plot a heatmap of conditional expected transactions in
# a holdout period of 5 transaction opportunities, given
# that the calibration period consisted of 6 transaction
# opportunities.
bgbb.HeatmapHoldoutExpectedTrans(est.params, n.cal=6, n.star=5)



cleanEx()
nameEx("bgbb.LL")
### * bgbb.LL

flush(stderr()); flush(stdout())

### Name: bgbb.LL
### Title: BG/BB Log-Likelihood
### Aliases: bgbb.LL bgbb.rf.matrix.LL

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

params <- c(1.20, 0.75, 0.66, 2.78)
bgbb.rf.matrix.LL(params, rf.matrix)

# Returns the log likelihood of the parameters for a customer who
# made 3 transactions in a calibration period with 6 transaction opportunities,
# with the last transaction occurring during the 4th transaction opportunity.
bgbb.LL(params, x=3, t.x=4, n.cal=6)

# We can also give vectors as function parameters:
set.seed(7)
x <- sample(1:3, 10, replace = TRUE)
t.x <- sample(3:5, 10, replace = TRUE)
n.cal <- rep(5, 10)
bgbb.LL(params, x, t.x, n.cal)



cleanEx()
nameEx("bgbb.PAlive")
### * bgbb.PAlive

flush(stderr()); flush(stdout())

### Name: bgbb.PAlive
### Title: BG/BB P(Alive)
### Aliases: bgbb.PAlive

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)

# The probability that a customer who made 3 transactions in
# the calibration period (which consisted of 6 transaction
# opportunities), with the last transaction occurring at the
# 4th transaction opportunity, is alive at the 7th transaction
# opportunity
bgbb.PAlive(params, x=3, t.x=4, n.cal=6)

# The input parameters may also be vectors:
bgbb.PAlive(params, x=1, t.x=1:6, n.cal=6)



cleanEx()
nameEx("bgbb.PlotDropoutRateHeterogeneity")
### * bgbb.PlotDropoutRateHeterogeneity

flush(stderr()); flush(stdout())

### Name: bgbb.PlotDropoutRateHeterogeneity
### Title: BG/BB Plot Dropout Rate Heterogeneity
### Aliases: bgbb.PlotDropoutRateHeterogeneity

### ** Examples

params <- c(1.2, 0.75, 0.66, 2.78)
bgbb.PlotDropoutRateHeterogeneity(params)
params <- c(0.2, 1.5, 3.2, 6)
bgbb.PlotDropoutRateHeterogeneity(params)



cleanEx()
nameEx("bgbb.PlotFreqVsConditionalExpectedFrequency")
### * bgbb.PlotFreqVsConditionalExpectedFrequency

flush(stderr()); flush(stdout())

### Name: bgbb.PlotFreqVsConditionalExpectedFrequency
### Title: BG/BB Plot Frequency vs Conditional Expected Frequency
### Aliases: bgbb.PlotFreqVsConditionalExpectedFrequency

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the holdout period transactions
x.star <- donationsSummary$x.star

# number of transaction opportunities in the holdout period
n.star <- 5

# Plot holdout period transactions
bgbb.PlotFreqVsConditionalExpectedFrequency(est.params, n.star, rf.matrix, x.star, trunc=6)



cleanEx()
nameEx("bgbb.PlotFrequencyInCalibration")
### * bgbb.PlotFrequencyInCalibration

flush(stderr()); flush(stdout())

### Name: bgbb.PlotFrequencyInCalibration
### Title: BG/BB Plot Frequency in Calibration Period
### Aliases: bgbb.PlotFrequencyInCalibration

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# plot actual vs. expected frequencies in the calibration period
bgbb.PlotFrequencyInCalibration(est.params, rf.matrix)



cleanEx()
nameEx("bgbb.PlotFrequencyInHoldout")
### * bgbb.PlotFrequencyInHoldout

flush(stderr()); flush(stdout())

### Name: bgbb.PlotFrequencyInHoldout
### Title: BG/BB Plot Frequency in Holdout
### Aliases: bgbb.PlotFrequencyInHoldout

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
rf.matrix.holdout <- donationsSummary$rf.matrix.holdout
# donationsSummary$rf.matrix and donationsSummary$rf.matrix.holdout already
# have appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# number of periods in the calibration period
n.cal = max(rf.matrix[,"n.cal"])

bgbb.PlotFrequencyInHoldout (est.params, n.cal, rf.matrix.holdout)



cleanEx()
nameEx("bgbb.PlotRecVsConditionalExpectedFrequency")
### * bgbb.PlotRecVsConditionalExpectedFrequency

flush(stderr()); flush(stdout())

### Name: bgbb.PlotRecVsConditionalExpectedFrequency
### Title: BG/BB Plot Recency vs Conditional Expected Frequency
### Aliases: bgbb.PlotRecVsConditionalExpectedFrequency

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the holdout period transactions
x.star <- donationsSummary$x.star

# number of transaction opportunities in the holdout period
n.star <- 5

# Compare holdout period transactions.
bgbb.PlotRecVsConditionalExpectedFrequency(est.params, n.star, rf.matrix, x.star, trunc=6)



cleanEx()
nameEx("bgbb.PlotTrackingCum")
### * bgbb.PlotTrackingCum

flush(stderr()); flush(stdout())

### Name: bgbb.PlotTrackingCum
### Title: BG/BB Tracking Cumulative Transactions Plot
### Aliases: bgbb.PlotTrackingCum

### ** Examples

data(donationsSummary)
# donationsSummary$rf.matrix already has appropriate column names
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the annual repeat transactions, and transform them into
# a cumulative form
actual.inc.repeat.transactions <- donationsSummary$annual.trans
actual.cum.repeat.transactions <- cumsum(actual.inc.repeat.transactions)

# set appropriate x-axis
x.tickmarks <- c( "'96","'97","'98","'99","'00","'01","'02","'03","'04","'05","'06" )

# plot actual vs. expected transactions. The calibration period was 6 periods long.
bgbb.PlotTrackingCum(est.params, rf.matrix, actual.cum.repeat.transactions, xticklab=x.tickmarks)



cleanEx()
nameEx("bgbb.PlotTrackingInc")
### * bgbb.PlotTrackingInc

flush(stderr()); flush(stdout())

### Name: bgbb.PlotTrackingInc
### Title: BG/BB Tracking Incremental Transactions Plot
### Aliases: bgbb.PlotTrackingInc

### ** Examples

data(donationsSummary)
# donationsSummary$rf.matrix already has appropriate column names
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the annual repeat transactions
actual.inc.repeat.transactions <- donationsSummary$annual.trans

# Set appropriate x-axis
x.tickmarks <- c( "'96","'97","'98","'99","'00","'01","'02","'03","'04","'05","'06" )

# Plot actual vs. expected transactions. The calibration period was 6 periods long.
bgbb.PlotTrackingInc(est.params, rf.matrix, actual.inc.repeat.transactions, xticklab=x.tickmarks)



cleanEx()
nameEx("bgbb.PlotTransactionRateHeterogeneity")
### * bgbb.PlotTransactionRateHeterogeneity

flush(stderr()); flush(stdout())

### Name: bgbb.PlotTransactionRateHeterogeneity
### Title: BG/BB Plot Transaction Rate Heterogeneity
### Aliases: bgbb.PlotTransactionRateHeterogeneity

### ** Examples

params <- c(1.2, 0.75, 0.66, 2.78)
bgbb.PlotTransactionRateHeterogeneity(params)
params <- c(0.2, 1.5, 3.2, 6)
bgbb.PlotTransactionRateHeterogeneity(params)



cleanEx()
nameEx("bgbb.PosteriorMeanDropoutRate")
### * bgbb.PosteriorMeanDropoutRate

flush(stderr()); flush(stdout())

### Name: bgbb.PosteriorMeanDropoutRate
### Title: BG/BB Posterior Mean Dropout Rate
### Aliases: bgbb.PosteriorMeanDropoutRate
###   bgbb.rf.matrix.PosteriorMeanDropoutRate

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# return the posterior mean dropout rate vector
bgbb.rf.matrix.PosteriorMeanDropoutRate(est.params, rf.matrix)



cleanEx()
nameEx("bgbb.PosteriorMeanTransactionRate")
### * bgbb.PosteriorMeanTransactionRate

flush(stderr()); flush(stdout())

### Name: bgbb.PosteriorMeanTransactionRate
### Title: BG/BB Posterior Mean Transaction Rate
### Aliases: bgbb.PosteriorMeanTransactionRate
###   bgbb.rf.matrix.PosteriorMeanTransactionRate

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# return the posterior mean transaction rate vector
bgbb.rf.matrix.PosteriorMeanTransactionRate(est.params, rf.matrix)



cleanEx()
nameEx("bgbb.pmf.General")
### * bgbb.pmf.General

flush(stderr()); flush(stdout())

### Name: bgbb.pmf.General
### Title: BG/BB General Probability Mass Function
### Aliases: bgbb.pmf.General

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# Probability that a customer will make 3 transactions in the 10
# transaction opportunities following the 6 transaction opportunities
# in the calibration period, given BG/BB parameters.
bgbb.pmf.General(params, n.cal=6, n.star=10, x.star=3)

# Vectors may also be provided as input:
# Comparison between different frequencies:
bgbb.pmf.General(params, n.cal=6, n.star=10, x.star=1:10)
# Comparison between different holdout transaction opportunities:
bgbb.pmf.General(params, n.cal=6, n.star=5:15, x.star=3)



cleanEx()
nameEx("bgbb.pmf")
### * bgbb.pmf

flush(stderr()); flush(stdout())

### Name: bgbb.pmf
### Title: BG/BB Probability Mass Function
### Aliases: bgbb.pmf

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# The probability that a customer made 3 transactions in the first
# 6 transaction opportunities.
bgbb.pmf(params, n=6, x=3)

# Vectors may also be used as arguments:
bgbb.pmf(params, n=6, x=0:6)



cleanEx()
nameEx("bgnbd.ConditionalExpectedTransactions")
### * bgnbd.ConditionalExpectedTransactions

flush(stderr()); flush(stdout())

### Name: bgnbd.ConditionalExpectedTransactions
### Title: BG/NBD Conditional Expected Transactions
### Aliases: bgnbd.ConditionalExpectedTransactions

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
# Number of transactions a customer is expected to make in 2 time
# intervals, given that they made 10 repeat transactions in a time period
# of 39 intervals, with the 10th repeat transaction occurring in the 35th
# interval.
bgnbd.ConditionalExpectedTransactions(params, T.star=2, x=10, t.x=35, T.cal=39)

# We can also compare expected transactions across different
# calibration period behaviors:
bgnbd.ConditionalExpectedTransactions(params, T.star=2, x=5:20, t.x=25, T.cal=39)



cleanEx()
nameEx("bgnbd.EstimateParameters")
### * bgnbd.EstimateParameters

flush(stderr()); flush(stdout())

### Name: bgnbd.EstimateParameters
### Title: BG/NBD Parameter Estimation
### Aliases: bgnbd.EstimateParameters

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# starting-point parameters
startingparams <- c(1.0, 3, 1.0, 3)
# estimated parameters
est.params <- bgnbd.EstimateParameters(cal.cbs, startingparams)

# log-likelihood of estimated parameters
bgnbd.cbs.LL(est.params, cal.cbs)



cleanEx()
nameEx("bgnbd.Expectation")
### * bgnbd.Expectation

flush(stderr()); flush(stdout())

### Name: bgnbd.Expectation
### Title: BG/NBD Expectation
### Aliases: bgnbd.Expectation

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)

# Number of repeat transactions a customer is expected to make in 2 time intervals.
bgnbd.Expectation(params, t=2)

# We can also compare expected transactions over time:
bgnbd.Expectation(params, t=1:10)



cleanEx()
nameEx("bgnbd.ExpectedCumulativeTransactions")
### * bgnbd.ExpectedCumulativeTransactions

flush(stderr()); flush(stdout())

### Name: bgnbd.ExpectedCumulativeTransactions
### Title: BG/NBD Expected Cumulative Transactions
### Aliases: bgnbd.ExpectedCumulativeTransactions

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

params <- c(0.243, 4.414, 0.793, 2.426)

# Returns a vector containing cumulative repeat transactions for 273 days.
# All parameters are in weeks; the calibration period lasted 39 weeks.
bgnbd.ExpectedCumulativeTransactions(params, T.cal=cal.cbs[,"T.cal"], T.tot=39, n.periods.final=273)



cleanEx()
nameEx("bgnbd.LL")
### * bgnbd.LL

flush(stderr()); flush(stdout())

### Name: bgnbd.LL
### Title: BG/NBD Log-Likelihood
### Aliases: bgnbd.LL bgnbd.cbs.LL

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# random assignment of parameters
params <- c(0.5, 6, 1.2, 3.3)
# returns the log-likelihood of the given parameters
bgnbd.cbs.LL (params, cal.cbs)

# compare the speed and results to the following:
cal.cbs.compressed <- bgnbd.compress.cbs(cal.cbs)
bgnbd.cbs.LL (params, cal.cbs.compressed)

# Returns the log likelihood of the parameters for a customer who
# made 3 transactions in a calibration period that ended at t=6,
# with the last transaction occurring at t=4.
bgnbd.LL(params, x=3, t.x=4, T.cal=6)

# We can also give vectors as function parameters:
set.seed(7)
x <- sample(1:4, 10, replace = TRUE)
t.x <- sample(1:4, 10, replace = TRUE)
T.cal <- rep(4, 10)
bgnbd.LL(params, x, t.x, T.cal)



cleanEx()
nameEx("bgnbd.PAlive")
### * bgnbd.PAlive

flush(stderr()); flush(stdout())

### Name: bgnbd.PAlive
### Title: BG/NBD P(Alive)
### Aliases: bgnbd.PAlive

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)

bgnbd.PAlive(params, x=23, t.x=39, T.cal=39)
# P(Alive) of a customer who has the same recency and total
# time observed.

bgnbd.PAlive(params, x=5:20, t.x=30, T.cal=39)
# Note the "increasing frequency paradox".

# To visualize the distribution of P(Alive) across customers:

data(cdnowSummary)
cbs <- cdnowSummary$cbs
params <- bgnbd.EstimateParameters(cbs, par.start = c(0.243, 4.414, 0.793, 2.426))
p.alives <- bgnbd.PAlive(params, cbs[,"x"], cbs[,"t.x"], cbs[,"T.cal"])
plot(density(p.alives))



cleanEx()
nameEx("bgnbd.PlotDropoutRateHeterogeneity")
### * bgnbd.PlotDropoutRateHeterogeneity

flush(stderr()); flush(stdout())

### Name: bgnbd.PlotDropoutRateHeterogeneity
### Title: BG/NBD Plot Dropout Probability Heterogeneity
### Aliases: bgnbd.PlotDropoutRateHeterogeneity

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
bgnbd.PlotDropoutRateHeterogeneity(params)
params <- c(0.243, 4.414, 1.33, 2.426)
bgnbd.PlotDropoutRateHeterogeneity(params)



cleanEx()
nameEx("bgnbd.PlotFreqVsConditionalExpectedFrequency")
### * bgnbd.PlotFreqVsConditionalExpectedFrequency

flush(stderr()); flush(stdout())

### Name: bgnbd.PlotFreqVsConditionalExpectedFrequency
### Title: BG/NBD Plot Frequency vs. Conditional Expected Frequency
### Aliases: bgnbd.PlotFreqVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks
# following the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)
# the maximum censor number that can be used
max(cal.cbs[,"x"])

# plot conditional expected holdout period frequencies,
# binned according to calibration period frequencies
bgnbd.PlotFreqVsConditionalExpectedFrequency(est.params, T.star=39, cal.cbs, x.star, censor=7)



cleanEx()
nameEx("bgnbd.PlotFrequencyInCalibration")
### * bgnbd.PlotFrequencyInCalibration

flush(stderr()); flush(stdout())

### Name: bgnbd.PlotFrequencyInCalibration
### Title: BG/NBD Plot Frequency in Calibration Period
### Aliases: bgnbd.PlotFrequencyInCalibration

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)
# the maximum censor number that can be used
max(cal.cbs[,"x"])

bgnbd.PlotFrequencyInCalibration(est.params, cal.cbs, censor=7)



cleanEx()
nameEx("bgnbd.PlotRecVsConditionalExpectedFrequency")
### * bgnbd.PlotRecVsConditionalExpectedFrequency

flush(stderr()); flush(stdout())

### Name: bgnbd.PlotRecVsConditionalExpectedFrequency
### Title: BG/NBD Plot Actual vs. Conditional Expected Frequency by Recency
### Aliases: bgnbd.PlotRecVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks following
# the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)

# plot conditional expected holdout period transactions, binned according to
# calibration period recencies
bgnbd.PlotRecVsConditionalExpectedFrequency(est.params, cal.cbs, T.star=39, x.star)



cleanEx()
nameEx("bgnbd.PlotTrackingCum")
### * bgnbd.PlotTrackingCum

flush(stderr()); flush(stdout())

### Name: bgnbd.PlotTrackingCum
### Title: BG/NBD Tracking Cumulative Transactions Plot
### Aliases: bgnbd.PlotTrackingCum

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# Cumulative repeat transactions made by all customers across calibration
# and holdout periods
cu.tracking <- cdnowSummary$cu.tracking

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)

# All parameters are in weeks; the calibration period lasted 39
# weeks and the holdout period another 39.
bgnbd.PlotTrackingCum(est.params, T.cal=cal.cbs[,"T.cal"], T.tot=78, cu.tracking)



cleanEx()
nameEx("bgnbd.PlotTrackingInc")
### * bgnbd.PlotTrackingInc

flush(stderr()); flush(stdout())

### Name: bgnbd.PlotTrackingInc
### Title: BG/NBD Tracking Incremental Transactions Comparison
### Aliases: bgnbd.PlotTrackingInc

### ** Examples

data(cdnowSummary)
cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# Cumulative repeat transactions made by all customers across calibration
# and holdout periods
cu.tracking <- cdnowSummary$cu.tracking
# make the tracking data incremental
inc.tracking <- dc.CumulativeToIncremental(cu.tracking)

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)

# All parameters are in weeks; the calibration period lasted 39
# weeks and the holdout period another 39.
bgnbd.PlotTrackingInc(est.params, T.cal=cal.cbs[,"T.cal"], T.tot=78, inc.tracking)



cleanEx()
nameEx("bgnbd.PlotTransactionRateHeterogeneity")
### * bgnbd.PlotTransactionRateHeterogeneity

flush(stderr()); flush(stdout())

### Name: bgnbd.PlotTransactionRateHeterogeneity
### Title: BG/NBD Plot Transaction Rate Heterogeneity
### Aliases: bgnbd.PlotTransactionRateHeterogeneity

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
bgnbd.PlotTransactionRateHeterogeneity(params)
params <- c(0.53, 4.414, 0.793, 2.426)
bgnbd.PlotTransactionRateHeterogeneity(params)



cleanEx()
nameEx("bgnbd.compress.cbs")
### * bgnbd.compress.cbs

flush(stderr()); flush(stdout())

### Name: bgnbd.compress.cbs
### Title: Compress Customer-by-Sufficient-Statistic Matrix
### Aliases: bgnbd.compress.cbs

### ** Examples

# Create a sample customer-by-sufficient-statistic matrix:
set.seed(7)
x <- sample(1:4, 10, replace = TRUE)
t.x <- sample(1:4, 10, replace = TRUE)
T.cal <- rep(4, 10)
ave.spend <- sample(10:20, 10, replace = TRUE)
cbs <- cbind(x, t.x, T.cal, ave.spend)
cbs

# If cbs is printed, you would note that the following
# sets of rows have the same x, t.x and T.cal:
# (1, 6, 8); (3, 9)

bgnbd.compress.cbs(cbs, 0)   # No rounding necessary

# Note that all additional columns (in this case, ave.spend)
# are aggregated by sum.



cleanEx()
nameEx("bgnbd.pmf.General")
### * bgnbd.pmf.General

flush(stderr()); flush(stdout())

### Name: bgnbd.pmf.General
### Title: Generalized BG/NBD Probability Mass Function
### Aliases: bgnbd.pmf.General

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
# probability that a customer will make 10 repeat transactions in the
# time interval (1,2]
bgnbd.pmf.General(params, t.start=1, t.end=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (39,78]
bgnbd.pmf.General(params, t.start=39, t.end=78, x=0)



cleanEx()
nameEx("bgnbd.pmf")
### * bgnbd.pmf

flush(stderr()); flush(stdout())

### Name: bgnbd.pmf
### Title: BG/NBD Probability Mass Function
### Aliases: bgnbd.pmf

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
# probability that a customer will make 10 repeat transactions in the
# time interval (0,2]
bgnbd.pmf(params, t=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (0,39]
bgnbd.pmf(params, t=39, x=0)

# Vectors may also be used as arguments:
bgnbd.pmf(params, t=30, x=11:20)



cleanEx()
nameEx("dc.BuildCBSFromCBTAndDates")
### * dc.BuildCBSFromCBTAndDates

flush(stderr()); flush(stdout())

### Name: dc.BuildCBSFromCBTAndDates
### Title: Build CBS matrix from CBT matrix
### Aliases: dc.BuildCBSFromCBTAndDates

### ** Examples

elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

# Transaction-flow models are about interpurchase times. Since we
# only know purchase times to the day, we merge all transaction on
# the same day. This example uses dc.MergeTransactionsOnSameDate
# to illustrate this; however, we could have simply used dc.CreateReachCBT
# instead of dc.CreateFreqCBT to obtain the same result.
merged.elog <- dc.MergeTransactionsOnSameDate(elog)
cutoff.date <- as.Date("1997-09-30")
freq.cbt <- dc.CreateFreqCBT(merged.elog)
cal.freq.cbt <- freq.cbt[,as.Date(colnames(freq.cbt)) <= cutoff.date]
holdout.freq.cbt <- freq.cbt[,as.Date(colnames(freq.cbt)) > cutoff.date]

cal.start.dates.indices <- dc.GetFirstPurchasePeriodsFromCBT(cal.freq.cbt)
cal.start.dates <- as.Date(colnames(cal.freq.cbt)[cal.start.dates.indices])
cal.end.dates.indices <- dc.GetLastPurchasePeriodsFromCBT(cal.freq.cbt)
cal.end.dates <- as.Date(colnames(cal.freq.cbt)[cal.end.dates.indices])
T.cal.total <- rep(cutoff.date, nrow(cal.freq.cbt))
cal.dates <- data.frame(cal.start.dates, cal.end.dates, T.cal.total)

# Create calibration period customer-by-sufficient-statistic data frame,
# using weeks as the unit of time.
cal.cbs <- dc.BuildCBSFromCBTAndDates(cal.freq.cbt, cal.dates,
	per="week", cbt.is.during.cal.period=TRUE)
# Force the calibration period customer-by-sufficient-statistic to only contain
# repeat transactions (required by BG/BB and Pareto/NBD models)
cal.cbs[,"x"] <- cal.cbs[,"x"] - 1

holdout.start <- cutoff.date+1
holdout.end <- as.Date(colnames(holdout.freq.cbt)[ncol(holdout.freq.cbt)])
holdout.dates <- c(holdout.start, holdout.end)

# Create holdout period customer-by-sufficient-statistic data frame, using weeks
# as the unit of time.
holdout.cbs <- dc.BuildCBSFromCBTAndDates(holdout.freq.cbt, holdout.dates,
	per="week", cbt.is.during.cal.period=FALSE)



cleanEx()
nameEx("dc.CreateFreqCBT")
### * dc.CreateFreqCBT

flush(stderr()); flush(stdout())

### Name: dc.CreateFreqCBT
### Title: Create Frequency Customer-by-Time Matrix
### Aliases: dc.CreateFreqCBT

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)

# Given that the dates are in the order year-month-day,
# it is not strictly necessary to convert the date column
# to date formats. However, it is good practice:
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

freq.cbt <- dc.CreateFreqCBT(elog)



cleanEx()
nameEx("dc.CreateReachCBT")
### * dc.CreateReachCBT

flush(stderr()); flush(stdout())

### Name: dc.CreateReachCBT
### Title: Create Reach Customer-by-Time Matrix
### Aliases: dc.CreateReachCBT

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)

# Given that the dates are in the order year-month-day,
# it is not strictly necessary to convert the date column
# to date formats. However, it is good practice:
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

reach.cbt <- dc.CreateReachCBT(elog)



cleanEx()
nameEx("dc.CreateSpendCBT")
### * dc.CreateSpendCBT

flush(stderr()); flush(stdout())

### Name: dc.CreateSpendCBT
### Title: Create Spend Customer-by-Time Matrix
### Aliases: dc.CreateSpendCBT

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5);

# Given that the dates are in the order year-month-day,
# it is not strictly necessary to convert the date column
# to date formats. However, it is good practice:
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

spend.cbt <- dc.CreateSpendCBT(elog)



cleanEx()
nameEx("dc.ElogToCbsCbt")
### * dc.ElogToCbsCbt

flush(stderr()); flush(stdout())

### Name: dc.ElogToCbsCbt
### Title: Convernt Event Log to CBS and CBT Matrices
### Aliases: dc.ElogToCbsCbt

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)

elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

data <- dc.ElogToCbsCbt(elog, per="week", T.cal=as.Date("1997-09-30"))



cleanEx()
nameEx("dc.MakeRFmatrixCal")
### * dc.MakeRFmatrixCal

flush(stderr()); flush(stdout())

### Name: dc.MakeRFmatrixCal
### Title: Make Calibration Period Recency-Frequency Matrix
### Aliases: dc.MakeRFmatrixCal

### ** Examples

elog <- dc.ReadLines(system.file("data/discreteSimElog.csv", package="BTYD"),1,2)
elog[,"date"] <- as.Date(elog[,"date"])

cutoff.date <- as.Date("1977-01-01")
cbt <- dc.CreateReachCBT(elog)
cal.cbt <- cbt[,as.Date(colnames(cbt)) <= cutoff.date]
holdout.cbt <- cbt[,as.Date(colnames(cbt)) > cutoff.date]

cal.start.dates.indices <- dc.GetFirstPurchasePeriodsFromCBT(cal.cbt)
cal.start.dates <- as.Date(colnames(cal.cbt)[cal.start.dates.indices])
cal.end.dates.indices <- dc.GetLastPurchasePeriodsFromCBT(cal.cbt)
cal.end.dates <- as.Date(colnames(cal.cbt)[cal.end.dates.indices])
T.cal.total <- rep(cutoff.date, nrow(cal.cbt))
cal.dates <- data.frame(cal.start.dates, cal.end.dates, T.cal.total)

# Create calibration period customer-by-sufficient-statistic data frame,
# using years as the unit of time.
cal.cbs <- dc.BuildCBSFromCBTAndDates(cal.cbt, cal.dates, per="year",
	cbt.is.during.cal.period=TRUE)

holdout.start <- as.Date(colnames(holdout.cbt)[1])
holdout.end <- as.Date(tail(colnames(holdout.cbt),n=1))
# The (-1) below is to remove the effect of the birth period - we are only
# interested in repeat transactions in the calibration period.
frequencies <- (cal.cbs[,"x"] - 1)
periods.of.final.purchases <- cal.cbs[,"t.x"]
num.of.purchase.periods <- ncol(cal.cbt) - 1

# Create a calibration period recency-frequency matrix
cal.rf.matrix <- dc.MakeRFmatrixCal(frequencies, periods.of.final.purchases,
	num.of.purchase.periods)



cleanEx()
nameEx("dc.MergeCustomers")
### * dc.MergeCustomers

flush(stderr()); flush(stdout())

### Name: dc.MergeCustomers
### Title: Merge Customers
### Aliases: dc.MergeCustomers

### ** Examples

elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")
cutoff.date <- as.Date("1997-09-30")
cal.elog <- elog[which(elog[,"date"] <= cutoff.date),]
holdout.elog <- elog[which(elog[,"date"] > cutoff.date),]

# Create calibration period CBT from cal.elog
cal.reach.cbt <- dc.CreateReachCBT(cal.elog)
# Create holdout period CBT from holdout.elog
holdout.reach.cbt <- dc.CreateReachCBT(holdout.elog)

# Note the difference:
nrow(cal.reach.cbt)            # 2357 customers
nrow(holdout.reach.cbt)        # 684 customers

# Create a "fixed" holdout period CBT, with the same number
# of customers in the same order as the calibration period CBT
fixed.holdout.reach.cbt <- dc.MergeCustomers(cal.reach.cbt, holdout.reach.cbt)
nrow(fixed.holdout.reach.cbt)  # 2357 customers

# You can verify that the above is correct by turning these into a CBS
# (see \code{dc.BuildCBSFromCBTAndDates} and using
# \code{pnbd.PlotFreqVsConditionalExpectedFrequency}, for example

# Alternatively, we can fix the CBS, instead of the CBS:

cal.start.dates.indices <- dc.GetFirstPurchasePeriodsFromCBT(cal.reach.cbt)
cal.start.dates <- as.Date(colnames(cal.reach.cbt)[cal.start.dates.indices])
cal.end.dates.indices <- dc.GetLastPurchasePeriodsFromCBT(cal.reach.cbt)
cal.end.dates <- as.Date(colnames(cal.reach.cbt)[cal.end.dates.indices])
T.cal.total <- rep(cutoff.date, nrow(cal.reach.cbt))
cal.dates <- data.frame(cal.start.dates, cal.end.dates, T.cal.total)

# Create calibration period customer-by-sufficient-statistic data frame,
# using weeks as the unit of time.
cal.cbs <- dc.BuildCBSFromCBTAndDates(cal.reach.cbt, cal.dates, per="week",
	cbt.is.during.cal.period=TRUE)

# Force the calibration period customer-by-sufficient-statistic to only
# 	contain repeat transactions (required by BG/BB and Pareto/NBD models)
cal.cbs[,"x"] <- cal.cbs[,"x"] - 1

holdout.start <- cutoff.date+1
holdout.end <- as.Date(colnames(fixed.holdout.reach.cbt)[ncol(fixed.holdout.reach.cbt)])
holdout.dates <- c(holdout.start, holdout.end)

# Create holdout period customer-by-sufficient-statistic data frame,
# using weeks as the unit of time.
holdout.cbs <- dc.BuildCBSFromCBTAndDates(holdout.reach.cbt, holdout.dates,
	per="week", cbt.is.during.cal.period=FALSE)

# Note the difference:
nrow(cal.cbs)            # 2357 customers
nrow(holdout.cbs)        # 684 customers

# Create a "fixed" holdout period CBS, with the same number
# of customers in the same order as the calibration period CBS
fixed.holdout.cbs <- dc.MergeCustomers(cal.cbs, holdout.cbs)
nrow(fixed.holdout.cbs)  # 2357 customers

# Furthermore, this function will assign a zero value to all fields
# that were not in the original holdout period CBS. Since T.star is the
# same for all customers in the holdout period, we should fix that:
fixed.holdout.cbs[,"T.star"] <- rep(max(fixed.holdout.cbs[,"T.star"]),nrow(fixed.holdout.cbs))



cleanEx()
nameEx("dc.PlotLogLikelihoodContour")
### * dc.PlotLogLikelihoodContour

flush(stderr()); flush(stdout())

### Name: dc.PlotLogLikelihoodContour
### Title: Plot Log-Likelihood Contour
### Aliases: dc.PlotLogLikelihoodContour

### ** Examples

# **Examples for BG/BB model:
data(donationsSummary)
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
bgbb.startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
bgbb.est.params <- bgbb.EstimateParameters(rf.matrix, bgbb.startingparams)

# set up parameter names for a more descriptive result
bgbb.param.names <- c("alpha", "beta", "gamma", "delta")

# plot a log-likelihood contour of alpha and beta, the unobserved
# parameters for the beta-Bernoulli transaction process of the BG/BB.
# Note that allow.neg.params has been set to false as BG/BB parameters
# cannot be negative (not run):
# dc.PlotLogLikelihoodContour(bgbb.rf.matrix.LL, c("vary", "vary", "fix", "fix"),
#                            bgbb.est.params, rf.matrix = rf.matrix, n.divs = 15,
#                            num.contour.lines = 15, zoom.percent = 0.2,
#                            allow.neg.params = FALSE, param.names = bgbb.param.names)

# plot a log-likelihood contour of gamma and delta, the unobserved
# parameters for the beta-geometric dropout process of the BG/BB.
# Note that allow.neg.params has been set to false as BG/BB parameters
# cannot be negative (not run):
# dc.PlotLogLikelihoodContour(bgbb.rf.matrix.LL, c("fix", "fix", "vary", "vary"),
#                            bgbb.est.params, rf.matrix = rf.matrix, n.divs = 15,
#                            num.contour.lines = 15, zoom.percent = 0.2,
#                            allow.neg.params = FALSE, param.names = bgbb.param.names)

# **Example for Pareto/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# Speed up calculations:
cbs <- pnbd.compress.cbs(cbs)

# parameters estimated using pnbd.EstimateParameters
pnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
pnbd.param.names <- c("r", "alpha", "s", "beta")

# plot a log-likelihood contour of r and s, the shape parameters
# of the transaction and dropout process models (respectively).
# Note that allow.neg.params has been set to false as Pareto/NBD
# parameters cannot be negative (not run):
# dc.PlotLogLikelihoodContour(pnbd.cbs.LL, c("vary", "fix", "vary", "fix"),
#                            pnbd.est.params, cal.cbs = cbs, n.divs = 20,
#                            num.contour.lines = 20, zoom.percent = 0.1,
#                            allow.neg.params = FALSE, param.names = pnbd.param.names)

# **Example for BG/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# parameters estimated using bgnbd.EstimateParameters
bgnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
bgnbd.param.names <- c("r", "alpha", "s", "beta")

# plot a log-likelihood contour of r and s, the shape parameters
# of the transaction and dropout process models (respectively).
# Note that allow.neg.params has been set to false as BG/NBD
# parameters cannot be negative (not run):
# dc.PlotLogLikelihoodContour(bgnbd.cbs.LL, c("vary", "fix", "vary", "fix"),
#                            bgnbd.est.params, cal.cbs = cbs, n.divs = 20,
#                            num.contour.lines = 20, zoom.percent = 0.1,
#                            allow.neg.params = FALSE, param.names = bgnbd.param.names)



cleanEx()
nameEx("dc.PlotLogLikelihoodContours")
### * dc.PlotLogLikelihoodContours

flush(stderr()); flush(stdout())

### Name: dc.PlotLogLikelihoodContours
### Title: Plot Log-Likelihood Contour
### Aliases: dc.PlotLogLikelihoodContours

### ** Examples

# **Example for BG/BB model:
data(donationsSummary)
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
bgbb.startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
bgbb.est.params <- bgbb.EstimateParameters(rf.matrix, bgbb.startingparams)

# set up parameter names for a more descriptive result
bgbb.param.names <- c("alpha", "beta", "gamma", "delta")

# plot-log likelihood contours (not run):
# dc.PlotLogLikelihoodContours(bgbb.rf.matrix.LL, bgbb.est.params, rf.matrix = rf.matrix,
# 	n.divs = 5, num.contour.lines = 8, zoom.percent = 0.3, allow.neg.params = FALSE,
#	param.names = bgbb.param.names)

# **Example for Pareto/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# Speed up calculations:
cbs <- pnbd.compress.cbs(cbs)

# parameters estimated using pnbd.EstimateParameters
pnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
pnbd.param.names <- c("r", "alpha", "s", "beta")

# plot log-likelihood contours (not run):
# dc.PlotLogLikelihoodContours(pnbd.cbs.LL, pnbd.est.params, cal.cbs = cbs, n.divs = 5,
#                           num.contour.lines = 15, zoom.percent = 0.3,
#                            allow.neg.params = FALSE, param.names = pnbd.param.names)

# **Example for BG/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# parameters estimated using bgnbd.EstimateParameters
bgnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
bgnbd.param.names <- c("r", "alpha", "s", "beta")

# plot log-likelihood contours (not run):
# dc.PlotLogLikelihoodContours(bgnbd.cbs.LL, bgnbd.est.params, cal.cbs = cbs, n.divs = 5,
#                            num.contour.lines = 15, zoom.percent = 0.3,
#                            allow.neg.params = FALSE, param.names = bgnbd.param.names)



cleanEx()
nameEx("dc.ReadLines")
### * dc.ReadLines

flush(stderr()); flush(stdout())

### Name: dc.ReadLines
### Title: Read Lines
### Aliases: dc.ReadLines

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)

# convert date column to date objects, as required by some other functions
elog$date <- as.Date(elog$date, "$Y%m%d")



cleanEx()
nameEx("dc.RemoveTimeBetween")
### * dc.RemoveTimeBetween

flush(stderr()); flush(stdout())

### Name: dc.RemoveTimeBetween
### Title: Remove Time Between
### Aliases: dc.RemoveTimeBetween

### ** Examples

elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

# Use the cdnow data to return a 6 month event log for January, February,
# March, October, November, December.
period.one.start <- as.Date("1997-01-01")
period.one.end <- as.Date("1997-03-31")
period.two.start <- as.Date("1997-10-01")
period.two.end <- as.Date("1997-12-31")
reduced.elog <- dc.RemoveTimeBetween(elog, period.one.start, period.one.end,
                                     period.two.start, period.two.end)

# Note that the new elog will go up to June 30 at a maximum, since we
# are only using 6 months of data starting on January 1
max(reduced.elog$elog3$date)  # "1997-06-30"



cleanEx()
nameEx("pnbd.ConditionalExpectedTransactions")
### * pnbd.ConditionalExpectedTransactions

flush(stderr()); flush(stdout())

### Name: pnbd.ConditionalExpectedTransactions
### Title: Pareto/NBD Conditional Expected Transactions
### Aliases: pnbd.ConditionalExpectedTransactions

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
# Number of transactions a customer is expected to make in 2 time
# intervals, given that they made 10 repeat transactions in a time period
# of 39 intervals, with the 10th repeat transaction occurring in the 35th
# interval.
pnbd.ConditionalExpectedTransactions(params, T.star=2, x=10, t.x=35, T.cal=39)

# We can also compare expected transactions across different
# calibration period behaviors:
pnbd.ConditionalExpectedTransactions(params, T.star=2, x=5:20, t.x=25, T.cal=39)



cleanEx()
nameEx("pnbd.DERT")
### * pnbd.DERT

flush(stderr()); flush(stdout())

### Name: pnbd.DERT
### Title: Pareto/NBD Discounted Expected Residual Transactions
### Aliases: pnbd.DERT

### ** Examples

params <- c(0.5629966, 12.5590370, 0.4081095, 10.5148048)

# 15% compounded annually has been converted to 0.0027 compounded continuously,
# as we are dealing with weekly data and not annual data.
d <- 0.0027

# calculate the discounted expected residual transactions of a customer
# who made 7 transactions in a calibration period that was 77.86
# weeks long, with the last transaction occurring at the end of
# the 35th week.
pnbd.DERT(params, x=7, t.x=35, T.cal=77.86, d)

# We can also use vectors to compute DERT for several customers:
pnbd.DERT(params, x=1:10, t.x = 30, T.cal=77.86, d)



cleanEx()
nameEx("pnbd.EstimateParameters")
### * pnbd.EstimateParameters

flush(stderr()); flush(stdout())

### Name: pnbd.EstimateParameters
### Title: Pareto/NBD Parameter Estimation
### Aliases: pnbd.EstimateParameters

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# starting-point parameters
startingparams <- c(0.5, 6, 0.9, 8)
# estimated parameters
est.params <- pnbd.EstimateParameters(cal.cbs, startingparams)

# log-likelihood of estimated parameters
pnbd.cbs.LL(est.params, cal.cbs)

# compare the speed and results to the following:
cal.cbs.compressed <- pnbd.compress.cbs(cal.cbs)
est.params <- pnbd.EstimateParameters(cal.cbs.compressed, startingparams)



cleanEx()
nameEx("pnbd.Expectation")
### * pnbd.Expectation

flush(stderr()); flush(stdout())

### Name: pnbd.Expectation
### Title: Pareto/NBD Expectation
### Aliases: pnbd.Expectation

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)

# Number of repeat transactions a customer is expected to make in 2 time intervals.
pnbd.Expectation(params, t=2)

# We can also compare expected transactions over time:
pnbd.Expectation(params, t=1:10)



cleanEx()
nameEx("pnbd.ExpectedCumulativeTransactions")
### * pnbd.ExpectedCumulativeTransactions

flush(stderr()); flush(stdout())

### Name: pnbd.ExpectedCumulativeTransactions
### Title: Pareto/NBD Expected Cumulative Transactions
### Aliases: pnbd.ExpectedCumulativeTransactions

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

params <- c(0.55, 10.56, 0.61, 11.64)

# Returns a vector containing cumulative repeat transactions for 546 days.
# All parameters are in weeks; the calibration period lasted 39 weeks
# and the holdout period another 39.
pnbd.ExpectedCumulativeTransactions(params, T.cal=cal.cbs[,"T.cal"],
	T.tot=78, n.periods.final=546)



cleanEx()
nameEx("pnbd.LL")
### * pnbd.LL

flush(stderr()); flush(stdout())

### Name: pnbd.LL
### Title: Pareto/NBD Log-Likelihood
### Aliases: pnbd.LL pnbd.cbs.LL

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# random assignment of parameters
params <- c(0.5, 8, 0.7, 10)
# returns the log-likelihood of the given parameters
pnbd.cbs.LL (params, cal.cbs)

# compare the speed and results to the following:
cal.cbs.compressed <- pnbd.compress.cbs(cal.cbs)
pnbd.cbs.LL (params, cal.cbs.compressed)

# Returns the log likelihood of the parameters for a customer who
# made 3 transactions in a calibration period that ended at t=6,
# with the last transaction occurring at t=4.
pnbd.LL(params, x=3, t.x=4, T.cal=6)

# We can also give vectors as function parameters:
set.seed(7)
x <- sample(1:4, 10, replace = TRUE)
t.x <- sample(1:4, 10, replace = TRUE)
T.cal <- rep(4, 10)
pnbd.LL(params, x, t.x, T.cal)



cleanEx()
nameEx("pnbd.PAlive")
### * pnbd.PAlive

flush(stderr()); flush(stdout())

### Name: pnbd.PAlive
### Title: Pareto/NBD P(Alive)
### Aliases: pnbd.PAlive

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)

pnbd.PAlive(params, x=0, t.x=0, T.cal=39)
# 0.2924031; P(Alive) of a customer who made no repeat transactions.

pnbd.PAlive(params, x=23, t.x=39, T.cal=39)
# 1; P(Alive) of a customer who has the same recency and total
# time observed.

pnbd.PAlive(params, x=5:20, t.x=30, T.cal=39)
# Note the "increasing frequency paradox".

# To visualize the distribution of P(Alive) across customers:

data(cdnowSummary)
cbs <- cdnowSummary$cbs
params <- pnbd.EstimateParameters(cbs)
p.alives <- pnbd.PAlive(params, cbs[,"x"], cbs[,"t.x"], cbs[,"T.cal"])
plot(density(p.alives))



cleanEx()
nameEx("pnbd.Plot.DERT")
### * pnbd.Plot.DERT

flush(stderr()); flush(stdout())

### Name: pnbd.Plot.DERT
### Title: Pareto/NBD Plot Discounted Expected Residual Transactions
### Aliases: pnbd.Plot.DERT

### ** Examples

# The RFM and CLV paper uses all 78 weeks of the cdnow data to
# estimate parameters. These parameters can be estimated as follows:

# elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3)
# cal.cbs <- dc.ElogToCbsCbt(elog)$cal$cbs
# pnbd.EstimateParameters(cal.cbs)
# (The final function was run several times with its own output as
# input for starting parameters, to ensure that the result converged).

params <- c(0.5629966, 12.5590370, 0.4081095, 10.5148048)

# 15% compounded annually has been converted to 0.0027 compounded continously,
# as we are dealing with weekly data and not annual data.
d <- 0.0027

pnbd.Plot.DERT(params, x=0:14, t.x=0:77, T.cal=77.86, d, type="persp")
pnbd.Plot.DERT(params, x=0:14, t.x=0:77, T.cal=77.86, d, type="contour")



cleanEx()
nameEx("pnbd.PlotDropoutRateHeterogeneity")
### * pnbd.PlotDropoutRateHeterogeneity

flush(stderr()); flush(stdout())

### Name: pnbd.PlotDropoutRateHeterogeneity
### Title: Pareto/NBD Plot Dropout Rate Heterogeneity
### Aliases: pnbd.PlotDropoutRateHeterogeneity

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
pnbd.PlotDropoutRateHeterogeneity(params)
params <- c(0.55, 10.56, 3, 11.64)
pnbd.PlotDropoutRateHeterogeneity(params)



cleanEx()
nameEx("pnbd.PlotFreqVsConditionalExpectedFrequency")
### * pnbd.PlotFreqVsConditionalExpectedFrequency

flush(stderr()); flush(stdout())

### Name: pnbd.PlotFreqVsConditionalExpectedFrequency
### Title: Pareto/NBD Plot Frequency vs. Conditional Expected Frequency
### Aliases: pnbd.PlotFreqVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks
# following the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params
# the maximum censor number that can be used
max(cal.cbs[,"x"])

# plot conditional expected holdout period frequencies,
# binned according to calibration period frequencies
pnbd.PlotFreqVsConditionalExpectedFrequency(est.params, T.star=39, cal.cbs, x.star, censor=7)



cleanEx()
nameEx("pnbd.PlotFrequencyInCalibration")
### * pnbd.PlotFrequencyInCalibration

flush(stderr()); flush(stdout())

### Name: pnbd.PlotFrequencyInCalibration
### Title: Pareto/NBD Plot Frequency in Calibration Period
### Aliases: pnbd.PlotFrequencyInCalibration

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params
# the maximum censor number that can be used
max(cal.cbs[,"x"])

pnbd.PlotFrequencyInCalibration(est.params, cal.cbs, censor=7)



cleanEx()
nameEx("pnbd.PlotRecVsConditionalExpectedFrequency")
### * pnbd.PlotRecVsConditionalExpectedFrequency

flush(stderr()); flush(stdout())

### Name: pnbd.PlotRecVsConditionalExpectedFrequency
### Title: Pareto/NBD Plot Actual vs. Conditional Expected Frequency by
###   Recency
### Aliases: pnbd.PlotRecVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks following
# the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params

# plot conditional expected holdout period transactions, binned according to
# calibration period recencies
pnbd.PlotRecVsConditionalExpectedFrequency(est.params, cal.cbs, T.star=39, x.star)



cleanEx()
nameEx("pnbd.PlotTrackingCum")
### * pnbd.PlotTrackingCum

flush(stderr()); flush(stdout())

### Name: pnbd.PlotTrackingCum
### Title: Pareto/NBD Tracking Cumulative Transactions Plot
### Aliases: pnbd.PlotTrackingCum

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# Cumulative repeat transactions made by all customers across calibration
# and holdout periods
cu.tracking <- cdnowSummary$cu.tracking

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params

# All parameters are in weeks; the calibration period lasted 39
# weeks and the holdout period another 39.
pnbd.PlotTrackingCum(est.params, T.cal=cal.cbs[,"T.cal"], T.tot=78, cu.tracking)



cleanEx()
nameEx("pnbd.PlotTrackingInc")
### * pnbd.PlotTrackingInc

flush(stderr()); flush(stdout())

### Name: pnbd.PlotTrackingInc
### Title: Pareto/NBD Tracking Incremental Transactions Comparison
### Aliases: pnbd.PlotTrackingInc

### ** Examples

data(cdnowSummary)
cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# Cumulative repeat transactions made by all customers across calibration
# and holdout periods
cu.tracking <- cdnowSummary$cu.tracking
# make the tracking data incremental
inc.tracking <- dc.CumulativeToIncremental(cu.tracking)

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params

# All parameters are in weeks; the calibration period lasted 39
# weeks and the holdout period another 39.
pnbd.PlotTrackingInc(est.params, T.cal=cal.cbs[,"T.cal"], T.tot=78, inc.tracking)



cleanEx()
nameEx("pnbd.PlotTransactionRateHeterogeneity")
### * pnbd.PlotTransactionRateHeterogeneity

flush(stderr()); flush(stdout())

### Name: pnbd.PlotTransactionRateHeterogeneity
### Title: Pareto/NBD Plot Transaction Rate Heterogeneity
### Aliases: pnbd.PlotTransactionRateHeterogeneity

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
pnbd.PlotTransactionRateHeterogeneity(params)
params <- c(3, 10.56, 0.61, 11.64)
pnbd.PlotTransactionRateHeterogeneity(params)



cleanEx()
nameEx("pnbd.compress.cbs")
### * pnbd.compress.cbs

flush(stderr()); flush(stdout())

### Name: pnbd.compress.cbs
### Title: Compress Customer-by-Sufficient-Statistic Matrix
### Aliases: pnbd.compress.cbs

### ** Examples

# Create a sample customer-by-sufficient-statistic matrix:
set.seed(7)
x <- sample(1:4, 10, replace = TRUE)
t.x <- sample(1:4, 10, replace = TRUE)
T.cal <- rep(4, 10)
ave.spend <- sample(10:20, 10, replace = TRUE)
cbs <- cbind(x, t.x, T.cal, ave.spend)
cbs

# If cbs is printed, you would note that the following
# sets of rows have the same x, t.x and T.cal:
# (1, 6, 8); (3, 9)

pnbd.compress.cbs(cbs, 0)   # No rounding necessary

# Note that all additional columns (in this case, ave.spend)
# are aggregated by sum.



cleanEx()
nameEx("pnbd.pmf.General")
### * pnbd.pmf.General

flush(stderr()); flush(stdout())

### Name: pnbd.pmf.General
### Title: Generalized Pareto/NBD Probability Mass Function
### Aliases: pnbd.pmf.General

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
# probability that a customer will make 10 repeat transactions in the
# time interval (1,2]
pnbd.pmf.General(params, t.start=1, t.end=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (39,78]
pnbd.pmf.General(params, t.start=39, t.end=78, x=0)



cleanEx()
nameEx("pnbd.pmf")
### * pnbd.pmf

flush(stderr()); flush(stdout())

### Name: pnbd.pmf
### Title: Pareto/NBD Probability Mass Function
### Aliases: pnbd.pmf

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
# probability that a customer will make 10 repeat transactions in the
# time interval (0,2]
pnbd.pmf(params, t=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (0,39]
pnbd.pmf(params, t=39, x=0)

# Vectors may also be used as arguments:
pnbd.pmf(params, t=30, x=11:20)



cleanEx()
nameEx("spend.EstimateParameters")
### * spend.EstimateParameters

flush(stderr()); flush(stdout())

### Name: spend.EstimateParameters
### Title: Spend Parameter Estimation
### Aliases: spend.EstimateParameters

### ** Examples

data(cdnowSummary)
ave.spend <- cdnowSummary$m.x
tot.trans <- cdnowSummary$cbs[,"x"]

# There will be many warnings due to the zeroes that are
# included in the data above. To avoid them, use the following:
# (see example for spend.LL)

ave.spend <- ave.spend[which(tot.trans > 0)]
tot.trans <- tot.trans[which(tot.trans > 0)]

# We will let the spend function use default starting parameters
spend.EstimateParameters(ave.spend, tot.trans)



cleanEx()
nameEx("spend.LL")
### * spend.LL

flush(stderr()); flush(stdout())

### Name: spend.LL
### Title: Spend Log-Likelihood
### Aliases: spend.LL

### ** Examples

data(cdnowSummary)
ave.spend <- cdnowSummary$m.x;
tot.trans <- cdnowSummary$cbs[,"x"];
params <- c(6.25, 3.74, 15.44);

# get the total log-likelihood of the data and parameters
# above. There will be many warnings due to the zeroes that are
# included in the data. If you wish to avoid these warnings, use:

# ave.spend <- ave.spend[which(tot.trans > 0)];
# and
# tot.trans <- tot.trans[which(tot.trans > 0)];

# Note that we used tot.trans to remove the zeroes from ave.spend.
# This is because we need the vectors to be the same length, and it
# is possible that your data include customers who made transactions
# worth zero dollars (in which case the vector lengths would differ
# if we used ave.spend to remove the zeroes from ave.spend).

sum(spend.LL(params, ave.spend, tot.trans))

# This log-likelihood may be different than mentioned in the
# referenced paper; in the paper, a slightly different function
# which relies on total spend (not average spend) is used.



cleanEx()
nameEx("spend.expected.value")
### * spend.expected.value

flush(stderr()); flush(stdout())

### Name: spend.expected.value
### Title: Conditional expected transaction value
### Aliases: spend.expected.value

### ** Examples

params <- c(6, 4, 16)
# calculate the expected transaction value of a customer
# who spent an average of $35 over 3 transactions.
spend.expected.value(params, m.x=35, x=3)

# m.x and x may be vectors:
spend.expected.value(params, m.x=30:40, x=3)
spend.expected.value(params, m.x=35, x=1:10)
spend.expected.value(params, m.x=30:40, x=1:11)



cleanEx()
nameEx("spend.marginal.likelihood")
### * spend.marginal.likelihood

flush(stderr()); flush(stdout())

### Name: spend.marginal.likelihood
### Title: Gamma-gamma marginal likelihood
### Aliases: spend.marginal.likelihood

### ** Examples

params <- c(6, 4, 16)
# calculate the marginal distribution of the average transaction value
# of a customer who spent an average of $35 over 3 transactions.
spend.marginal.likelihood(params, m.x=35, x=3)

# Several values can also be computed at once:
spend.marginal.likelihood(params, m.x=30:40, x=3)
spend.marginal.likelihood(params, m.x=35, x=1:10)
spend.marginal.likelihood(params, m.x=30:40, x=1:11)



cleanEx()
nameEx("spend.plot.average.transaction.value")
### * spend.plot.average.transaction.value

flush(stderr()); flush(stdout())

### Name: spend.plot.average.transaction.value
### Title: Plot Actual vs. Expected Average Transaction Value
### Aliases: spend.plot.average.transaction.value

### ** Examples

data(cdnowSummary)
ave.spend <- cdnowSummary$m.x
tot.trans <- cdnowSummary$cbs[,"x"]
params <- c(6.25, 3.74, 15.44)

# Plot the actual and expected average transaction value across customers.
f.m.x <- spend.plot.average.transaction.value(params, ave.spend, tot.trans)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
