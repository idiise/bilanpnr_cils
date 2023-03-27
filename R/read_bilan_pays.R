
read_bilan_UI <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("submit_read"), "Voir tableau",width = 150),
    DTOutput(ns("results"))
  )
}

read_bilan_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      data <- reactiveValues()
      
      observeEvent(input$submit_read,{
        url <- Sys.getenv("db_url")
        
        data$results <- future({
          download_df(
            projectURL = url,
            fileName = "prodagricole" )
          
        })
      })
      
      output$results <- renderDataTable({
        donnee <- data$results
      })
    }
  )
}