library(shiny)

# this function checks if a mushroom is edible or poisonous based on its odor and spore print color
mushroomCheck <- function(odor, spore.print.color) {
  if(odor == "a" | odor == "l" | odor == "n") {
    if(spore.print.color == "b" |
       spore.print.color == "h" |
       spore.print.color == "k" |
       spore.print.color == "n" |
       spore.print.color == "o" |
       spore.print.color == "u" |
       spore.print.color == "w" |
       spore.print.color == "y") {
      paste0("From the mushroom variables that you gave us, it is safe to say that your mushroom is edible.")
    } else {
      paste0("From the mushroom variables that you gave us, it looks like your mushroom is not edible and can be poisonous.")
    }
  } else {
    paste0("From the mushroom variables that you gave us, it looks like your mushroom is not edible and can be poisonous.")
  }
}

# the application server
shinyServer(function(input, output) {
  # two things being rendered: the header of the application and the result produced from the mushroomCheck function
  output$header <- renderText({ "Check to see if your mushroom is edible or poisonous" })
  output$result <- renderText({ mushroomCheck(input$Odor, input$Spore.print.color) })
})