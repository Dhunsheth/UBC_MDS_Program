#Top and bottom of each UI
#library(DT)
library(shiny)
#library(lspline)
#library(FNN)
library(plotly)
#library(scales)
ui <- fluidPage(
  withMathJax(),
  tags$div(HTML("<script type='text/x-mathjax-config'>
                MathJax.Hub.Config({
                tex2jax: {inlineMath: [['$','$']]}
                });
                </script>
                ")),
  # App title ----
  titlePanel("DATA 571 - Regularization Visualizations"),
  ####insert UI content
  withMathJax(p(HTML("The plotted surface is the RSS associated with the pairwise combos of beta_1 and beta_2. The black dot is the minimum of the surface, the search for which becomes constrained as you reduce the size of t."))),
  fluidRow(
    column(3,
          
                            uiOutput("plotstuff")
           
    ),
    column(9,
           
                            plotlyOutput("plotrr")
           
    )
  ),
  fluidRow(
    column(3,
           
                            uiOutput("plotstuff2")
           
    ),
    column(9,
           
                            plotlyOutput("plotla")
           
    )
  ),
  #uiOutput("finalVid"),
  
  #### end insert UI content
  # conditionalPanel("input.lastButton", downloadButton('downloadData', 'Download data')),
  br(),br(),br(),br(),br(),br()
  
)

#Top and bottom of each server
server <- function(input, output) {
 # counter <- reactiveValues(i = 1, timings = list(), lecture="6_MLR")
  ####insert server content
 # observeEvent(input$goButton, {
    #counter$timings[[counter$i]] <- Sys.time(); counter$i <- counter$i+1; 
   # removeUI(selector='#goButton', immediate=TRUE)
    ####Anything that needs to be done prior to a render call should be placed here
    #for example, things going into plots
    #multiple choice questions, etc
    ####
    output$plotstuff <- renderUI({
      tagList(HTML('<br><br>'),
        #renderUI(sliderInput("trn", "Training Set Sample Size", min=20, max=100, step=1, value=20)),
        #renderUI(sliderInput("numsim", "Number of Simulations", min=1, max=1000, step=1, value=1)), 
        #renderUI(sliderInput("b0", "True Intercept (B_0)", min=-10, max=10, step=.1, value=0)), 
        #renderUI(sliderInput("b1", "True Coefficient (B_1)", min=-10, max=10, step=1, value=0)), 
        renderUI(sliderInput("t_rr", "t for Ridge Regression", min=1, max=33, step=.01, value=33)),
        #renderUI(sliderInput("t_la", "t for LASSO", min=1, max=40, step=.01, value=40)),
        #renderUI(sliderInput("ten", "Testing Set Sample Size", min=5, max=100, step=1,value=10)),
        #renderUI(checkboxInput("quad", "Show Simple Model (Linear, red)")),
        #renderUI(checkboxInput("poly1", "Show Flexible Model (Local Poly, blue)")),
        #renderUI(checkboxInput("poly2", "Show Ultra-Flexible Model (Connect-the-dots, green)")),
        #renderUI(checkboxInput("poly2", "Show Ultra-Flexible Model (Connect-the-dots, green)")),
        ### CONTINUE BUTTON
        #renderUI(actionButton("runSim1", "Fit model"))
        #renderUI(actionButton("addsim", "Add a simulation and a new line"))
      )
    })
    output$plotstuff2 <- renderUI({
      tagList(HTML('<br><br>'),
              #renderUI(sliderInput("trn", "Training Set Sample Size", min=20, max=100, step=1, value=20)),
              #renderUI(sliderInput("numsim", "Number of Simulations", min=1, max=1000, step=1, value=1)), 
              #renderUI(sliderInput("b0", "True Intercept (B_0)", min=-10, max=10, step=.1, value=0)), 
              #renderUI(sliderInput("b1", "True Coefficient (B_1)", min=-10, max=10, step=1, value=0)), 
              #renderUI(sliderInput("t_rr", "t for Ridge Regression", min=1, max=40, step=.01, value=40)),
              renderUI(sliderInput("t_la", "t for LASSO", min=1, max=13, step=.01, value=13)),
              #renderUI(sliderInput("ten", "Testing Set Sample Size", min=5, max=100, step=1,value=10)),
              #renderUI(checkboxInput("quad", "Show Simple Model (Linear, red)")),
              #renderUI(checkboxInput("poly1", "Show Flexible Model (Local Poly, blue)")),
              #renderUI(checkboxInput("poly2", "Show Ultra-Flexible Model (Connect-the-dots, green)")),
              #renderUI(checkboxInput("poly2", "Show Ultra-Flexible Model (Connect-the-dots, green)")),
              ### CONTINUE BUTTON
              #renderUI(actionButton("runSim1", "Fit model"))
              #renderUI(actionButton("addsim", "Add a simulation and a new line"))
      )
    })
#  }, ignoreInit = TRUE
 # )
  
  # robjs <- eventReactive(input$runSim1,{
  #   set.seed(64351)
  #   x <- runif(30, -2, 2)
  #   x2 <- x^2
  #   y <- 15 +2.3*x -1.5*x2 + rnorm(length(x), 0, 1)
  #   xgrid <- seq(-2, 2, length.out=400)
  #   kmod <- knn.reg(x, test=data.frame(x=xgrid), y=y, k=input$k)
  #   list(x=x,xgrid=xgrid,y=y,kmod=kmod)
  # })
  
  #observeEvent(input$goButton, {
    #counter$timings[[counter$i]] <- Sys.time(); counter$i <- counter$i+1; 
    #removeUI(selector='#goButton', immediate=TRUE)
    ####Anything that needs to be done prior to a render call should be placed here
    #for example, things going into plots
    set.seed(35521)
    x1 <- rnorm(30,0,3)
    x2 <- rnorm(30,1,4)
    y <- 20 + 3*x1 - 0.5*x2 + rnorm(length(x1), sd=2)
    x <- cbind(x1, x2)
    b1b2 <- expand.grid(seq(-4, 4, by=0.1), seq(-4, 4, by=0.1))
    b1b2 <- cbind(b1b2, rowSums(abs(b1b2)), rowSums(b1b2^2))
    inters <- apply(b1b2, 1, function(v) mean(y)-v[1]*mean(x1)-v[2]*mean(x2))
    params <- cbind(inters, b1b2)
    rssgrid <- apply(params, 1, function(v) sum((y-(v[1]+v[2]*x1+v[3]*x2))^2))
    plotit <- data.frame(b1=b1b2[,1], b2=b1b2[,2], rss=rssgrid)
    axx <- list(range=c(-4,4))
    axy <- list(range=c(-4,4))
    axz <- list(range=c(0, 30000))
    
    
   
    #multiple choice questions, etc
    ####
    
    output$plotrr <- 
        renderPlotly({
          rr <- plotit[b1b2[,4]<=input$t_rr,]
          plot_ly(rr, x=~b1, y=~b2, z=~rss, marker = list(color = ~rss, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE)) %>%
            add_markers() %>% layout(scene = list(xaxis=axx, yaxis=axy, zaxis=axz), title="Ridge Regression") %>% add_markers(x=rr$b1[which.min(rr$rss)], y=rr$b2[which.min(rr$rss)], z=rr$rss[which.min(rr$rss)], marker=list(color="black"))
          #figla <- plot_ly(la, x=~b1, y=~b2, z=~rss, marker = list(color = ~rss, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE)) %>% add_markers() %>% layout(scene = list(xaxis=axx, yaxis=axy, zaxis=axz), title="LASSO")
          #subplot(figrr, figla)
          })
    
    output$plotla <- 
      renderPlotly({
        la <- plotit[b1b2[,3]<=input$t_la,]
        plot_ly(la, x=~b1, y=~b2, z=~rss, marker = list(color = ~rss, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE)) %>% add_markers() %>% layout(scene = list(xaxis=axx, yaxis=axy, zaxis=axz), title="LASSO") %>% add_markers(x=la$b1[which.min(la$rss)], y=la$b2[which.min(la$rss)], z=la$rss[which.min(la$rss)], marker=list(color="black"))
      })
    
    #output$afsimbut <- renderUI(actionLink("afterSim1", "Continue..."))
 # }, ignoreInit = TRUE
 # )
  

  

  
  
}

shinyApp(ui = ui, server = server)
