library(shiny)
library(leaflet)
library(shinythemes)


shinyUI(

  bootstrapPage(theme = shinytheme("united"),

    tags$head(tags$style("html,body {width:100%;height:100%}
.floater { background-color: white; padding: 8px; opacity: 0.7; border-radius: 6px; box-shadow: 0 0 15px rgba(0,0,0,0.2); }
  ")),

  leafletOutput("carte",width = "100%", height = "100%"),

    absolutePanel(
      right = 30, top = 10, width = 200, class = "floater",
      selectInput("degre", label = h3("Selection de niveau:"),
                  choices = list("Jardin","Primaire","Collège","Lycée"),selected = "Jardin")
    ),
  absolutePanel(
    right = 30, top = 280, style = "", class = "floater",

    h4("Info sur l'établissement"),
    uiOutput("Info")
  )

  )
)

