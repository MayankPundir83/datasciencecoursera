library(shiny)
shinyUI(fluidPage(
        theme = "bootstrap.css",
        tags$head(
                tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
      h1 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }

    "))
        ),
        
        headerPanel("Childs Hight Calculator"),
        sidebarPanel(
                numericInput('id1','Enter Age of Father in Inches',12,min = 12,max = 200,step = 1),
                numericInput('id2','Enter Age of Mother in Inches',12,min = 12,max = 200,step = 1),
                selectInput("var", label = "Choose a Gender of the child",
                     choices = c("male", "female"),
                            selected = "female"),
                submitButton('Submit')
        ),
        mainPanel(
                h3('Prediction Results'),
                h4('The childs Hight in Inches'),
                verbatimTextOutput("oid1"),
                h4('The childs Hight in Feets'),
                verbatimTextOutput("oid2"),
                h4('The childs Hight in centimeters'),
                verbatimTextOutput("oid3"),
                plotOutput('newplot')
                
        )
))