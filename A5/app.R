# Final Project shiny application 

#Load libraries
library("shiny")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")
library("shinythemes")

# Use source() to excute the "app_ui.R" and "app_server.R" files. These will
# define the UI value and server function respectively.
source("ui.R")
source("server.R")

# Create a new "shinyApp()" using the loaded "ui" and "server" variables
shinyApp(ui = ui, server = server)
