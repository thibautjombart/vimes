% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fpaircase.R
\name{fpaircase}
\alias{fpaircase}
\alias{print.fpaircase}
\alias{plot.fpaircase}
\title{Expected distributions of distances (functions)}
\usage{
fpaircase(type = c("temporal", "genetic", "spatial", "empiric"), gamma_shape,
  gamma_rate = 1, gamma_scale = 1/gamma_rate, poisson_rate, sd_spatial, p,
  alpha = 0.001)

\method{print}{fpaircase}(x, ...)

\method{plot}{fpaircase}(x, y = NULL, pi = 1, xlim = c(0, 10),
  lines_args = list(), ...)
}
\arguments{
\item{type}{type of distance to be considered (one of "temporal","genetic",
"spatial" or "empiric").}

\item{gamma_shape}{shape of the gamma distribution used for the serial interval}

\item{gamma_rate}{an alternative way to specify the scale of the gamma
distribution used for the serial interval}

\item{gamma_scale}{scale of the gamma distribution used for the serial interval}

\item{poisson_rate}{rate (i.e. mean) of the poisson distribution used for the
per time unit genetic mutation rate}

\item{sd_spatial}{standard deviation of the Normal spatial kernel.}

\item{p}{A \code{numeric} vector providing the probability mass function, or
empirical frequencies, of pairwise distances.}

\item{alpha}{The probability threshold to be used to determine the maximum
value of generations between two successive cases to consider;
this value ('max_kappa') will be the smallest k so that
p(k > max_kappa) < alpha. Defaults to 0.001.}

\item{x}{vector of quantiles.}

\item{...}{further arguments passed to methods (print, plot, etc.)}

\item{y}{An optional vector of probabilities used for adding quantiles to
the plot.}

\item{pi}{The reporting probability, i.e. the proportion of cases of the
outbreak that have been reported.}

\item{xlim}{A vector of 2 numbers indicating the limits of the x-axis.}

\item{lines_args}{A list of named arguments to be passed to
\code{\link{abline}} for plotting quantiles.}
}
\description{
The function \code{fpaircase} returns functions which compute the expected
distributions of distances between pairs of cases given a case reporting
probability 'pi'. See \code{\link{dpaircase}} for details on different types
of distances between cases for which distributions can be computed.
}
\examples{

## spatial distribution

f <- fpaircase("spatial", sd_spatial=10)
plot(f)
plot(f, xlim = c(0, 100))
plot(f, xlim = c(0, 100), pi = 0.4)


## adding quantiles, 50\% sampling and customisation

plot(f, seq(0.5, .99, le=10), pi = 0.5, xlim = c(0,50),
     lines_args = list(lty = 2, col = rev(heat.colors(10))))


## genetic distribution

f <- fpaircase("genetic", gamma_shape = 1, gamma_scale = 2,
               poisson_rate = 0.5)

plot(f)
plot(f, xlim = c(0, 20), pi = 0.4)

}
\author{
Thibaut Jombart \email{thibautjombart@gmail.com}.
}
