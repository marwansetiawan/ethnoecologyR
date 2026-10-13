#' Cultural Value of Ecolandscape (CVe)
#'
#' Calculates the Cultural Value (CVe) per landscape unit.
#' CVe = (LU / N) * (FC / N) where N = number of informants.
#'
#' @usage CVe_eco(data)
#'
#' @param data an ethnoecology data set with columns 'informant' and 'landscape_unit'.
#'
#' @return Data frame with CVe values per landscape unit.
#'
#' @references
#' Reyes-García, V., Huanca, T., Vadez, V., Leonard, W., and Wilkie, D. 2006.
#' "Cultural, Practical, and Economic Value of Wild Plants: A Quantitative Study
#' in the Bolivian Amazon." \emph{Economic Botany} 60(1): 62-74.
#'
#' @importFrom dplyr group_by summarize mutate arrange desc across n_distinct
#' @importFrom magrittr %>%
#'
#' @examples
#'   data(ethnoecology_data)
#'   CVe_eco(ethnoecology_data)
#' @export
CVe_eco <- function(data) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }

  N <- dplyr::n_distinct(data$informant)

  CVe_data <- data %>%
    dplyr::group_by(landscape_unit) %>%
    dplyr::summarize(
      LU = sum(dplyr::across(starts_with("use_")), na.rm = TRUE),
      FC = dplyr::n_distinct(informant)
    ) %>%
    dplyr::mutate(CVe = (LU / N) * (FC / N)) %>%
    dplyr::arrange(desc(CVe))

  return(CVe_data)
}
