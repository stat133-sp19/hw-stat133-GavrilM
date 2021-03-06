% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_choose}
\alias{bin_choose}
\title{bin_choose}
\usage{
bin_choose(n, k)
}
\arguments{
\item{n}{number of trials}

\item{k}{number of successes}
}
\value{
number of combinations of k successes in n trials
}
\description{
calculates the number of combinations in which k successes can occur in n trials
}
\examples{

bin_choose(n = 5, k = 2)
bin_choose(5, 0)

# Using a list for k
bin_choose(5, 1:3)

}
