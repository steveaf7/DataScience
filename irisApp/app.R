library(shiny)



data(iris)

ui <- fluidPage(
  titlePanel("Iris Correlation between any combination of variables"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("yAxis", "Y-Axis:",
                  c("Sepal.Width", "Sepal.Length", "Petal.Length", "Petal.Width")),
      
      selectInput("xAxis", "X-Axis:",
                  c("Sepal.Width", "Sepal.Length", "Petal.Length", "Petal.Width"))
  ),
    
  mainPanel(plotOutput("plot"))
  )
)

server <- function(input, output){
   output$plot <- renderPlot({
     plot(iris[[input$xAxis]], iris[[input$yAxis]],
          )
   })
}

shinyApp(ui = ui, server = server)
