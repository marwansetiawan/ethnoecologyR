#' Bootstrap Analyses of Ethnoecology Indices
#'
#' Performs bootstrap resampling to calculate confidence intervals
#' for ethnoecology indices.
#'
#' @usage ethno_boot_land(data, index_function, R = 1000)
#'
#' @param data an ethnoecology data set.
#' @param index_function a function that calculates an ethnoecology index
#'   (e.g., LUs, CIEs).
#' @param R number of bootstrap replicates.
#'
#' @return A list containing bootstrap results.
#'
#' @importFrom boot boot
#'
#' @examples
#' \donttest{
#'   data(ethnoecology_data)
#'   ethno_boot_land(ethnoecology_data, LUs, R = 100)
#' }
#'
#' @export
ethno_boot_land <- function(data, index_function, R = 1000) {
  if (!requireNamespace("boot", quietly = TRUE)) {
    stop("Package \"boot\" needed. Please install it.", call. = FALSE)
  }

  boot_stat <- function(data, indices) {
    d <- data[indices, ]
    result <- index_function(d)
    # Return the second column which contains the index values
    # (assumes index_function returns a data frame with landscape_unit and index)
    return(result[[2]])
  }

  boot_results <- boot::boot(data = data, statistic = boot_stat, R = R)

  return(boot_results)
}
