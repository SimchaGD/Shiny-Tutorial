library(shiny)
titleStr <- "Download datasets"

shinyUI(
    fluidPage(
        titlePanel(h4(titleStr, align = "center")),
        sidebarLayout(
            
            sidebarPanel(
                selectInput("dataset", "Select the dataset",
                            choices = list("iris", "mtcars", "trees"), 
                            selected = 1),
                selectInput("format", "Select download format", 
                            choices = list("Excel", "CSV", "TXT"), 
                            selected = 1),
                br(),
                helpText("Click on the download button to download the dataset"),
                downloadButton("download", label = "Download")
            ),
            
            mainPanel(
                h3("Dataset preview"),
                tableOutput("out")
            )
        )
    )
)
