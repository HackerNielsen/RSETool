CV<- data.frame(Channel=c(
  "food",
  "drug",
  "conv",
  "food",
  "drug",
  "conv",
  "food",
  "drug",
  "conv",
  "food",
  "drug",
  "conv",
  "food",
  "drug",
  "conv"),Market=c("U.S.",
                   "U.S.",
                   "U.S.",
                   "U.S.",
                   "U.S.",
                   "U.S.",
                   "market",
                   "market",
                   "market",
                   "market",
                   "market",
                   "market",
                   "market",
                   "market",
                   "market"),Product=c("brand",
                                       "brand",
                                       "brand",
                                       "category",
                                       "category",
                                       "category",
                                       "brand",
                                       "brand",
                                       "brand",
                                       "category",
                                       "category",
                                       "category",
                                       "total store",
                                       "total store",
                                       "total store"),CV=c(95,
                                                           245,
                                                           68,
                                                           56,
                                                           146,
                                                           41,
                                                           60,
                                                           175,
                                                           63,
                                                           38,
                                                           102,
                                                           37,
                                                           34,
                                                           92,
                                                           33))

shinyServer(function(input, output, session) {
  
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    CV[(CV$Channel==input$channel&
          CV$Market==input$market),]
    
    
    
    
  })
  
  output$selectUI <- renderUI({ 
    selectInput("product", "Product", as.character(selectedData()[,3]) )
  })
  
  
  selectedCV <- reactive({
    
    CV[(CV$Channel==input$channel&
          CV$Market==input$market&
          CV$Product==input$product),]
    
    
    
    
  })
  
  output$cv <- renderTable(selectedCV())

  
})

