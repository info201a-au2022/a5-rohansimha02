
library("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")
library("shinythemes")
library("shinyWidgets")

intro_view <- tabPanel(
"Introduction",
p("This report aims to analyze past data on CO2 levels in the world, and how different variables such as the country's population and year affect such CO2 emissions. This is a critical topic to research, as the effects of emissions have a significant impact on global warming, and thus the longevity of our planet. However, to identify the effects of these above variables on CO2 levels, we must first identify the scale of these specific CO2 emissions and when they were at their highest. The CO2 emissions being analyzed are annual total production-based emissions, excluding land-use change, measured in million tonnes. By calculating the three values below, one can identify some key figures on the CO2 emission crisis which will help the understanding of the interactive chart."),
p("Year with most CO2 emissions:1849"),
p("Years with least CO2 emissions:1750 to 1849"),
p("Average Country Population: 60,053,737"),
)
plot_view <- tabPanel(
  "Chart",
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectYear"),
      uiOutput("selectPopulation")
    ),
    
    mainPanel(
      plotlyOutput("chart")
    )
  )
)

ui <- navbarPage(
  "CO2 Emmissions",
  theme = shinythemes::shinytheme("darkly"),
  intro_view,
  plot_view
)