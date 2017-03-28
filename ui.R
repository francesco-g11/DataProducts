#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application 
shinyUI(pageWithSidebar(
  
  # Application title
        headerPanel("Big (and little) cat properties"),
  

    sidebarPanel(

            selectInput("select", label = h4("Select property"), 
                        choices = list("Speed" = 1, "Weight" = 2,
                                       "Height" = 3, "Length" = 4), selected = 1),
            radioButtons(inputId="gender", label="Gender", choices=list("Female"=1,"Male"=2)),
            checkboxInput("sci", "Use scientific name", FALSE),
            radioButtons(inputId="sorting", label="Sort results", 
                         choices= list("by value, higher on top"=1,"by value, lower on top"=2,"By name"=3))
        ),
    
    mainPanel(
            tabsetPanel(
                    tabPanel("Plot", plotOutput("resPlot")),
                    tabPanel("Help", 
                             h4("How to use this app"),
                             
                             h5("This app allows to show some properties (characteristics) of nine species of cats"),
                             h5("Select among speed, weight, height, length and see which one is the world champion!"),
                             h5("You can also differentiate by gender and sort the result by value or by name."),
                             h5("Finally, if you like bi-trinomial nomenclature, flag the scientific name option to turn a simple Cheetah into an Acinonyx Jubatus!")
                             )
            ))
  )
)
