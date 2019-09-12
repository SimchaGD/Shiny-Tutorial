
library(shiny)

shinyUI(
    fluidPage(
        titlePanel(h3("Iris dataset", align = "center")),
        sidebarLayout(
            
            sidebarPanel(
                selectInput("var", "Select the variable from the iris dataset",
                            choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3,
                                        "Petal.Width" = 4), selected = 1),
                sliderInput("bins", "Select the number of BINS for histogram", 
                            min = 5, max = 25, value = 15),
                radioButtons("colour", "Select the color of the histogram", 
                            choices = c("Green", "Red", "Yellow"), selected = "Green")
            ),
            
            mainPanel(
                tabsetPanel(
                    type = "tabs",
                    tabPanel("Summary", verbatimTextOutput("summary")),
                    tabPanel("Structure", verbatimTextOutput("struct")),
                    tabPanel("Data", tableOutput("IrisData")),
                    tabPanel("Plot", plotOutput("IrisHist"))
                )
            )
        )
    )
)
