#' Create a new column called most severe region
#'
#' This function identifies the ISS body region that has the most
#' severe injuries and return a new column with the name of that
#' region.
#' @param data A data.frame. The data containing the AIS codes, in
#'     columns whose names start with AISCode. No default.
#' @param return.as.character Logical. If TRUE the column is returned as
#'     character instead of factor. Defaults to FALSE, meaning that
#'     the column is returned as a factor.
#' @export
create_most_severe_region <- function(data, return.as.character = FALSE) {
    ## Check arguents
    assertthat::assert_that(is.data.frame(data))
    assertthat::assert_that(is.logical(return.as.character) & length(return.as.character) == 1)

    ## Extract columns with AIS codes
    ais.data <- data[, grepl("AISCode", names(data))]

    ## Get body region codes
    body.region.codes <- as.data.frame(lapply(ais.data, substring, first = 1, last = 1))
    names(body.region.codes) <- paste0(names(body.region.codes), "_region")

    ## Get severity codes
    severity.codes <- as.data.frame(lapply(ais.data, substring, first = 8))
    names(severity.codes) <- paste0(names(severity.codes), "_severity")

    ## Set severity code 9 to NA
    severity.codes[] <- lapply(severity.codes, function(column) {
        column[column == "9"] <- NA
        return (column)
    })

    ## Loop over data, rowwise, and identify the region with the most
    ## severe injury. If more than one region has injuries of the same
    ## severity, the second most severe injury in those regions are
    ## compared, and then the third and so on. If two or more regions
    ## has exactly the same pattern of injuries, the region is
    ## classified as "Multiple".
    most.severe.region <- unlist(lapply(1:nrow(data), function(i) {
        ## Extract body region and severity codes and create a patient
        ## specific data.frame of body regions and severities
        patient <- as.data.frame(cbind(as.numeric(body.region.codes[i,]),
                                       as.numeric(severity.codes[i, ])))
        colnames(patient) <- c("body.region", "severity")
        ## Tabulate body regions with severity, so that the number of
        ## injuries of a certain severity is counted per body region
        severity.table <- with(patient, table(body.region, severity))
        ## Initialize values for a while loop, that identifies a "winner"
        winner <- c(NA, NA)
        ## The current column is equal to the severity degree in the
        ## severity table that should be checked. The starting value
        ## is the rightmost column in the table, equal to the highest
        ## severity
        current.column <- ncol(severity.table)
        ## The current rows are the rows, or body regions, that should
        ## be compared. The starting value is all body regions.
        current.rows <- rep(TRUE, nrow(severity.table))
        body.regions <- rownames(severity.table)
        ## The while loop stops when there is only one winner or it
        ## reaches the last column of the severity table
        while (length(winner) > 1 & current.column > 0) {
            winner <- body.regions[current.rows][severity.table[current.rows, current.column] == max(severity.table[current.rows, current.column])]
            current.column <- current.column - 1
            current.rows <- body.regions %in% winner
        }
        ## If there are two or more body regions with the same injury
        ## pattern than the most severe region is coded as multiple
        if (length(winner) > 1)
            winner <- "Multiple"
        return(winner)
    }))
    ## Recode the most severe injury column as a factor with the
    ## actual AIS body regions
    most.severe.region <- factor(most.severe.region,
                                 levels = c(as.character(1:9),
                                            "Multiple"),
                                 labels = c("Head",
                                            "Face",
                                            "Neck",
                                            "Thorax",
                                            "Abdomen",
                                            "Spine",
                                            "Upper Extremity",
                                            "Lower Extremity",
                                            "Unspecified",
                                            "Multiple"))
    ## Convert to character if asked for
    if (return.as.character)
        most.severe.region <- as.character(most.severe.region)
    return (most.severe.region)
 }
