#Miscellaneous functions for making this easier
#First, something to hold a base URL and accept shortened params, returning
#a specific API URL.
construct_url <- function(parameters){
  return(paste0("http://usesthis.com/api/v1/",parameters))
}

#A wrapper around httr's GET that sets a custom
#user agent and retrieves the content all nice like.
#'@importFrom httr content GET stop_for_status user_agent
get_content <- function(parameters, ...){
  page_response <- GET(construct_url(parameters), user_agent("zebr"), ...)
  stop_for_status(page_response)
  return(content(page_response))
}