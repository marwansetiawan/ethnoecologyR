#' Number of Uses (NU) for Ethnoecology
#'
#' Calculates the Number of Uses (NU) per landscape unit.
#' NU = total number of use categories reported for each landscape unit.
#'
#' @usage NUs_eco(data)
#'
#' @param data an ethnoecology data set with columns 'informant' and 'landscape_unit'.
#'
#' @return Data frame with NU values per landscape unit.
#'
#' @examples
#'   data(ethnoecology_data)
#'   NUs_eco(ethnoecology_data)
#' @importFrom dplyr group_by summarize arrange desc across
#' @importFrom magrittr %>%
#'
#' @export
NUs_eco <- function(data) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }

  # Only select numeric columns (use categories) - exclude informant and landscape_unit
  NU_data <- data %>%
    dplyr::group_by(landscape_unit) %>%
    dplyr::summarize(
      NU = sum(colSums(dplyr::across(starts_with("use_")), na.rm = TRUE) > 0)
    ) %>%
    dplyr::arrange(desc(NU))

  return(NU_data)
}
