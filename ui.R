shinyUI(
  navbarPage(theme = shinytheme("united"), title = "Bilan PNR", inverse = TRUE,
             sidebarLayout(
               sidebarPanel(
                 # "Prévision 2022", br(),
                            bilanuploadUI("main")#,
                            # "Exécution 2022",br(),
                            # "Perspective 2023"
                            ),
               mainPanel("Veuillez renseignez les informations concernant votre Pays",
                         br(),
                         read_bilan_UI("results")
                         )
             )
             )
  
)

