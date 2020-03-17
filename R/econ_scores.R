#' @title Location and Economic Score Data Frame
#' @description The sample data frame created includes vectors of:  location and economic scores.
#' @format Individual vectors with list of each variable were initially created. A data frame was created in tidy format.
#' @source This data was randomly created, but inspired by the dataset provided by the SSTI analysis of BEA and Census Data from 2015 on GDP per county in the USA.
#' \describe{
#' \locs - a list of 10 different California locations
#' \Scores - Economic scores represent damage brackets (in USD) as defined below:
#' 1 =  $1,400,000
#' 2 = $7,100,000
#' 3 = $30,000,000
#' 4 = $44,000,000
#' 5 = $600,000,000
#' \econ_scores - dataframe containing the locations and the associated economic scores
#' }
"econ_scores"
