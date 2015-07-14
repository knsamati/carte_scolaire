library(shiny)
library(leaflet)
library(rgdal)

shinyServer(function(input, output,session) {

output$carte<-renderLeaflet({
  if(is.null(input$degre)){return()}
  data<-reactive({
    switch(input$degre,
           "Jardin"=jardin,
           "Primaire"=primaire,
           "Collège"=college,
           "Lycée"=lycee)
  })
 couleur<-switch(input$degre,
           "Jardin"="tomato",
           "Primaire"="skyblue",
           "Collège"="limegreen",
           "Lycée"="steelblue")

 leaflet(carto)%>%addTiles()%>%
  addPolygons(
    weight=2,
    opacity=1,
    color='white',
    smoothFactor=0.5,
    dashArray='3',
    fillOpacity=0.7) %>%addCircleMarkers(lng=~data()$LONGITUDE,lat=~data()$LATITUDE,radius=1.5,color=couleur,popup = ~paste0("<strong>Infrastructure: </strong>", data()$INFRASTRUCTURE,"<br><strong>Localité: </strong>",data()$LOCALITE,"<br><strong>Statut: </strong>",data()$STATUT))
     })
})
