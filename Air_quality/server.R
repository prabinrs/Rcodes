library(shiny)
library(leaflet)
shinyServer(function(input, output,session){
  
  points <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$OpenStreetMap) %>%
      setView( 85.3219, 27.7097, 13, options = list())%>% 
      addTiles(urlTemplate = "http://tiles.aqicn.org/tiles/usepa-aqi/{z}/{x}/{y}.png?token=_TOKEN_ID_", 
               options = tileOptions())
})
})