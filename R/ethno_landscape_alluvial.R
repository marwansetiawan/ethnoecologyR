#' Alluvial Plot of Landscape Uses
#'
#' Creates an alluvial diagram showing flows between informants,
#' landscape units, and ecological uses.
#'
#' @usage ethno_landscape_alluvial(data)
#'
#' @param data an ethnoecology data set with columns 'informant', 'landscape_unit',
#'   and use categories.
#'
#' @return A ggplot2 alluvial plot.
#'
#' @importFrom ggalluvial geom_alluvium geom_stratum
#' @importFrom ggplot2 ggplot aes theme_minimal labs after_stat
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @examples
#' \donttest{
#'   data(ethnoecology_data)
#'   ethno_landscape_alluvial(ethnoecology_data)
#' }
#'
#' @export
ethno_landscape_alluvial <- function(data) {
  if (!requireNamespace("ggalluvial", quietly = TRUE)) {
    stop("Package \"ggalluvial\" needed.", call. = FALSE)
  }
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package \"ggplot2\" needed.", call. = FALSE)
  }
  if (!requireNamespace("tidyr", quietly = TRUE)) {
    stop("Package \"tidyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }
  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("Package \"magrittr\" needed for this function. Please install it.", call. = FALSE)
  }

  # Reshape data for alluvial
  alluv_data <- data %>%
    tidyr::pivot_longer(
      cols = -c(informant, landscape_unit),
      names_to = "use_category",
      values_to = "present"
    ) %>%
    dplyr::filter(present == 1)

  # Create alluvial plot
  p <- ggplot2::ggplot(alluv_data,
                       ggplot2::aes(axis1 = informant,
                                    axis2 = landscape_unit,
                                    axis3 = use_category,
                                    y = ggplot2::after_stat(count))) +
    ggalluvial::geom_alluvium(ggplot2::aes(fill = landscape_unit)) +
    ggalluvial::geom_stratum() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "Alluvial Plot of Landscape Uses",
                  x = "Flow",
                  y = "Count")

  return(p)
}
