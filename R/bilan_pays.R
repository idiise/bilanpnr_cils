bilanuploadUI <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(ns("pays"),"Pays", choices = c("Benin", "Burkina Faso", "Cape Verde", 
                                               "Côte d’Ivoire", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", 
                                               "Mali", "Mauritania", "Niger", "Nigeria", "Senegal", "Sierra Leone", "Togo")),
    textInput(ns("region"), "Région",value = ""),
    selectInput(ns("activite"), "Activités", choices = c("Food For Work", "Cash For Work", "Distribution Gratuite Ciblée de vivres", "Distribution Gratuite Ciblée d’argent", "Vente des céréales à prix modéré (subventionné)", "Autres", "Prise en charge nutritionnelle des enfants âgés de 06 à 59 mois souffrant de Malnutrition Aiguë Sévère (avec et sans complication).", "Prise en charge nutritionnelle des enfants âgés de 6 à 23 mois souffrant de Malnutrition Aiguë Modérée (MAM).", "Distribution de rations alimentaires complémentaires pour les Femmes Enceintes et Femmes Allaitantes (FEFA)", "Organisation de la distribution de rations alimentaires pour les mères accompagnantes dans les CRENI", "Prévention nutritionnelle auprès des enfants de 6–23 mois vivant dans les ménages très pauvres des communes vulnérables (Blanket Feeding)", "Appui aux producteurs de cultures pluviales des zones vulnérables en semences d’urgence", "Renforcement de la disponibilité en aliments pour bétail", "Appui alimentaire aux populations potentiellement victimes des inondations", "Appui aux populations Réfugiées des zones en crises", "Appui aux populations déplacées internes des zones en crises", "Appui aux populations migrantes et rapatriées", "Appui aux populations retournées", "Appui aux  systèmes d’information sur la situation alimentaire, nutritionnelle et de veille pastorale", "Renforcement des capacités de la coordination des activités du Plan d’urgence", "Vulgarisation, suivi-évaluation de la mise en œuvre du PNU", "Communication et plaidoyer pour la mobilisation des ressources du PNU", "Capitalisation et consolidation des données sur les interventions à travers une Revue Après Actions (RAA) des interventions du PNU")
),
    selectInput(ns("annee"), "Prévisions", choices = c(2019, 2020, 2021, 2022,2023)),
    numericInput(ns("qtite"), "Nbre de bénéficiaire",value = ""),
    numericInput(ns("qtiteprv"), "Nombre/Qté",value = ""),
    numericInput(ns("couttotprev"), "Cout total",value = ""),

    textInput(ns("mail"), "Email"),
    actionButton(ns("submit"), "validé",width = 100)
  )
}

bilanuploadServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      observeEvent(input$submit,{
        pays <- input$pays
        region <- input$region
        activite <- input$activite
        annee <- input$annee
        qtite <- input$qtite
        qtiteprv <- input$qtiteprv
        couttotprev <- input$couttotprev
        mail <- input$mail
        time <- Sys.time()
        url <- Sys.getenv("db_url")
        
        
        # future({
          upload_row(
            x = list(
              "Pays" = pays,
              "region" = region,
              "Annee Prévision" = annee,
              "Activités" = activite,
              "Nombre de bénéficiaire" = qtite,
              "Qté prévu" = qtiteprv,
              "Coût total prévu" = couttotprev,
              "mail" = mail,
              "Submission" = time
            ),
            projectURL = url,
            fileName = "prodagricole"
          )
        # })
        
      }
      )
      
    }
  )
}