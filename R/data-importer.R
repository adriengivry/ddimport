library(digest)

#' Import Data from Disk
#'
#' This function imports data from a specified data source path on disk to a target path.
#' If the target path is not provided, the function will use the current working directory.
#'
#' @param data_source_path The path to the data source file on disk.
#' @param data_target_path The path where the data will be imported. Default is NULL,
#'                         which means the data will be imported to the current working directory.
#' @return NULL
#'
#' @details
#' The function checks if the data source file exists. If it doesn't exist, it provides appropriate
#' messages and returns without importing data.
#'
#' If the data target path already exists, the function compares the hash of the source file with the
#' hash of the existing target file using MD5. If the hashes differ, the existing target file is removed,
#' and the data is copied from the source file to the target path, providing a message of data update.
#' If the hashes are the same, the function provides a message stating that the data is up-to-date.
#'
#' If the data target path does not exist, the function copies the data from the source file to the target
#' path and provides a message indicating that the data has been imported.
#'
#' @import digest
#'
#' @examples
#' # Import data from "/path/on/disk/data.csv to the current working directory
#' import_data_from_disk("/path/on/disk/data.csv")
#'
#' # Import data from "/path/on/disk/data.csv" to a custom target path "data/data.csv"
#' import_data_from_disk("/path/on/disk/data.csv", "data/data.csv")
#'
#' @seealso
#' Use \code{\link{digest}} function from the \code{digest} package to compute hash values
#' for file comparison.
#'
#' @keywords file data import copy disk
#'
#' @export
import_data_from_disk <- function(data_source_path, data_target_path = NULL) {
  message("Importing data from disk...")

  if (is.null(data_target_path)) {
    data_target_path = file.path(getwd(), basename(data_source_path))
  }

  if (!file.exists(data_source_path)) {
    if (file.exists(data_target_path)) {
      message("No data to import.")
    }
    else {
      message("Missing data.")
    }

    return()
  }

  fileName <- basename(data_source_path)

  if (file.exists(data_target_path)) {
    data_target_hash <- digest(file = data_target_path, algo = "md5")
    data_source_hash <- digest(file = data_source_path, algo = "md5")

    if (data_target_hash != data_source_hash) {
      file.remove(data_target_path)
      file.copy(from = data_source_path, to = data_target_path)
      message("Data updated.")
    } else {
      message("Data already up-to-date.")
    }
  } else {
    file.copy(from = data_source_path, to = data_target_path)
    message("Data imported.")
  }
}
