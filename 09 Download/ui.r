library(shiny)
titleStr <- "Plot iris dataset variables + download"

shinyUI(
    fluidPage(
        titlePanel(h4(titleStr, align = "center")),
        sidebarLayout(
            
            sidebarPanel(
                selectInput("varX", "Select the X variable",
                            choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3,
                                        "Petal.Width" = 4), selected = 1),
                selectInput("varY", "Select the X variable", 
                            choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3,
                                        "Petal.Width" = 4), selected = 1),
                radioButtons("format", "Select the download filetype", 
                            choices = c("PNG", "PDF"), selected = "PNG")
            ),
            
            mainPanel(
                plotOutput("IrisScat", width = 450),
                downloadButton("download", label = "Download iris plot")
            )
        )
    )
)
