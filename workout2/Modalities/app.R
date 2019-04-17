#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(shiny)
library(reshape2)

#' @title future value
#' @description calculates the future value based on intial value and rate
#' @param amount inital invested amount
#' @param rate annual rate of return
#' @param years number in years
#' @return future value
future_value <- function(amount, rate, years) {
  return(amount*(1 + rate)^years)
}

#' @title future value of annuity
#' @description calculates the future value of an annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param years number in years
#' @return future value of annuity
annuity <- function(contrib, rate, years) {
  return(contrib*(((1 + rate)^years - 1)/rate))
}

#' @title future value of growing annuity
#' @description calculates the future value of a growing annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param growth annual rate of growth
#' @param years number in years
#' @return future value of annuity
growing_annuity <- function(contrib, rate, growth, years) {
  return(contrib*(((1 + rate)^years - (1 + growth)^years)/(rate -growth)))
}

#' @title calculate savings
#' @description calculates savings across all modalities
#' @param initial initial amount
#' @param contrib contibuted amount
#' @param rate annual rate of return
#' @param growth annual rate of growth
#' @param years number in years
#' @return data frame of savings by year by modality
calc_savings <- function(initial, contrib, rate, growth, years) {
  no_contrib <- c()
  fixed_contrib <- c()
  growing_contrib <- c()
  for(k in 1:(years+1)) {
    no_contrib[k] = future_value(initial, rate, k-1)
    fixed_contrib[k] = future_value(initial, rate, k-1) + annuity(contrib, rate, k-1)
    growing_contrib[k] = future_value(initial, rate, k-1) + growing_annuity(contrib, rate, growth, k-1)
    print(future_value(initial, rate, k-1))
  }
  
  return(data.frame("year" = 0:years, no_contrib, fixed_contrib, growing_contrib))
}

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Modalities of Savings"),
   
   fluidRow(
     column(4, 
            sliderInput("init",
               "Initial Amount:",
               min = 0,
               max = 100000,
               value = 1000,
               step=500)
     ),
    column(4,
           sliderInput("rate",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       value = 5,
                       step = .1)
      ),
    column(4,
           sliderInput("yr",
                       "Years",
                       min = 0,
                       max = 50,
                       value = 20,
                       step = 1)
      )
   ),
   fluidRow(
     column(4, 
            sliderInput("contrib",
                        "Annual Contribution",
                        min = 0,
                        max = 50000,
                        value = 2000,
                        step = 500)
      ),
     column(4, 
            sliderInput("growth",
                        "Growth Rate (in %)",
                        min = 0,
                        max = 20,
                        value = 2,
                        step=.1)
      ),
     column(4, 
            selectInput("facet",
                        "Facet?",
                        c("No"="n", "Yes"="y"))
      )
   ),
  
   hr(),
   
      
  # Show a plot
  mainPanel(
     h2("Timelines"),
     plotOutput("distPlot", width = "900px"),
     h2("Balances"),
     tableOutput("data")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$data <- renderTable({calc_savings(input$init,input$contrib,input$rate/100,input$growth/100,input$yr)})
   
   output$distPlot <- renderPlot({
     if(input$facet == 'n'){
       d <- melt(calc_savings(input$init,input$contrib,input$rate/100,input$growth/100,input$yr), "year")
       ggplot(d, aes(year,value,color=variable)) + geom_point(size=2) + geom_line(size=1) +
         labs(x="years",y="dollars",title="Amount of Savings vs Years in Different Savings Modalities", color="Modalities")
       
     } else {
       d <- melt(calc_savings(input$init,input$contrib,input$rate/100,input$growth/100,input$yr), "year")
       names(d)[names(d)=="variable"] <- "Modalities"
       ggplot(d, aes(year,value,color=Modalities)) + 
         geom_point(size=2) + geom_line(size=1) + 
         geom_area(aes(fill=Modalities), alpha=.5, linetype="solid") +
         facet_wrap(~ Modalities) + 
         labs(x="years",y="dollars",title="Amount of Savings vs Years in Different Savings Modalities")
     }
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

