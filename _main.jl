#-------------------------------------------------------------------------------
# Introduction
#-------------------------------------------------------------------------------


"
Cummulative Algorithm Function:
    [main CASH ACCOUNTS & subsidiary MARGIN ACCOUNTS for Shorting]
    *****need margin account for Shorting with Alpaca

    Asynchronous Operation Modes: High Risk & Low Risk


    ##LOW RISK - long term holds
    1. Finding Top Traded Most Profitable Companies
        i) Search 
        ii) Srub and produce List of Companies
            a) Produce List of Articles related to search
            b) Srub articles for list of companies (and stock name)

        iii) Produce list of news article lists (within set time period) 
        relating to each company in the list above


    2. Finding Top Traded Most Stable Industries 
        i) Search
        ii) Srub and produce List of Industries & Commodies to traded 
        iii) Produce list of news article lists (within set time period) relating to each
            company in the list above



    ##HIGH RISK - short term holds [HFT mode on a Timeframe of Seconds to Weeks]
    3. Finding Volatile Currently high value stock, Swing Trade Stocks and HTF Stocks
        i) Search
        ii) Srub and produce List of commodities
        iii) Produce list of news article lists (within set time period) relating to each
            company in the list above

    
    Trading Strategy is developed through processing 3 data streams

    Current Market Data [Previous & Current]: MooMoo, Alpaca
    Company Financial Data: 
    Sentiment Data: Google News Search, Reddit

    Trades are executed using: [insert BROKER] API*


    The Algorithm then takes the list of companines generated from these two Modes
    then develops an individual portfolio that rountinely checks the 'required data'
    to decide wheter to buy, sell or short the traded stock 

    Algorithmically this is done by dynamic readjustments of parameters in base trading
    model. AND constant retrianing and reapplication of data models. 
    


"


cd("C:\\Users\\Tomi\\Documents\\_School & Exams\\_University\\Education & Classes\\_Coop\\Predictive Algorithm\\Machine Learning")

# Custom Packaging Import
include("SETUP.jl")

include("Search.jl")
include("Extraction.jl")
include("Analysis.jl")



using .Search
using .Extraction
using .Analysis




#-------------------------------------------------------------------------------
# current testing block from old file
#-------------------------------------------------------------------------------


# Search





# Extraction


# Analysis

model = Analysis.load_model("model_4")
prediction = Analysis.predict(model, "This project is execellent")




# Threading

versioninfo()
" 24 threads available on home device"
Threads.nthreads()
Threads.threadid()

