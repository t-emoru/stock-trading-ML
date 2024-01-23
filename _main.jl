
# Custom Packaging Import

include("Search.jl")
include("Extraction.jl")
# include("Analysis.jl") DO NOT RUN TILL TRAINING IS COMPLETE


using .Search
using .Extraction
# using .Analysis


#-------------------------------------------------------------------------------
# Introduction
#-------------------------------------------------------------------------------


"
Cummulative Algorithm Function:

    Operation Modes: High Risk & Low Risk


    ##LOW RISK
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




    ##HIGH RISK
    3. Finding Volatile Currently high value stock 
        i) Search
        ii) Srub and produce List of commodities
        iii) Produce list of news article lists (within set time period) relating to each
            company in the list above


    The Algorithm then takes the lost of companines generated from these two Modes
    then develops an individual portfolio that rountinely checks the 'required data'
    to decide wheter to buy, sell or short the traded stock 
    


"


#-------------------------------------------------------------------------------
# current testing block from old file
#-------------------------------------------------------------------------------


# Search



# Extraction