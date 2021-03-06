% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chillkernelslice.R
\name{chillkernelslice}
\alias{chillkernelslice}
\title{Estimated yield given the expected chill, based on a slice of 'z' from the Kernel density plot of chill and yield data.}
\usage{
chillkernelslice(chill, yield, expectedchill)
}
\arguments{
\item{chill}{is a list of observed annual chill portions corresponding to another list with annual yields.}

\item{yield}{is a list of observed annual yields corresponding to another list with annual chill portions.}

\item{expectedchill}{is a value of expected chill for which the yield should be estimated.}
}
\description{
Plot representing probabilities (shown along the y-axis) for the expected yield (shown along the x-axis). 
This is a cut through the density kernel from pasitR::chillkernel() function, which integrates to 1, the probability values are relative, not absolute measures.
}
\examples{
chill <- sample(x = 1:50, size = 20, replace = TRUE)
yield <- sample(x = 1000:5000, size = 20, replace = TRUE)
chillkernelslice(chill, yield, expectedchill = 30)

}
\keyword{chill}
\keyword{density}
\keyword{kernel}
\keyword{yield}
