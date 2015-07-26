
#
# Project for Developing Data Products Coursera Class
# ddoyle June 2015
#
# The idea for this app came from an article on R and the Weather
# located at:
# http://blog.revolutionanalytics.com/2014/02/r-and-the-weather.html
# The app uses the weatherData package to obtain its core data
# https://cran.r-project.org/web/packages/weatherData/index.html
#
# The user selects an airport/location from the drop down list
# and selects a date range.
# On clicking the "Update Graph" button, the
# average daily temperature is retrieved from wunderground for
# the selected location & date range if available
# The average temp is then plotted over time.
#
# As this is a demonstration error handling is pretty limited
# and would need some improvement for a production-ready
# app :-)
#

#




library(shiny)
library(ggplot2)

shinyUI(fluidPage(

  # Application title

  titlePanel("Weather Viewer"),
  

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      #  some text for the user here

      p("Select a location and date range before pressing the 
         Update Graph button - the average temperature for
        the location / date range will be graphed."),
      p("Note: It can take 10 seconds to retrieve the data from Weather Underground."),
      # 
      
      #sliderInput("bins",
      #            "Number of bins:",
      #            min = 1,
      #            max = 50,
      #            value = 30),
      selectInput("airportCode",
                  "Airport Code:",
                  choices = list("San Francisco" = "sfo", "Columbus" = "cmh",
                                 "Dublin" = "dub", "Helsinki" = "hel", "Paris" = "ory" ), selected = 'cmh'),
      dateRangeInput("daterange",
                     "Date Range:",
                     start = "2015-01-01",
                     end = "2015-07-15",
                     format = "yyyy-mm-dd", 
                     separator = " to "), 
      submitButton("Update Graph")
    ),

    # Show a plot of the generated distribution
    mainPanel( "Result of Query",
      p(" "),
      strong("Requested Start Date"),
      textOutput("test"),
      strong("Requested End Date"),
      textOutput("test2"),
      strong("Data Result:"),
# unclear why the error message isn't printing - need to fix later      
      textOutput("test3"),
      br(),

      plotOutput("test4")
    )
  )
))
