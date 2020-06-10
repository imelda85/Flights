# Flight-Dashboard using Shiny. 
# Written by : Bakti Siregar, M.Sc
# Department of Business statistics, Matana University (Tangerang)
# Notes: Please don't share this code anywhere (It's just for you)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source("global.R", local = TRUE)

ui <- dashboardPage(title = "www.imeldasianturi.com",
                    
      # Header
      dashboardHeader(title = "Flights-Dashboard",
                      titleWidth = 200,
                      tags$li(class="dropdown", 
                              tags$img(type="image/png",
                                       src="Matana.png",
                                       width = 50, 
                                       height = 50))),
      
                    
      # Side bar of the Dashboard
      dashboardSidebar(
        selectInput(
          inputId = "aiport",
          label = "Airport:",
          choices = airports$name,
          selected = "DL",
          selectize = FALSE),
        
        selectInput(
          inputId = "airline",
          label = "Airline:",
          choices = airline_list,
          selected = "DL",
          selectize = FALSE),
        
      # Side menu of the Dashboard  
      sidebarMenu(
        selectInput(
          inputId = "month",
          label = "Month:",
          choices = month_list,
          selected = 99,
          size = 13,
          selectize = FALSE),
        actionLink("remove", icon = icon("sync-alt"),"Remove detail tabs"),
        menuItem("Source Code", icon = icon("github"), href = "https://github.com/imelda85/Flights"),
        menuItem("About Me", icon = icon("linkedin"), href = "https://www.linkedin.com/in/imelda-sianturi-331675192/"),
        menuItem("Video", icon = icon("youtube"), href = "https://www.youtube.com/watch?v=ASQoO2cS_Lk")
        )
      ),
      
      # The body of the dashboard
      dashboardBody(
        tabsetPanel(id = "tabs",
          tabPanel(title = "Main Dashboard",
          value = "page1",
        fluidRow(valueBoxOutput("total_flights"),
                 valueBoxOutput("per_day"),
                 valueBoxOutput("percent_delayed")),
        fluidRow(column(width = 6,d3Output("group_totals")),
                 column(width = 6,d3Output("top_airports")))
      )
    )
  )
)
