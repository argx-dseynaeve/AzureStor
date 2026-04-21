#' @import AzureRMR
#' @importFrom utils URLencode modifyList packageVersion glob2rx
NULL

globalVariables(c("self", "pool"), "AzureStor")

.AzureStor <- new.env()


.onLoad <- function(libname, pkame)
{
    set_option <- function(name, value)
    {
        if(is.null(getOption(name)))
            options(structure(list(value), names=name))
    }

    set_option("azure_storage_api_version", "2025-11-05")
    set_option("azure_storage_headers", list("x-ms-file-request-intent" = "backup"))
    set_option("azure_storage_progress_bar", TRUE)
    set_option("azure_storage_retries", 10)

    # all methods extending classes in external package must be run from .onLoad
    add_methods()
}



