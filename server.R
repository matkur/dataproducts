library(shiny)
windChill1 <- function(v,t) 13.12+0.6215*t-13.956*v^0.16+0.4867*t*v^0.16
windChill2 <- function(v,t) 13.12+0.6215*t-11.37*v^0.16+0.3965*t*v^0.16
windChill3 <- function(v,t) 35.74+0.6215*t-35.75*v^0.16 + 0.4275*t*v^0.16

shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    a2 <- as.numeric(input$radio)
    if (a2 == 1) {
      v = as.numeric(input$speed1)
      t <- as.numeric(input$temperature1)
      speed <-as.numeric(input$speed1)
      temperature <- as.numeric(input$temperature1)
      z=50
      b1 <- 0
      b2 <- 70
      b3 <- 5
      c1 <--50
      c2 <- 20
      c3 <- 5
      dat <-c(temperature,windChill1(v,t))
    }
    if (a2 == 2){   
      v = as.numeric(input$speed2) * 3.6
      t = as.numeric(input$temperature2)
      speed <-as.numeric(input$speed2)
      temperature <- as.numeric(input$temperature2)
      z=50
      b1 <- 0
      b2 <- 70
      b3 <- 5
      c1 <--50
      c2 <- 20
      c3 <- 5
      dat <-c(temperature,windChill2(v,t))      
    }
      
    if (a2 == 3) {   
      v = as.numeric(input$speed3) * 0.44704
      t = (as.numeric(input$temperature3) -32)/ 1.8
      speed <-as.numeric(input$speed3)
      temperature <- as.numeric(input$temperature3)
      z=60
      b1 <- 0
      b2 <- 110
      b3 <- 10
      c1 <--60
      c2 <- 50
      c3 <- 10
      dat <-c(temperature,windChill3(v,t))
    }
#    dat <- c(-20, -35)

    dat <-c(temperature,windChill(v,t))
    xx <- barplot(dat+z, axes = FALSE, col=c("red","lightblue"), names.arg=c("Temperature","Wind Chill"), ylim=c(b1,b2), width=5)
    
    text(xx, 0, round(dat, 1),cex=1,pos=3) 
    axis(2,seq(b1,b2,by=b3),seq(c1,c2,by=c3))
    xx
     })
})
