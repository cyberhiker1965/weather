
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(weatherData)
library(ggplot2)



shinyServer(function(input, output) {
  
#  output$weatherCheck = renderText(format(input$daterange[1]))

   begindate <- reactive( format(input$daterange[1]) )
#   print(begindate())
  output$test <- begindate
   enddate <- reactive( format(input$daterange[2]) )
  output$test2 <- enddate
#   print(enddate())
#   result <- begindate()
  result <- reactive( { checkresult <- checkDataAvailabilityForDateRange(input$airportCode, begindate(),
                                      enddate()) 
                        
                        if ( checkresult == "1") {
                          output$test3 <- "Data is available from Weather Underground"
                        } else {
                          output$test3 <- "Sorry, data is not available from Weather Underground. Please select another date range."    
                        }
                        
                        
                        })

  
  weatherInfo <-   reactive( getSummarizedWeather(input$airportCode, begindate(), enddate(),
                                          opt_temperature_columns = TRUE,
                          opt_all_columns = FALSE, opt_custom_columns = FALSE,
                          custom_columns = NULL, opt_verbose = FALSE) )


 output$test4 <- renderPlot(   plot( x=weatherInfo()$Date, y=weatherInfo()$Mean_TemperatureF,
                                     xlab = "Date", ylab = "Temperature (F)",
                                     main = "Temperature for selected date range") )

} )
   
   
  
