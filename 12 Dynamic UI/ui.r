library(shiny)
titleStr <- "Dynamic UI!"

shinyUI(
    fluidPage(
        titlePanel(h4(titleStr, align = "center")),
        sidebarLayout(
            
            sidebarPanel(
                selectInput("dataset", "Select the dataset",
                            choices = list("iris", "mtcars", "trees"), 
                            selected = 1),
                br(),
                uiOutput("vx"),
                uiOutput("vy")
            ),
            
            mainPanel(
                h3("Dataset plot"),
                plotOutput("plot")
            )
        )
    )
)
