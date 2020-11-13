#install.packages("shiny")
#library(shiny)
#runExample("01_hello")
#install.packages('rsconnect')

#library(rsconnect)
#library(shiny)
#library(ggplot2)
#library(dplyr)


split<-function(x)
{
  #gsub(">\\w+ *", "", x) %>% 
  y<-matrix(unlist(strsplit(x,split="\r\n")))
  #y<-y[!grep(">", y),]
  y<-gsub(">\\w+ *","",y)
  y<-gsub("\n","|",y)
  y<-gsub("\\|\\|","\n",y)
  y<-gsub("\\|","",y)
  #y<-y[y!="\\s+\n"]
  #return(paste(y,collapse=""))
  paste(y,collapse="")
}

# split_out<-function(x)
# {
#   #gsub(">\\w+ *", "", x) %>% 
#   y<-matrix(unlist(strsplit(x,split="\r\n")))
#   #y<-y[!grep(">", y),]
#   y<-gsub(">\\w+ *","",y)
#   y<-gsub("\n","|",y)
#   y<-gsub("\\|\\|","\r\n",y)
#   y<-gsub("\\|","",y)
#   #y<-y[y!="\\s+\n"]
#   print(y)
# }

#bcl <- read.csv("C:\\Users\\mmari\\Desktop\\desktop\\BC_Liquor_Store_Product_Price_List.csv", stringsAsFactors = FALSE)
#print(str(bcl))

ui <- fluidPage(
  titlePanel("Format converter"),
  sidebarLayout(
    sidebarPanel(
      #sliderInput("GC content", "GC content", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Input Format",
                   choices = c("fasta", "fastq"),
                   selected = "fasta"),
      #uiOutput("countryOutput"),
      textAreaInput("caption", "Input Sequences", "Copy and paste sequences here", width = "1000px"),
      # Button
      downloadButton("downloadData", "Download"),
      verbatimTextOutput("value")
    ),
    mainPanel(
    #  plotOutput("coolplot"),
    #  br(), br(),
    #  tableOutput("results")
    )
  )
)

 server <- function(input, output) {
   
   output$countryOutput <- renderUI({
     selectInput("desiredFormat", "Desired Output",
                 sort(c("FASTA","FASTQ","TEXT")),
                 selected = "text")
   })
   
    
  # filtered <- reactive({
  #   if (is.null(input$countryInput)) {
  #     return(NULL)
  #   }
  # 
  #   bcl %>%
  #     filter(CURRENT_DISPLAY_PRICE >= input$priceInput[1],
  #            CURRENT_DISPLAY_PRICE <= input$priceInput[2],
  #            PRODUCT_TYPE_NAME == input$typeInput,
  #            PRODUCT_COUNTRY_ORIGIN_NAME == input$countryInput,
  #            alcohol_content <- input$PRODUCT_ALCOHOL_PERCENT
  #     )
  # })
  
  # Reactive value for selected dataset ----
  #datasetInput <- reactive({
  #  switch(input$dataset,
  #         "rock" = rock,
  #         "pressure" = pressure,
  #         "cars" = cars)
  #})

 # output$value <- renderText({ input$caption })
  output$value <- renderText({  split(input$caption)
    })
  
  
  thedata<-reactive(renderText({  split(input$caption)
  }))
  
  # Downloadable csv of selected dataset ----
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$typeInput, ".txt", sep = "")
      #,print(toString(input$typeInput))
    },
    content = function(file) {
      #write.csv(split(input$caption), file, row.names = FALSE)
    # fileConn<-file(file)
    # writeLines(split_out(input$caption), fileConn)
    # close(fileConn)
      #gsub(">\\w+ *", "", x) %>% 
      y<-matrix(unlist(strsplit(input$caption,split="\r\n")))
      y<-gsub(">\\w+ *","",y)
      y<-gsub("\n","|",y)
      y<-gsub("\\|\\|","\n",y)
      y<-gsub("\\|","",y)
      print(input$typeInput)
      #print(y)
      #write.table(paste(sub("\r\n","",y),collapse=""),file,col.names=FALSE,row.names=FALSE,quote=FALSE)
      write.table(thedata(),file,col.names=FALSE,row.names=FALSE,quote=FALSE)
      #write.table(renderPrint({split_out(input$caption)
      #}),file,quote=FALSE,col.names=FALSE,row.names=FALSE)
    },
    contentType = "text/csv"
  )
                   
  # output$coolplot <- renderPlot({
  #   if (is.null(filtered())) {
  #     return()
  #   }
  #   ggplot(filtered(), aes(alcohol_content)) +
  #     geom_histogram()
  # })
  # 
  # output$results <- renderTable({
  #   filtered()
  # })
  
  
}

shinyApp(ui = ui, server = server)