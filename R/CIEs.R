#' Cultural Importance in Ecology (CIE)
#'
#' Calculates the Cultural Importance in Ecology (CIE) index per landscape unit.
#' CIE = LU / N, where N is the number of informants.
#'
#' @usage CIEs(data)
#'
#' @param data an ethnoecology data set with columns 'informant' and 'landscape_unit'.
#'
#' @return Data frame with CIE values per landscape unit.
#'
#' @references
#' Tardío, J., and Pardo-de-Santayana, M. 2008. "Cultural Importance Indices:
#' A Comparative Analysis Based on the Useful Wild Plants of Southern Cantabria
#' (Northern Spain)." \emph{Economic Botany} 62(1): 24-39.
#'
#' @importFrom dplyr group_by summarize n_distinct across mutate arrange desc
#' @importFrom magrittr %>%
#'
#' @examples
#'   data(ethnoecology_data)
#'   CIEs(ethnoecology_data)
#' @export
CIEs <- function(data) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }

  CIE_data <- data %>%
    dplyr::group_by(landscape_unit) %>%
    dplyr::summarize(
      total_informants = dplyr::n_distinct(informant),
      total_uses = sum(dplyr::across(starts_with("use_")), na.rm = TRUE)
    ) %>%
    dplyr::mutate(CIE = total_uses / total_informants) %>%
    dplyr::arrange(desc(CIE))

  return(CIE_data)
}
