#Require the package so you can use it
require("httr")
require("jsonlite")

# Parsing of HTML/XML files  
library(rvest)  

call.api <- "http://www.cepaberto.com/api/v3/cep?cep=70165-900"

#Substitua os "XXXXX..." pelo seu Token individual.
get_cep_info <- GET(url = call.api, add_headers(Authorization = paste("Token token=XXXXXXXXXXXXXXXXXXXXXXX")))

get_cep_info_text <- content(get_cep_info, "text")
get_cep_info_text

get_cep_info_jason <- fromJSON(get_cep_info_text, flatten = TRUE)

gdf <- as.data.frame(get_cep_info_jason)
