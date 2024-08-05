\name{variogram}
\alias{variogram}
\title{
A function for calculating the empirical variogram for data sets with regularly or irregularly spaced follow-up time points
}
\description{
Calculates empirical variogram for data sets with regularly or irregularly spaced time points, and 
plots the result
}
\usage{
variogram(resid, timeVar, id, binwidth, numElems = 0, inc.var = TRUE, 
irregular = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{resid}{
a vector of empirical residuals
}
  \item{timeVar}{
a vector for the time variable
}
  \item{id}{
a vector for subject identification
}
  \item{binwidth}{
a numerical value for the bin length, to be used for irregularly spaced data
}
  \item{numElems}{
a numerical value for the elimination of the bins with less than that number of elements
}
  \item{inc.var}{
a character string, if set \code{FALSE} process variance is not included in the plot
}
  \item{irregular}{
a character string, \code{FALSE} indicates the data are collected at regular time points
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
Returns mid values and means of the bins, and numbers of elements falling into the bins for \code{irregular = TRUE}, 
and lags and means of the lags, and number of the elements for the lags for \code{irregular = FALSE}. 
Process variance is also returned.
}
\references{
Asar O, Ritchie J, Kalra P, Diggle PJ (2015) Acute kidney injury amongst chronic kidney disease 
patients: a case-study in statistical modelling. To be submitted.

Diggle PJ (1988) An approach to the analysis of repeated measurements. \emph{Biometrics}, \bold{44}, 959-971.

Diggle PJ, Heagerty PJ, Liang K-Y, Zeger SL. (2002) \emph{Analysis of Longitudinal Data, 2nd edition}. 
Oxford University Press: Oxford.

Diggle PJ, Ribeiro PJ Jr. (2007) \emph{Model-based Geostatistics}. Springer-Verlag: New York.

Diggle PJ, Sousa I, Asar O (2015) Real time monitoring of progression towards renal failure in primary care patients.
\emph{Biostatistics}, 16(3), 522-536. 

}
\author{
Ozgur Asar, Peter J. Diggle
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
# loading the data set and subsetting it for the first 20 patients 
# for the sake illustration of the usage of the functions
data(data.sim.ibm)
data.sim.ibm.short <- data.sim.ibm[data.sim.ibm$id <= 20, ]

# obtaining empirical residuals by a linear model
# and calculating the empirical variogram
lm.fit <- lm(log.egfr ~ sex + bage + fu + pwl, data = data.sim.ibm.short)
variogram(resid = resid(lm.fit), timeVar = data.sim.ibm.short$fu, id = data.sim.ibm.short$id,
  binwidth = 0.1, numElems = 20, inc.var = FALSE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{variogram}
