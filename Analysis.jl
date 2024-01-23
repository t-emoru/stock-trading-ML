module Analysis
    
    """Leave here for now, can be pushed to
    designed SETUP FILE """

    Pkg.add("TextAnalysis")
    
    
    using TextAnalysis
    using TextAnalysis: NaiveBayesClassifier, fit!, predict





    """Remove after Final Model has been created and saved """
    #-----------------------------------------------------------------------
    ## Initialisations
    #-----------------------------------------------------------------------
    
    classes = [:positive, :negative]
    model = NaiveBayesClassifier(classes)
    

    #-----------------------------------------------------------------------
    ## Loading Data
    #-----------------------------------------------------------------------

    ###--Training Data 1--
    file_1 = "stock_data.csv"
    df_1 = DataFrame(CSV.File(file_1))

    vscodedisplay(df_1)

    negative_1 = filter(row -> row.Sentiment == -1, df_1)[!, :Text]
    positive_1 = filter(row -> row.Sentiment == 1, df_1)[!, :Text]



    ###--Training Data 2--
    file_2 = "data.csv"
    df_2 = DataFrame(CSV.File(file_2))
    vscodedisplay(df_2)

    negative_2 = filter(row -> row.Sentiment == "negative", df_2)[!, :Sentence]
    positive_2 = filter(row -> row.Sentiment == "positive", df_2)[!, :Sentence]
    #add neutral?


    ###--Training Data 3--
    file_3 = "tweet_data.csv"
    df_3 = DataFrame(CSV.File(file_3))
    vscodedisplay(df_3)


    negative_3 = filter(row -> row.Sentiment == 0, df_3)[!, :Sentence]
    positive_3 = filter(row -> row.Sentiment == 4, df_3)[!, :Sentence]


    positive = vcat(positive_1, positive_2, positive_3)
    negative = vcat(negative_1, negative_2, negative_3)




    #-----------------------------------------------------------------------
    ## Cleaning & Base Utilization
    #-----------------------------------------------------------------------

    
    for i in positive
        fit!(model, i, :positive)
    end


    for i in negative
        fit!(model, i, :negative)
    end


    sentiment_TEST = predict(model, "i love this company")



    



    
    #-----------------------------------------------------------------------
    #-----------------------------------------------------------------------


    # EXPORT DEFINITIONS
    
    ## Lingusitic Analysis [Articel & Social Media]
    export sentiment


    ## Financial Analysis [Stock & Quarterly Reports]





    # FUNCTION DEFINITIONS

    ## Lingusitic Analysis [Articel & Social Media]
    function sentiment()
        #
    
    end
    

    ## Financial Analysis [Stock & Quarterly Reports]


 
end



