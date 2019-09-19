# load shiny lib
library(shiny)
library(stringi)

shinyServer(
    function(input, output, session) {
        ## Begin screen condition: Don't show the sidebar options if the data isn't loaded
        output$dataLoaded <- reactive({
            if (is.null(input$file)){
                return(FALSE)
            } else{
                return(TRUE)
            }
        })
        
        # zorgt ervoor dat deze functie gebruikt kan worden, ondanks dat het niet zichtbaar is op 
        # de UI
        outputOptions(output, "dataLoaded", suspendWhenHidden = FALSE)
        
        # Dit maakt de dropdown voor het kiezen van een file. Als je maar 1 file hebt gekozen, dan 
        # hoef je deze input natuurlijk niet te hebben. 
        output$selectfile <- renderUI({
            if (is.null(input$file)){return()}
            if (length(input$file$name) < 2){
                return()
            } else {
            list(hr(),
                 helpText("Choose for which file you need to see the data"),
                 selectInput("Select", "Select", choices = input$file$name))    
            }
        })
        
        # Inlezen van de data 
        data <- reactive({
            file1 <- input$file
            if (is.null(file1)){return()}
            # Als er twee of meer bestanden zijn geüpload, dan moet de gebruiker een keuze te maken
            if (length(input$file$name) < 2){
                inputFile <- file1$datapath
            } else{
                inputFile <- file1$datapath[input$file$name == input$Select]
            }
            
            read.table(file = inputFile, 
                       sep = input$sep, header = input$header, quote = "\"", comment.char = "")
        })
        
        # meta data preview
        output$filedf <- renderTable({
            if (is.null(data())){return()}
            input$file
        })
        
        # overzicht van de data
        output$summary <- renderPrint({
            if(is.null(data())){return()}
            summary(data())
        })
        
        # data preview
        output$table <- renderTable({
            if(is.null(data())){return()}
            head(data(), n = 10)
        })
        
        # Je kan alleen de tabladen zien als er data is geüpload. Daarom laten we eerst 
        # iets anders zien
        output$tb <- renderUI({
            if(is.null(data())){
                media <- "https://media1.tenor.com/images/e8cf8b3a86d03c87a7c5b371924e509d/tenor.gif"
                
                h3("No data loaded", 
                   br(), br(), br(), br(), br(),
                   tags$img(src = media))
            }
            else{
                # Dit is wat je normaal in ui.r zou zetten als het niet conditional was
                tabsetPanel(
                    tabPanel("meta", 
                             tableOutput("filedf"), value = 1),
                    tabPanel(title = "Data preview", 
                             tableOutput("table"), value = 2),
                    tabPanel("Summary", 
                             verbatimTextOutput("summary"), value = 3),
                    id = "selectedtablad"
                )
            }
            
        })
        
        # Met observeEvent kan er gekeken worden wanneer iets veranderd wordt en daar vervolgens
        # een actie aan koppelen. In dit geval is het dat er terug naar tablad 2 gegaan moet worden
        observeEvent(
            {
                input$header
                input$sep
                input$Select
            }, 
            {
                updateTabsetPanel(session = session, inputId = "selectedtablad", selected = "2")
            }
        )
        
    }   
)
