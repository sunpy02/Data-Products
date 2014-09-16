dataset <- mtcars

shinyUI(pageWithSidebar(
  
  
  headerPanel("MPG Calculator"),
  
  sidebarPanel(
    
    sliderInput('wt', 'Weight(lb/1000)', min=0, max=10,
                value=2, step=0.01),
    
    selectInput('am', 'Transmission Type', c(0,1)),
    selectInput('cyl', 'Cylinders', c(4,6,8)),
    submitButton('Submit')
  ),
  
  mainPanel(
    h2('Get Started'),
    p('This Calculator helps you to calculate the expected MPG for your car. You need to know the weight of your car in lb/1000, the transmission type and number of cylinders. For transmission type, 0 represents automatic and 1 represents manual.
      The calculator will perform a regression analysis on different subsets of the database mtcars based on your transmission type.
      Once you have entered all the correct values for your car, click submit botton and the MPG will be calculated.'),
    h4('You entered weight(lb)'),
    verbatimTextOutput("owt"),
    h4('You entered transimission type'),
    verbatimTextOutput("oam"),
    h4('You entered number of cylinders'),
    verbatimTextOutput("ocyl"),
    h4('The MPG of your car is:'),
    verbatimTextOutput("MPG")
  )
))
