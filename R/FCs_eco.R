#' Frequency of Citation (FC) for Ethnoecology
#'
#' Calculates the Frequency of Citation (FC) per landscape unit.
#' FC = number of informants who mention the landscape unit for any use.
#'
#' @usage FCs_eco(data)
#'
#' @param data an ethnoecology data set with columns 'informant' and 'landscape_unit'.
#'
#' @return Data frame with FC values per landscape unit.
#'
#' @references
#' Friedman, J., Yaniv, Z., Dafni, A., and Palevitch, D. 1986. "A Preliminary
#' Classification of the Healing Potential of Medicinal Plants, Based on a
#' Rational Analysis of an Ethnopharmacological Field Survey among Bedouins
#' in the Negev Desert, Israel." \emph{Journal of Ethnopharmacology} 16(2-3): 275-287.
#'
#' @importFrom dplyr group_by summarize n_distinct arrange desc
#' @importFrom magrittr %>%
#'
#' @examples
#'   data(ethnoecology_data)
#'   FCs_eco(ethnoecology_data)
#' @export
FCs_eco <- function(data) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }

  FC_data <- data %>%
    dplyr::group_by(landscape_unit) %>%
    dplyr::summarize(FC = dplyr::n_distinct(informant)) %>%
    dplyr::arrange(desc(FC))

  return(FC_data)
}
