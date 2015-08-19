#http://shiny.rstudio.com/


#shinyUI(bootstrapPage(
shinyUI(pageWithSidebar(
  titlePanel("Wind Chill Calculator"), 
  
#  sidebarLayout(
      sidebarPanel(
          radioButtons("radio", label = h3("Select units"),
                   choices = list("m/s and C" = 1, "km/h and C" = 2,
                                  "mph and F" = 3),selected = 1),
      
      
      
          plotOutput(outputId = "main_plot", height = "400px",width = "30%"),
      
      # Display this only if the density is shown
          conditionalPanel(condition = "input.radio == 1",
                       sliderInput("speed1",
                                   "Wind speed (m/s):",
                                   min = 2,
                                   max = 30,
                                   value = 5
                       ),
                       sliderInput("temperature1",
                                   "Temperature (Celsius):",
                                   min = -50,
                                   max = 10,
                                   value = -10
                       )                   
          ),
          conditionalPanel(condition = "input.radio == 2",
                       sliderInput("speed2",
                                   "Wind speed (km/h):",
                                   min = 5,
                                   max = 100,
                                   value = 10
                        ),
                       sliderInput("temperature2",
                                   "Temperature (Celsius):",
                                   min = -50,
                                   max = 10,
                                   value = -10
                        )                   
          ),
      
          conditionalPanel(condition = "input.radio == 3",
                       sliderInput("speed3",
                                   "Wind speed (mph):",
                                   min = 3,
                                   max = 65,
                                   value = 10
                        ),
                       sliderInput("temperature3",
                                   "Temperature (Fahrenheit):",
                                   min = -60,
                                   max = 50,
                                   value = 15
                       )                   
          )
      ),
      mainPanel(
          h5("Predict the wind chill effect that is how cold it feels when the wind is blowing. Select the units and use the sliders to set
          the wind speed and the temperature. The red bar shows the air temperature and the light blue bar shows , how cold it feels.")
      )


))