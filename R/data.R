#' CDNOW repeat transaction data summary
#'
#' Data representing the purchasing behavior of 2,357 CDNOW customers between
#' January 1997 and June 1998, summarized as a customer-by-time matrix and a
#' vector of cumulative weekly transactions.
#'
#' The customers in this data represent 1/10th of the cohort of customers who
#' made their first transactions with CDNOW in the first quarter of 1997. CDNOW
#' was an online retailer, selling music and related products on the web since
#' 1994.
#'
#' @docType data
#'
#' @usage data(cdnowSummary)
#'
#' @format A named list of four elements: 
#' * `cbs`  A customer-by-time matrix with four columns: frequency ("x"), recency
#'   ("t.x"), length of observation in the calibration period ("T.cal"), and
#'   number of transactions in the holdout period ("x.star"). Each row represents
#'   a customer. 
#' * `cu.tracking`  A vector containing cumulative transactions for
#'   every week in both the calibration and estimating periods (78 weeks total).
#'   This vector contains the sum of transactions across all customers. 
#' * `est.params`   A vector containing estimated values for the four Pareto/NBD
#'   parameters: r, alpha, s, and beta, in that order. This estimation was made
#'   using [`pnbd.EstimateParameters`], and is included here to avoid having to
#'   run the relatively time-consuming parameter estimation function in examples.
#' * `m.x`  A vector containing the average value of each customer's repeat
#'   transactions. Used in examples for spend functions.
#'
#' @source The data was put together using data conversion functions included in
#'   this package. The original event log is included (see [`cdnowElog`]).
#' @keywords datasets
#' @md
"cdnowSummary"

#' CDNOW event log data
#'
#' Data representing the purchasing behavior of 2,357 CDNOW customers between
#' January 1997 and June 1998, in event log format.
#'
#' The customers in this data represent 1/10th of the cohort of customers who
#' made their first transactions with CDNOW in the first quarter of 1997. CDNOW
#' was an online retailer, selling music and related products on the web since
#' 1994.
#' 
#' @docType data
#' 
#' @format A comma-delimited file representing an event log with 6,919 entries.
#'   It has 5 columns: The customer's ID in the master dataset, the customer's
#'   ID in this dataset (which represents 1/10th of the master dataset), the
#'   date of the transaction in the format "%Y%m%d" (e.g. 19970225), the number
#'   of CDs purchased, and the dollar value of the transaction.
#'
#' @source Can be found [online](www.brucehardie.com/datasets).
#' @keywords datasets
#' @name cdnowElog
#' @md
NULL

#' Discrete simulated annual event log data
#'
#' Data simulated using BG/BB model assumptions. Contains annual transaction
#' behavior for a period of 14 years, for a cohort of 10,000 customers who made
#' their first transactions in 1970.
#'
#' This dataset was simulated in order to illustrate certain data-conversion
#' functions (see [`dc.MakeRFmatrixCal`]).
#'
#' @docType data
#'
#' @format A comma-delimited file representing an event log with 52,432 entries.
#'   It has 2 columns: The customer's ID and the date of the transaction in
#'   standard R date format.
#' @keywords datasets
#' @name discreteSimElog 
#' @md
NULL

#' Discrete donation data summary
#'
#' This dataset contains a recency-frequency matrix capturing the discrete
#' transaction behavior of 11,104 customers over 6 transaction opportunities,
#' summarized as a recency-frequency matrix and a vector of annual transactions.
#'
#' Data from "a major nonprofit organization located in the midwestern United
#' States that is funded in large part by donations from individuals. In 1995
#' the organization "acquired" 11,104 first-time supporters; in each of the
#' following six years, these individuals either did or did not support the
#' organization."
#'
#' This dataset contains, for each possible in-sample recency/frequency
#' combination in the 1995 cohort, the number of customers and the number of
#' transactions they made during the validation period.
#' 
#' @docType data
#'
#' @usage data(donationsSummary)
#' 
#' @format A named list: 
#' \describe{ 
#'   \item{$rf.matrix}{A matrix with 22 rows (for each possible 
#'     recency-frequency combination in 6 calibration period transaction 
#'     opportunities) and 4 columns: number of transactions during the calibration 
#'     period ("x"), recency in the calibration period ("t.x"), number of 
#'     transaction opportunities in the calibration period ("n.cal"), and number 
#'     of customers with this recency-frequency combination in the calibration 
#'     period ("custs").} 
#'   \item{$rf.matrix.holdout}{A matrix with 15 rows (for each possible 
#'     recency-frequency combination in 5 holdout period transaction
#'     opportunities) and 4 columns: number of transactions during the holdout
#'     period ("x.star"), recency in the holdout period ("t.x.star"), number of
#'     transaction opportunities in the holdout period ("n.star"), and number of
#'     customers with the recency-frequency combination in the holdout period
#'     ("custs").} 
#'   \item{$x.star}{A vector with 22 elements, containing the number
#'     of transactions made by each calibration period recency-frequency bin in
#'     the holdout period. It is in the same order as \code{$rf.matrix.}}
#'   \item{$annual.sales}{A vector with 11 elements, containing the number of
#'     transactions made by all customers in each time period in both the
#'     calibration and holdout periods.}
#' }
#' 
#' @references Fader, Peter S., Bruce G.S. Hardie, and Jen Shang. “Customer-Base
#'   Analysis in a Discrete-Time Noncontractual Setting.” \emph{Marketing Science} 
#'   29(6), pp. 1086-1108. 2010. INFORMS. \url{http://www.brucehardie.com/notes/020/}
#' @source Data can be found online at \url{http://www.brucehardie.com/notes/010/}
#'   (Associated Excel spreadsheet)
#' @keywords datasets
"donationsSummary" 

#' Ace Snackfoods Kiwi Bubbles trial
#'
#' Ace Snackfoods, Inc. has developed a new shelf-stable juice product called
#' Kiwi Bubbles. Sales of the new product are being monitored in a limited
#' geographic area over a year through a market research panel that follows 
#' the purchases of a representative sample of 1499 households at supermarkets, 
#' convenience stores, warehouse clubs, and mass merchandisers in the test 
#' area. The product has now been under test for 24 weeks.
#' 
#' The marketing manager for Kiwi Bubbles would like a forecast of the product’s 
#' year-end performance in the test market. As a first step, she wants a forecast 
#' of the number of households that will have made a trial purchase by Week 52.
#' 
#' @docType data
#'
#' @usage data(ace_snackfoods)
#' 
#' @format A named list of two data frames: 
#' \describe{
#'   \item{`calibration`}{Table 1: Cumulative number of households that have made a trial purchase by the end of weeks 1–24.}
#'   \item{`validation`}{Table A1: Cumulative number of households that have made a trial purchase by the end of weeks 25–52.}
#' }
#' @references Peter S. Fader, Bruce G. S. Hardie, Daniel McCarthy & Ramnath
#'   Vaidyanathan (2019) Exploring the Equivalence of Two Common Mixture Models
#'   for Duration Data, The American Statistician, 73:3, 288-295, DOI:
#'   10.1080/00031305.2018.1543134
#'   [Web](https://doi.org/10.1080/00031305.2019.1543134)
#' @keywords datasets
#' @md
"ace_snackfoods" 
