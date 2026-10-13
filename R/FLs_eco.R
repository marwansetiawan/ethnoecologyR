#' Fidelity Level (FL) for Ethnoecology
#'
#' Calculates the Fidelity Level (FL) per landscape unit for a specific use category.
#' FL = (number of informants who mention the landscape unit for a specific use /
#' total number of informants who mention the landscape unit for any use) * 100.
#'
#' @usage FLs_eco(data, use_category)
#'
#' @param data an ethnoecology data set with columns 'informant' and 'landscape_unit'.
#' @param use_category a character string specifying the use category column name.
#'
#' @return Data frame with FL values per landscape unit.
#'
#' @references
#' Friedman, J., Yaniv, Z., Dafni, A., and Palevitch, D. 1986. "A Preliminary
#' Classification of the Healing Potential of Medicinal Plants, Based on a
#' Rational Analysis of an Ethnopharmacological Field Survey among Bedouins
#' in the Negev Desert, Israel." \emph{Journal of Ethnopharmacology} 16(2-3): 275-287.
#'
#' @importFrom dplyr group_by summarize n_distinct mutate arrange desc
#' @importFrom magrittr %>%
#' @importFrom rlang sym
#'
#' @examples
#' data(ethnoecology_data)
#' FLs_eco(ethnoecology_data, "use_forest")
#' @export
FLs_eco <- function(data, use_category) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }
  if (!requireNamespace("rlang", quietly = TRUE)) {
    stop("Package \"rlang\" needed for this function. Please install it.", call. = FALSE)
  }

  if (!use_category %in% colnames(data)) {
    stop(paste("Column", use_category, "not found in data."), call. = FALSE)
  }

  FL_data <- data %>%
    dplyr::group_by(landscape_unit) %>%
    dplyr::summarize(
      total_informants = dplyr::n_distinct(informant),
      specific_informants = sum(!!rlang::sym(use_category), na.rm = TRUE)
    ) %>%
    dplyr::mutate(FL = (specific_informants / total_informants) * 100) %>%
    dplyr::arrange(desc(FL))

  return(FL_data)
}
