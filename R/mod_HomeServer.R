#' Server for home tab
#'
#' @param strID Tab ID
#'
#' @return A Shiny module server function for the home tab.

HomeServer <- function( id="Home" ){
    retModule <- function( input, output, session ){}
    retServer <- moduleServer( id, module = retModule )
    return( retServer )
}

