library(UsingR)
library(caret);library(kernlab);
data(GaltonFamilies)

shinyServer(
        function(input,output){
                modelfit <- train(childHeight ~ father + mother + gender,data=GaltonFamilies,method="glm")
                results <- function(id1,id2,var){
                        predict(modelfit,newdata=data.frame(father=id1,mother=id2,gender=var))
                }
                results1 <- results
                results2 <- results
                output$oid1 <- renderPrint({round(results(input$id1,input$id2,input$var),2)})
                output$oid2 <- renderPrint({round(results(input$id1,input$id2,input$var)/12,2)})
                output$oid3 <- renderPrint({round(results(input$id1,input$id2,input$var)*2.54)})
                output$newplot <- renderPlot({a <- data.frame(Height=c(input$id1,input$id2,round(results(input$id1,input$id2,input$var),2)),Family=c('Father','Mother','Child'))
                                              ggplot(a, aes(x=Family,y=Height,fill=Family)) + geom_histogram(stat="identity") + ggtitle("Prediction Plot") + ylab("Hight In Inches")}) 
                
        }
)