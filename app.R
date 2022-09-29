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
library(dplyr)
library(hrbrthemes)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Check Country Temperature Forcast for 24 Hour"),
  sidebarLayout(
    sidebarPanel(
      textInput("countryName", "Enter Country Name here:","sweden")
    ),
        mainPanel(
           plotOutput("ggPlot")
        )
    )
)

server <- function(input, output) {
  output$ggPlot <- renderPlot({
    cityName <-input$countryName
    result <- lab5AdvanceR::fetchWeatherData(cityName)
      plot1 <-  ggplot2::ggplot(data = result, mapping = ggplot2::aes(x = temp_c, y = time))+
      # ggplot2::geom_point() +  ggplot2::geom_line() +
        ggplot2::geom_line(aes(group=1))+
        ggplot2::geom_point(shape=21, color="red", fill="#69b3a2", size=2) +
        ggplot2::ggtitle("24 Hour Weather Forcast for a Current Date") +
        ggplot2::labs(y = "Date and TIme", x = "Temperature in Degrees")+
        hrbrthemes::theme_ipsum()
      base::print(plot1)
      })
}

# Run the application
shinyApp(ui = ui, server = server)
