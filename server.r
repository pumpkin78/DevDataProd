library(shiny)
fit = glm(mpg ~ cyl + hp + am + wt, data = mtcars)


shinyServer(
 function(input, output) {
   output$inputCyl <- renderPrint({input$cyl})
   output$inputHp  <- renderPrint({input$hp})
   output$inputAm  <- renderPrint({input$am})
   output$inputWt  <- renderPrint({input$wt})
   output$predict_MPG <- renderPrint(predict(fit, 
        data.frame(cyl = c({input$cyl}), 
                   wt = c({input$wt}), 
                   hp = c({input$hp}),
                   am = c(as.numeric({input$am}))
        )
   ))
   output$plot = renderPlot({
        plot(mtcars$wt,
             predict(fit,
                     data.frame(
                             cyl = rep({input$cyl}, length(mtcars$wt)),
                             wt  = mtcars$wt,
                             hp  = rep({input$hp}, length(mtcars$wt)),
                             am =  rep(as.numeric({input$am}), length(mtcars$wt))
                     )
             ),
             xlab = "Weight (lb/1000)", ylab = "MPG", 
             main = paste("Trend of predicted MPG v.s. Weight, \ncyl =", {input$cyl}, ", hp =", {input$hp}, ", am =", {input$am}),
         )
        #abline(predict(fit,), 1, col = "red")
    })
   
 }
)
 

