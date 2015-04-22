Channel = c("food","drug","conv")
Market = c("U.S.","market")
Product=c("brand","category","total store")




shinyUI(pageWithSidebar(
  headerPanel('Relative Standard Error'),
  sidebarPanel(
    selectInput(inputId='channel', label='Channel', choices=Channel),
    selectInput(inputId='market', label='Market', choices=Market),
    htmlOutput("selectUI") 
  ),
  mainPanel(
    tableOutput('cv')
  )
  

  
))