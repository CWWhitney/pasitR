#' Create a scatter plot of chill and yield
#'
#' Chill (x) and yield (y) scatter plot with associated and estimated densities  (using a loess smooth) given by the red dot (mean) and red ellipses (1 and 2 sigma from mean). The red line going across the plot shows the linear fit. Histograms are shown with smooth lines (loess smooth linear fits) density curves. The numeric value in the upper right gives the Spearman correlation coefficient between Chill Portions and yield.
#' @param chill is a vector of observed seasonal Chill Portions corresponding to another list with annual yields. 
#' @param yield is a vector of observed annual yields corresponding to another list with seasonal Chill Portions. 
#' 
#' @importFrom psych scatter.hist
#' @importFrom stats complete.cases
#' @importFrom assertthat validate_that
#' @importFrom assertthat see_if
#' 
#' @keywords chill, Chill Portions, yield
#'
#' @examples
#' chill <- sample(x = 1:50, size = 20, replace = TRUE)
#' yield <- sample(x = 1000:5000, size = 20, replace = TRUE)
#' chillscatter(chill, yield)
#' 
#' @export chillscatter
chillscatter <- function(chill, yield) {
    if (!requireNamespace("psych", quietly = TRUE)) {
        stop("Package \"psych\" needed for this function to work. Please install it.",
            call. = FALSE)
  }
  if (!requireNamespace("stats", quietly = TRUE)) {
    stop("Package \"stats\" needed for this function to work. Please install it.",
         call. = FALSE)
  }
 
  #add error stops with validate_that   
  assertthat::validate_that(length(chill) == length(yield), msg = "\"chill\" and \"yield\" are not equal lengths.")
  assertthat::validate_that(is.numeric(chill), msg = "\"chill\" is not numeric.")
  
  assertthat::validate_that(is.numeric(yield), msg = "\"yield\" is not numeric.")

  # Setting the variables to NULL first, appeasing R CMD check
  chillyielddata <- chillyield <- ylab <- xlab <- NULL 
  
  chillyield <- as.data.frame(cbind(chill, yield)) #create subset-able data
  
  ## Use 'complete.cases' from stats to get to the collection of obs without NA
  chillyielddata <- chillyield[stats::complete.cases(chillyield), ]
  
  #message about complete cases
  assertthat::see_if(length(chillyield) == length(chillyielddata), msg = "Rows with NA were removed.")
  
  ## build a scatter plot with a histogram of x and y with 'psych'
  scatter <- psych::scatter.hist(x = chillyielddata$chill, y = chillyielddata$yield, density = TRUE, 
                                 xlab = "Chill (in Chill Portions)", ylab = "Yield")
  
    print("Chill (x) and yield (y) scatter plot with associated and estimated densities.")
}
