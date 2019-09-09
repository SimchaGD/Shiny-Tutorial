library(shiny)
library(stringi)
library(writexl)

shinyServer(
    function(input, output){
        # determine output
        output$out <- renderTable({
            # Use switch-case
            switch(input$dataset, 
                   "iris" = head(iris, n = 10),
                   "mtcars" = head(mtcars, n = 10),
                   "trees" = head(trees, n = 10)
            )
        })
        
        # create download handler
        output$download <- downloadHandler(
            # Specify filename
            filename = function() {
                fileExt <- switch(
                    input$format, 
                    "Excel" = "xlsx",
                    "CSV" = "csv",
                    "TXT" = "txt"
                )
                name <- input$dataset
                paste(name, fileExt, sep = ".")
            },
            
            # Specify Content
            content = function(file) {
                # Decide fileSep
                fileSep <- switch(
                    input$format, 
                    "Excel" = ",",
                    "CSV" = ";",
                    "TXT" = "\t"
                )
                
                # Choose table for download
                data <- switch(input$dataset, 
                               "iris" = iris,
                               "mtcars" = mtcars,
                               "trees" = trees)
                
                # Different method to write out a table to excel than csv/txt
                if (stri_cmp_eq(input$format,"Excel")){
                    write_xlsx(data, file)
                }else{
                    write.table(data, file, sep = fileSep, row.names = FALSE)
                }
                
            }
        )
    } 
)