#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define cats data
Name <- c("Cougar","Lion","Cheetah","Domestic Cat","Tiger","Leopard","Jaguar","Eurasian Lynx","Serval")
SciName <- c("Puma concolor","Panthera leo","Acinonyx jubatus","Felis silvestris catus","Panthera tigris",
             "Panthera pardus","Panthera onca","Lynx lynx","Leptailurus serval")

SpeedKmh <- c(80,60,110,50,55,60,45,70,80)

HeightMtM <- c(.75,1.2,.8,.25,1.1,.7,.7,.7,.6)
HeightMtF <- c(.75,1.1,.7,.25,1.0,.6,.6,.6,.5)

WeightKgM <- c(75,190,50,4,250,58,90,25,15)
WeightKgF <- c(47,130,38,4,160,37,75,20,10)

LengthMtM <- c(1.3,2.2,1.4,.45,3,1.2,1.5,1.2,.85)
LengthMtF <- c(1.1,1.6,1.3,.45,2.5,1,1.2,1.1,.75)

catsdata <- data.frame(Name,SciName,SpeedKmh,HeightMtM,HeightMtF,LengthMtM,LengthMtF,WeightKgM,WeightKgF)



# Define server logic
shinyServer(function(input, output) {
   
  output$resPlot <- renderPlot({
    
        if (input$gender==2){
                catsdata$w <- catsdata$WeightKgM
                catsdata$h <- catsdata$HeightMtM
                catsdata$l <- catsdata$LengthMtM
                gnd <- ", masculine gender"
        } else {
                catsdata$w <- catsdata$WeightKgF
                catsdata$h <- catsdata$HeightMtF
                catsdata$l <- catsdata$LengthMtF                
                gnd <- ", feminine gender"
                
        }

        if (input$sci==FALSE){
                catsdata$n <- catsdata$Name
        } else {
                catsdata$n <- catsdata$SciName
        }

         if (input$select==1){
                tit <- "Speed"
                xaxl <- "Kilometers per hour"
                col <- "red"
                catsdata$y <- catsdata$SpeedKmh
            
        }
        if (input$select==2){
                tit <- paste0("Weight",gnd)
                xaxl <- "Kilograms"
                col <- "green"
                catsdata$y <- catsdata$w
                
        }    
        if (input$select==3){
                tit <- paste0("Height (withers)",gnd)
                xaxl <- "Meters"
                col <- "blue"            
                catsdata$y <- catsdata$h
                
        }    
        if (input$select==4){
                tit <- paste0("Length (excluding tail)",gnd)
                xaxl <- "Meters"
                col <- "yellow"             
                catsdata$y <- catsdata$l
                
        }    

        
        if (input$sorting==1){
                dt <- catsdata[order(catsdata[,14],decreasing = FALSE),]
        }  
        if (input$sorting==2){
                dt <- catsdata[order(catsdata[,14],decreasing = TRUE),]
        }  
        if (input$sorting==3){
                dt <- catsdata[order(catsdata[,13],decreasing = TRUE),]
        }  
          
        par(mar=c(5,10,4,4))      
        barplot(dt$y,names.arg = dt$n,horiz = TRUE,las=2,xlab=xaxl,main=tit,col=col)   
    
    
    
  })
  
})
