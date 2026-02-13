#' app_ui
#'
#' Application UI
#'
#' @return shinydashboard::dashboardPage containing the app
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export

app_ui <- function(){

#   TabItems <- function( ... ){
#     args <- list(...)
#     vArgs <- c()
#     for (i in 1:length(args)) {
#       #print( class(args[[i]] ))
#       if (class(args[[i]]) == "shiny.tag"){
#         vArgs <- c(vArgs, args[i])
#       }
#       else if (class(args[[i]]) == "list"){
#         vArgs <- c(vArgs, c(args[[i]]))
#       }
#     }
#     retTabItems <- do.call("tabItems", vArgs)
#
#     return(retTabItems)
#   }

  header <- dashboardHeader(
    title = "prep.shiny",
    titleWidth = 300,

    ## Drop down menu
    dropdownMenu(
      type = "notifications",
      badgeStatus = NULL, icon = icon("question"),
      headerText = div(style = "color:purple; font-size:150%","About"),
      notificationItem(text="Version: Beta v0.1", icon=icon("angle-right")),
      notificationItem(text="Author: ", icon=icon("angle-right")),
      notificationItem(text="Contact: _CONTACT_EMAIL_", icon=icon("angle-right")),
      notificationItem(text="Release Date: 2020-XXX-XX", icon=icon("angle-right"))
    )
  )

  sidebar <- shinydashboard::dashboardSidebar(
    shinydashboard::sidebarMenu(
      id = "sidebar_tabs",
      # whisker tag to add sidebar UI
      # 
menuItem(text = 'Home', tabName = 'Home', icon = icon('angle-right'))
,menuItem(text = 'Simulation', tabName = 'Simulation', icon = icon('angle-right'))
,menuItem(text = 'Feedback', tabName = 'Feedback', icon = icon('angle-right'))
,menuItem(text = 'Options', tabName = 'Options', icon = icon('angle-right'))
 #{{ADD_NEW_MODULE_SIDEBAR}}
    )
  )

  body <-  dashboardBody(
    uiOutput("theme"), #inserts theme if options tab is present
    tabItems(
      # whisker tag to add module UI
      # 
tabItem(tabName='Home', HomeUI())
,tabItem(tabName='Simulation', SimulationUI())
,tabItem(tabName='Feedback', FeedbackUI())
,tabItem(tabName='Options', OptionsUI())
 #{{ADD_NEW_MODULE_UI}}
    )
  )
  return(dashboardPage(header=header, sidebar=sidebar, body=body))
}


