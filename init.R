# example R code to install packages if not already installed

package_list <- c("randomForest", "data.table")

install_if_missing <- function(p){
    if (p %in% rownames(installed.packages()) == FALSE) {
        install.packages(p)
    }
}

invisible(sapply(package_list, install_if_missing))
