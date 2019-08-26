#' Make the book, three versions
#' 
#' Function which, when run, creates the book.
#' 
#' @details
#' Uses three separate \code{.yml} files, specified by:
#' \enumerate{
#'   \item \code{_bookdown.yml} is the default, and creates the main version
#'         for the lecturer. 
#'   \item \code{_bookdown_gap.yml} creates the version for the students, 
#'          which has gaps (blank boxes).
#'   \item \code{_bookdown_gapfilled.yml} creates the completed version for 
#'         the students for the lecturer. 
#' } 
#'
#' One notices that a list of \code{params} is passed to the 
#' \code{bookdown::render} function. All of these are either the character 
#' string \code{'true'} or the character string \code{'false'}.
#' These are passed to the file \code{index.Rmd} where they are called
#' using R chunks.
#' \enumerate{
#'   \item \code{showtextparam} If \code{'true'} then shows all the text.
#'         If \code{'false'}, then there are 'gaps' and certain pieces of 
#'         text will be ommited (blank boxes or partially blank boxes).
#'   \item \code{useframe} If \code{'true'} then all the gapped equations
#'         or textboxes will have a frame drawn around them. If \code{'false'},
#'         then no framebox (although, currently, all options use 
#'         \code{'true'}).
#'   \item \code{gaptextisblue} If \code{'true'} then all the gapped 
#'         text/symbols/equations will be rendered in blue. If \code{'false'},
#'         then the gapped text is rendered in the usual colour (black).
#'   \item \code{showsidenotes} If \code{'true'} then shows the side notes
#'         in the margin. If \code{'false'}, then these notes are not shown.
#'         These are only used for the lecturer's version.
#' } 
makeAll <- function(){
    # clean_envir parameter messes up passing a list of parameters,
    # which is why everything is hardcoded.
    # filename <- "index.Rmd"

    # Master copy, with textboxes filled in with black text
    # by default config_file is _bookdown.yml, so do not need to specify
    bookdown::render_book("index.Rmd", 
                          'bookdown::pdf_book', 
                          params = list(showtextparam = 'true',
                                        useframe = 'true', 
                                        gaptextisblue = 'false',
                                        showsidenotes = 'true',
                                        moreboxspace = 'false', 
                                        vhval = '0.9')
                          )

    # Gapped version, with textboxes empty
    bookdown::render_book('index.Rmd', 
        'bookdown::pdf_book', 
        config_file="_bookdown_gap.yml",
        params = list(showtextparam = 'false',
                      useframe = 'true', 
                      gaptextisblue = 'false',
                      showsidenotes = 'false', 
                      moreboxspace = 'false', 
                      vhval = '0.9')
    )

    # Gapped version FILLED IN, with textboxes containing text in blue
    bookdown::render_book('index.Rmd', 
        'bookdown::pdf_book', 
        config_file="_bookdown_gapfilled.yml",
        params = list(showtextparam = 'true',
                      useframe = 'true', 
                      gaptextisblue = 'true',
                      showsidenotes = 'false',
                      moreboxspace = 'false', 
                      vhval = '0.9')
    )

    cat("Compiling master version\n")
    cat("Compiling gapped student version\n")
    cat("Compiling filled-in student version\n")
    cat("Done\n")

}

makeAll()
