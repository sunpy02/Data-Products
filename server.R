library(shiny)


shinyServer(function(input, output) {

  

    output$owt <- renderPrint({input$wt*1000})
    output$oam <- renderText({
      if (input$am==1) "Manual"
      else "Automatic"
    })
    output$ocyl <- renderPrint({input$cyl})
    
    output$MPG<-reactive({
      dataset <-mtcars[mtcars$am==input$am,]
         fit<-lm(mpg~cyl+wt,data=dataset)
        newdata<-dataset[1,]
         newdata$cyl<-as.numeric(input$cyl)
         newdata$wt<-input$wt
         p<-predict(fit,newdata)
         as.numeric(p)
      
    })

})
