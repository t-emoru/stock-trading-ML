module Search
    
    """Leave here for now, can be pushed to
    designed SETUP FILE """

    using Pkg
    Pkg.add("HTTP")
    Pkg.add("Gumbo")
    Pkg.add("AbstractTrees")
    Pkg.add("ReadableRegex")
    Pkg.add("Cascadia")
    Pkg.add("DataFrames")
    Pkg.add("CSV")


    using HTTP, Gumbo
    using HTTP.Cookies
    using AbstractTrees
    using ReadableRegex
    using Cascadia
    using DataFrames
    using CSV
    using Gumbo

    
    # EXPORT DEFINITIONS
    export google_search
    export STEM_search
    export MEDIA_search
    export prompt_gen
    export request_access

    
    # FUNCTION CONSTANTS



    # FUNCTION DEFINITIONS
    function GOOGLE_search(query, pages)
        "
        Function: searches google using default query.
        Return: produces list of hmtl content of search webpages
        
        "

        # Initialize base URL for Google search
        url = "https://www.google.com/search?q=" * query

        # Set up headers to mimic a browser
        headers = Dict("User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")

        # Set up cookies container
        cookiejar = CookieJar()

        # List to store results from each page
        results = []

        # Iterate through the specified number of pages
        for page in 0:(pages-1)
            # Calculate the starting result index for each page (Google uses 10 results per page by default)
            start_index = page * 10

            # Set up query parameters for each page
            params = Dict("q" => query, "start" => string(start_index))

            # Send the request for each page
            search_result = HTTP.get(url, query=params, headers=headers, cookies=cookiejar)

            # Append the result to the list
            push!(results, search_result)
        end

        return results

    end


    function STEM_search(query, pages)

        "
        Function: searches Scientific Paper websites using query.
        Return: produces multilist list of hmtl content of search webpages
        
        "


        # Action Modularization
        function fetch_search_results(url, query, start_param, pages)
            headers = Dict("User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")
            cookiejar = CookieJar()
            results = []

            for page in 0:(pages-1)
                start_index = page * 10
                params = Dict(query => query, start_param => string(start_index))
                search_result = HTTP.get(url, query=params, headers=headers, cookies=cookiejar)
                push!(results, search_result)
            end

            return results
        end

        # Google Scholar Search
        google_scholar_url = "https://scholar.google.com/scholar?q="
        google_scholar_results = fetch_search_results(google_scholar_url, query, "start", pages)

        # PubMed Search
        pubmed_url = "https://pubmed.ncbi.nlm.nih.gov/?term="
        pubmed_results = fetch_search_results(pubmed_url, query, "start", pages)

        # Web of Science Search
        wos_url = "https://www.webofscience.com/wos/woscc/basic-search?search_mode=GeneralSearch&SID=XXXX&input_invalid=true&value(input1)="
        wos_results = fetch_search_results(wos_url, query, "start", pages)

        return [google_scholar_results, pubmed_results, wos_results]

    end


    function MEDIA_search(query, pages)

        "
        Function: takes in query (company) and searches Social Media & Media Outlets platforms 
    
        Return: produces list of html content from each platform
        
        "
        #--------Reddit-----------------
    
        ## General search
    
    
        ## r/Stocks Monitoring
    
    
    
        #--------Twitter----------------
    
    
    
        # Direct Outlets (Yahoo Finance & Bloomberg)
    
    
    end
    
    function prompt_gen(query)
        #..
    
    end
    

    function request_access(urls, link)
        "
        Function: request to access html data of link
        Returns: Status (1 meaning Yes) and Response (contains html data)
        "
    
    
        subject = urls[link]
        response = HTTP.request("GET", subject)
    
    
        #check is request was successful
        if HTTP.status(response) == 200
            status = 1
        else
            println("Failed to access the website. Status code: ", HTTP.status(response))
        end
    
    
        return status, response
    end
    


 
end



