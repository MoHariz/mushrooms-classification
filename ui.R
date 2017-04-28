library(shiny)

shinyUI(fluidPage(
  
  # these are part of the application header
  fluidRow(
    column(8,
      tags$h3("Check to see if your mushroom is edible or poisonous"),
      img(src = "http://www.mudpuddlestometeors.com/wp-content/uploads/2014/09/photo6-e1411548735344.jpg", height = "100%", width = "100%"),
      tags$h6("image by: Krista McCuish", ", found from this", a("link", target = "_blank", href="http://www.mudpuddlestometeors.com/project-mushroom-spore-printing/")),
      br(),
      hr()
           )
  ),
  
  # these part of the application holds the two input bar and the result of the mushroom check
  fluidRow(
    column(4,
           selectInput("Odor", label = h4("The odor of the mushroom"), 
                       choices = list("almond" = "a", 
                                      "anise" = "l", 
                                      "creosote" = "c",
                                      "fishy" = "y",
                                      "foul" = "f",
                                      "musty" = "m",
                                      "none" = "n",
                                      "pungent" = "p",
                                      "spicy" = "s"), 
                       selected = "n")
           ),
    column(4,
           selectInput("Spore.print.color", label = h4("The color of the spore print"), 
                       choices = list("black" = "k", 
                                      "brown" = "n", 
                                      "buff" = "b",
                                      "chocolate" = "h",
                                      "green" = "r",
                                      "orange" = "o",
                                      "purple" = "u",
                                      "white" = "w",
                                      "yellow" = "y"), 
                       selected = "k") 
           )
  ),
  br(),
  
  
  # rendering the result 
  fluidRow(
    column(8,
      wellPanel(textOutput("result")),
      br(),
      hr(),
      h4("About this application"),
      p("I created this app as a little side project. Everything was coded in R, and it involved working with a dataset about mushroom. The dataset can be found", a(href = 'https://www.kaggle.com/uciml/mushroom-classification', 'here'),
        ". I later then applied a machine learning algorithm to the dataset to create a classification decision tree, which were later used to create a classification function used in this app. This my first attempt in creating a web app using the RShiny web platform. I hope you guys would find this app a little helpful and entertaining.")   
           )
  ),
  br(),
  br(),
  br()

))