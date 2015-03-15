#'@title Get The Setup's interview data
#'
#'@description retrieve either the metadata associated with each interview on The Setup, or
#'the metadata and data associated with a specific interview or set of interviews (see below)
#'
#'@param slugs the "slug" of the specific interview, or interviews. For example, the slug of
#'Hadley's entry, which is listed at
#'\href{http://hadley.wickham.usesthis.com/}{http://hadley.wickham.usesthis.com/}, is
#'"hadley.wickham". If this is left empty, \code{get_interviews} will instead retrieve
#'the metadata associated with all of The Setup's interviews (which, appropriately,
#'includes all the slugs!)
#'
#'@param ... further arguments to httr's GET.
#'
#'@seealso \code{\link{get_hardware}} and \code{\link{get_software}}, for similar functionality
#'for specific classes of data and metadata.
#'
#'@examples
#'
#'#Include a slug, retrieving the data associated with a particular interview
#'hadley_data <- get_interviews(slugs = "hadley.wickham")
#'
#'#Or, sod it, don't and just get the metadata
#'setup_metadata <- get_interviews()
#'
#'@export
get_interviews <- function(slugs = NULL, ...){
  if(is.null(slugs)){
    return(get_content("interviews", ...))
  }
  params <- paste0("interviews/", slugs)
  if(length(params) == 1){
    return(get_content(params,...))
  }
  return(lapply(params,get_content,...))
}

#'@title get The Setup's software data
#'@description retrieves either the metadata about software entries on The Setup, or the
#'data to do with a particular piece of software, depending on the provided nput.
#'
#'@param item the name of the specific software; this can be found by looking at the
#'software data in the return from \code{\link{get_interviews}}. Alternately, in the absence
#'of any provided software names, the /meta/data associated with all software entries
#'on The Setup will instead be returned, and this includes the names
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@seealso \code{\link{get_hardware}} and \code{\link{get_interviews}}, for similar functionality
#'for hardware and full interviews.
#'
#'@examples
#'#Get ALL the metadata!
#'all_software <- get_software()
#'
#'#Find out who is using photoshop (after that we should find out who switched it out for
#'#GIMP, and try to work out what the heck is wrong with them.)
#'photoshop_data <- get_software("photoshop")
#'
#'@export
get_software <- function(item = NULL, ...){
  if(is.null(item)){
    return(get_content("software", ...))
  }
  params <- paste0("software/", item)
  if(length(params) == 1){
    return(get_content(params,...))
  }
  return(lapply(params,get_content,...))
}

#'@title get The Setup's hardware data
#'@description retrieves either the metadata about hardware entries on The Setup, or the
#'data to do with a particular piece of hardware, depending on the provided nput.
#'
#'@param item the name of the specific hardware; this can be found by looking at the
#'hardware data in the return from \code{\link{get_interviews}}. Alternately, in the absence
#'of any provided hardware names, the /meta/data associated with all hardware entries
#'on The Setup will instead be returned, and this includes the names
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@seealso \code{\link{get_software}} and \code{\link{get_interviews}}, for similar functionality
#'for hardware and full interviews.
#'
#'@examples
#'#Get ALL the metadata!
#'all_hardware <- get_hardware()
#'
#'#How many mac users does the site have?
#'photoshop_data <- get_hardware("macbook-pro")
#'#These people are a bit mac-happy, but it's okay, I'm sure they give generously to charity
#'#and are kind to small children. We can probably forgive them.
#'
#'@export
get_hardware <- function(item = NULL, ...){
  if(is.null(item)){
    return(get_content("hardware", ...))
  }
  params <- paste0("hardware/", item)
  if(length(params) == 1){
    return(get_content(params,...))
  }
  return(lapply(params,get_content,...))
}