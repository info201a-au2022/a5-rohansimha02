#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library("shiny")
library("tidyverse")
library("dplyr")
library("ggplot2")
library("plotly")
library("rsconnect")
library("shinythemes")

data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)


highest_year_co2 <- data %>%
  group_by(year) %>%
  filter(co2==max(co2), na.rm=TRUE) %>%
  summarise(co2=sum(co2)) %>%
  filter(year==max(year)) %>%
  pull(year)

lowest_year_co2 <- data %>%
  group_by(year) %>%
  filter(co2==min(co2), na.rm=TRUE) %>%
  summarise(co2=sum(co2)) %>%
  pull(year)

find_avg_population <- data %>% 
  filter(!is.na(population)) %>%
  summarise(avg_population=mean(population)) %>%
  pull(avg_population)

uiInput <- renderUI({
  selectInput("Year", "Select Year", choices=unique(data$year))
})

UiInput <- renderUI({
  sliderInput("Population", "Select Population", min = 21, max = 7909295104, value = c(21, 7909295104))
  
})

server <- function(input, output){
  
  chart <- reactive({
    plot_data <- data %>%
      filter(year %in% input$Year) %>%
      filter(population >= input$Population[1] & population <= input$Population[2]) %>%
      return(plot_data)
    
    
    ggplotly(
      ggplot(chart(plot_data), aes(x = population, y = co2))) +
      geom_line(color = "blue") +
      labs( title = "Effect of Year on amount of CO2 by Population",
            x = "Population",
            y = "CO2",
            caption = "This chart shows the effects of different years and population ranges on the relationship between Country Population and CO2 emissions." ) 
    
  })
  output$chart <- renderPlotly({
    
  })
}
