% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pnbd.R
\name{pnbd.PlotTrackingCum}
\alias{pnbd.PlotTrackingCum}
\title{Pareto/NBD Tracking Cumulative Transactions Plot}
\usage{
pnbd.PlotTrackingCum(
  params,
  T.cal,
  T.tot,
  actual.cu.tracking.data,
  n.periods.final = NA,
  xlab = "Week",
  ylab = "Cumulative Transactions",
  xticklab = NULL,
  title = "Tracking Cumulative Transactions"
)
}
\arguments{
\item{params}{Pareto/NBD parameters - a vector with r, alpha, s, and beta, in
that order. r and alpha are unobserved parameters for the NBD transaction
process. s and beta are unobserved parameters for the Pareto (exponential
gamma) dropout process.}

\item{T.cal}{length of calibration period, or a vector of calibration period
lengths.}

\item{T.tot}{End of holdout period. Must be a single value, not a vector.}

\item{actual.cu.tracking.data}{A vector containing the cumulative number of
repeat transactions made by customers for each period in the total time
period (both calibration and holdout periods). See details.}

\item{n.periods.final}{Number of time periods in the calibration and holdout
periods. See details.}

\item{xlab}{Descriptive label for the x axis.}

\item{ylab}{Descriptive label for the y axis.}

\item{xticklab}{Vector containing a label for each tick mark on the x axis.}

\item{title}{Title placed on the top-center of the plot.}
}
\value{
Matrix containing actual and expected cumulative repeat transactions.
}
\description{
Plots the actual and expected cumulative total repeat transactions by all
customers for the calibration and holdout periods, and returns this
comparison in a matrix.
}
\details{
actual.cu.tracking.data does not have to be in the same unit of time as the
T.cal data. T.tot will automatically be divided into periods to match the
length of actual.cu.tracking.data. See
\code{\link{pnbd.ExpectedCumulativeTransactions}}.

The holdout period should immediately follow the calibration period. This
function assume that all customers' calibration periods end on the same date,
rather than starting on the same date (thus customers' birth periods are
determined using max(T.cal) - T.cal rather than assuming that it is 0).
}
\examples{
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
pnbd.PlotTrackingCum(params = est.params, 
                     T.cal = cal.cbs[,"T.cal"], 
                     T.tot = 78, 
                     actual.cu.tracking.data = cu.tracking)
}
