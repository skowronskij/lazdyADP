#' Getting names and codes of subdivisions
#'
#' @description Returns data frame with names and codes of chosen subdivision
#'
#' @param adp_type one of subdivision levels (panstwo, wojewodztwa, powiaty, gminy,
#' jednostki ewidencyjne, obreby ewidencyjne)
#'
#' @return data frame class(base)
#'
#' @export

info_adp = function(adp_type){
  load(file = paste0("data/", adp_type, ".rda"))
  adptype
  return(adptype)
}
