library(shiny)

ui <- basicPage(
    numericInput("a11", "输入 a11:", 1),
    numericInput("a12", "输入 a12:", 2),
    numericInput("a21", "输入 a21:", 3),
    numericInput("a22", "输入 a22:", 4),
    numericInput("b1", "输入 b1:", 5),
    numericInput("b2", "输入 b2:", 6),
    verbatimTextOutput("default")
)

server <- function(input, output) {
    output$default <- renderText({ 
        a <- c(input$a11, input$a12, input$a21, input$a22)
        b <- c(input$b1, input$b2)
        A <- matrix(a, nrow = 2, ncol = 2, byrow = TRUE)
        d <- (A[2, 1] * A[1, 2] - A[1, 1] * A[2, 2])
        x1 <- (b[2] * A[1, 2] - b[1] * A[2, 2]) / d
        x2 <- (b[1] * A[2, 1] - b[2] * A[1, 1]) / d
        c(x1, x2)
    })
}

shinyApp(ui = ui, server = server)
