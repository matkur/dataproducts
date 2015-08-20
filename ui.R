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
        h5("Often cold temperatures can feel much colder based on the speed of the wind is blowing. That effect is called the wind chill."),
        h5("Select the units for wind speed and air temperature and use the sliders to set the values for the wind speed and the temperature. The red bar shows the air temperature and the light blue bar shows, how cold it feels."),
        h5("There must be some wind before the wind chill takes effect and also the formulas used are not accurate if the wind speed is close to zero. If it is hot, we don't calculate the wind chill effect."),
        h5("The wind chill temperature can be less than the scale in the plot but in that case the bar goes downwards.")
      )
))