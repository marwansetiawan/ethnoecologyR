#' Chord Diagram of Landscape Uses
#'
#' Creates a chord diagram showing relationships between informants,
#' landscape units, and ecological uses.
#'
#' @usage ethno_landscape_chord(data, by = "landscape_unit")
#'
#' @param data an ethnoecology data set with columns 'informant' and 'landscape_unit'.
#' @param by grouping variable: "landscape_unit" or "informant".
#'
#' @return A chord diagram plot.
#'
#' @importFrom circlize chordDiagram
#' @importFrom reshape2 dcast
#' @importFrom dplyr group_by summarise n
#' @importFrom magrittr %>%
#'
#' @examples
#' \donttest{
#'   data(ethnoecology_data)
#'   ethno_landscape_chord(ethnoecology_data, by = "landscape_unit")
#' }
#'
#' @export
ethno_landscape_chord <- function(data, by = "landscape_unit") {
  if (!requireNamespace("circlize", quietly = TRUE)) {
    stop("Package \"circlize\" needed.", call. = FALSE)
  }
  if (!requireNamespace("reshape2", quietly = TRUE)) {
    stop("Package \"reshape2\" needed.", call. = FALSE)
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }

  if (by == "landscape_unit") {
    mat <- data %>%
      dplyr::group_by(landscape_unit, informant) %>%
      dplyr::summarise(count = dplyr::n(), .groups = "drop") %>%
      reshape2::dcast(landscape_unit ~ informant, value.var = "count", fill = 0)
  } else {
    mat <- data %>%
      dplyr::group_by(informant, landscape_unit) %>%
      dplyr::summarise(count = dplyr::n(), .groups = "drop") %>%
      reshape2::dcast(informant ~ landscape_unit, value.var = "count", fill = 0)
  }

  rownames(mat) <- mat[,1]
  mat <- as.matrix(mat[,-1])

  circlize::chordDiagram(mat)
}
