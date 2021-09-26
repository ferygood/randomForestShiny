library(shiny)
library(shinythemes)
# ui
fluidPage(
    theme = shinytheme("spacelab"),
    navbarPage(
        title="Random Forest App",
        tabPanel(
            title = "Iris Classification",
            sidebarPanel(
                tags$h3("Inputs:"),
                sliderInput(
                    inputId = "sepal_length",
                    label = "Sepal length",
                    min = 4,
                    max = 8,
                    value = 6,
                    step = 0.1
                ),
                sliderInput(
                    inputId = "sepal_width",
                    label = "Sepal width",
                    min = 2,
                    max = 4.6,
                    value = 3,
                    step = 0.1
                ),
                sliderInput(
                    inputId = "petal_length",
                    label = "Petal length",
                    min = 1,
                    max = 7,
                    value = 4,
                    step = 0.1
                ),
                sliderInput(
                    inputId = "petal_width",
                    label = "Petal Width",
                    min = 0.1,
                    max = 2.5,
                    value = 1,
                    step = 0.1
                ),
                actionButton(inputId = "submitIris",
                             label = "Submit",
                             class = "btn btn-primary")
            ),
            mainPanel(
                tags$label(h3("Status/Output")),
                verbatimTextOutput(outputId = "iris_output"),
                tableOutput(outputId = "iris_table")
            )
        ),

        tabPanel(
            title = "Ozone prediction",
            sidebarPanel(
                tags$h3("Inputs:"),
                numericInput(
                    inputId = "solar",
                    label = "Solar.R",
                    value = 190,
                    max = 340,
                    min = 5
                ),
                numericInput(
                    inputId = "wind",
                    label = "Wind",
                    value = 7.4,
                    max = 22,
                    min = 2
                ),
                numericInput(
                    inputId = "temp",
                    label = "Temperature",
                    value = 67,
                    max = 100,
                    min = 50
                ),
                numericInput(
                    inputId = "month",
                    label = "Month",
                    value = 5,
                    max = 12,
                    min = 1
                ),
                numericInput(
                    inputId = "day",
                    label = "Day",
                    value = 1,
                    max = 31,
                    min = 1
                ),
                actionButton(inputId = "submitOzone",
                             label = "Submit",
                             class = "btn btn-primary")
            ),
            mainPanel(
                tags$label(h3("Status/Output")),
                verbatimTextOutput(outputId = "ozone_output"),
                tableOutput(outputId = "ozone_table")
            )
        )
    )
)
