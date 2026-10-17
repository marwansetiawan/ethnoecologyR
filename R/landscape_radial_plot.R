#' Radial Bar Plot of Ethnoecology Indices
#'
#' Creates a radial bar plot to visualize multiple ethnoecology indices
#' per landscape unit.
#'
#' @usage landscape_radial_plot(data, indices_list)
#'
#' @param data an ethnoecology data set.
#' @param indices_list a list of index functions to apply (e.g., list(LUs, CIEs)).
#'
#' @return A ggplot2 radial plot.
#'
#' @importFrom ggplot2 ggplot aes geom_col coord_polar theme_minimal labs
#' @importFrom dplyr bind_rows
#'
#' @examples
#' data(ethnoecology_data)
#' landscape_radial_plot(ethnoecology_data, list(LU = LUs, CIE = CIEs))
#'
#' @export
landscape_radial_plot <- function(data, indices_list) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package \"ggplot2\" needed.", call. = FALSE)
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }

  results_list <- list()
  for (i in seq_along(indices_list)) {
    result <- indices_list[[i]](data)

    # Ambil nama indeks dengan aman
    index_name <- names(indices_list)[i]
    if (is.null(index_name) || is.na(index_name) || index_name == "") {
      index_name <- paste0("Index_", i)
    }

    # Tambahkan kolom index ke data frame
    result$index <- index_name

    results_list[[i]] <- result
  }

  combined <- dplyr::bind_rows(results_list)

  # Rename columns: assume first column is landscape_unit, second is value
  colnames(combined)[1] <- "landscape_unit"
  colnames(combined)[2] <- "value"

  # If there's no 'index' column (shouldn't happen), create one
  if (!"index" %in% colnames(combined)) {
    combined$index <- "Index"
  }

  p <- ggplot2::ggplot(combined,
                       ggplot2::aes(x = landscape_unit,
                                    y = value,
                                    fill = index)) +
    ggplot2::geom_col(position = "dodge") +
    ggplot2::coord_polar() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "Radial Plot of Ethnoecology Indices",
                  x = "Landscape Unit",
                  y = "Index Value")

  return(p)
}
