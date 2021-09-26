# Load iris and ozone random forest models
iris.model <- readRDS("rf_iris.rds")
ozone.model <- readRDS("rf_ozone.rds")


# server
shinyServer(function(input, output, session){

    # random forest iris classification
    df.iris <- reactive({

        df <- data.frame(
            row.names = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
            value = c(input$sepal_length,input$sepal_width,input$petal_length,input$petal_width),
            stringsAsFactors = FALSE
        )

        df <- data.frame(t(df))
        output <- data.frame(
            Prediction = predict(iris.model, df),
            round(predict(iris.model, df, type="prob"), 3)
        )
        return(output)
    })

    output$iris_output <- renderPrint({
        if (input$submitIris > 0) {
            isolate("Calculation complete.")
        } else {
            return("Server is ready for calculation.")
        }
    })

    # Prediction results table
    output$iris_table <- renderTable({
        if (input$submitIris > 0){
            isolate(df.iris())
        }
    })

    # random forest ozone prediction
    df.ozone <- reactive({

        df <- data.frame(
            row.names = c("Solar.R", "Wind", "Temp", "Month", "Day"),
            value = c(input$solar, input$wind, input$temp, input$month, input$day),
            stringsAsFactors = FALSE
        )

        df <- data.frame(t(df))
        output <- data.frame(
            Prediction = predict(ozone.model, df)
        )
        return(output)
    })

    output$ozone_output <- renderPrint({
        if (input$submitOzone > 0) {
            isolate("Calculation complete.")
        } else {
            return("Server is ready for calculation.")
        }
    })

    # Prediction results table
    output$ozone_table <- renderTable({
        if (input$submitOzone > 0){
            isolate(df.ozone())
        }
    })

})
