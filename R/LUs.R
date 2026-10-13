#' Landscape Use (LU)
#'
#' Calculates the Landscape Use (LU) per landscape unit, a common metric for
#' ethnoecology studies. This is the sum of all use reports for each landscape unit.
#'
#' @usage LUs(data)
#'
#' @param data an ethnoecology data set with column 1 'informant' and column 2
#'   'landscape_unit' as row identifiers of informants and of landscape units
#'   respectively. The rest of the columns are the identified ethnoecology use
#'   categories. The data should be populated with counts of uses per person
#'   (0 or 1 values).
#'
#' @return Data frame of landscape units and Landscape Use (LU) values.
#'
#' @references
#' Tardío, J., and Pardo-de-Santayana, M. 2008. "Cultural Importance Indices:
#' A Comparative Analysis Based on the Useful Wild Plants of Southern Cantabria
#' (Northern Spain)." \emph{Economic Botany} 62(1): 24-39.
#'
#' Whitney, C. W., Bahati, J., and Gebauer, J. 2018. "Ethnobotany and
#' Agrobiodiversity: Valuation of Plants in the Homegardens of Southwestern Uganda."
#' \emph{Ethnobiology Letters} 9(2): 1-12.
#'
#' @keywords arith math logic methods survey
#'
#' @section Warning:
#' Identification for informants and landscape units must be listed by the names
#' 'informant' and 'landscape_unit' respectively in the data set.
#' The rest of the columns should all represent separate identified ethnoecology
#' use categories.
#'
#' @importFrom dplyr group_by summarize select mutate_if across arrange desc
#' @importFrom magrittr %>%
#'
#' @examples
#'   data(ethnoecology_data)
#'   LUs(ethnoecology_data)
#' @export
LUs <- function(data) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed for this function. Please install it.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }

  if (!any(sum(dplyr::select(data, -informant, -landscape_unit) > 0))) {
    warning("The sum of all LU is not greater than zero. Check your data.")
    data <- data[stats::complete.cases(data), ]
  }

  if (any(length(dplyr::select(data, -informant, -landscape_unit)[dplyr::select(data, -informant, -landscape_unit) > 1]) > 0)) {
    warning("Some values are greater than 1. All non-zero numeric values have been changed to 1.")
    data <- dplyr::mutate_if(data, is.numeric, ~1 * (. > 0))
  }
  #' @importFrom dplyr group_by summarize starts_with
  LU_data <- data %>%
    dplyr::group_by(landscape_unit) %>%
    dplyr::summarize(LU = sum(dplyr::across(starts_with("use_")), na.rm = TRUE)) %>%
    dplyr::arrange(desc(LU))

  return(LU_data)
}
