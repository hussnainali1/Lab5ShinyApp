#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(lab5AdvanceR)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Check Country Temperature Forcast for 24 Hour"),
  sidebarLayout(
    sidebarPanel(
      textInput("countryName", "Enter Country Name","sweden")
    ),
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   # yo <- lab5AdvanceR::fetchWeatherData("pak")
      abc <- reactive("input$countryName")
      print(abc)
      yo <- lab5AdvanceR::fetchWeatherData("abc")
      output$distPlot <- renderPlot({
      plot1 <-  ggplot2::ggplot(data = yo, mapping = ggplot2::aes(x = yo$temp_c, y = yo$time))+
      ggplot2::geom_point() +  ggplot2::geom_line()
      base::print(plot1)    })
}

# Run the application
shinyApp(ui = ui, server = server)
