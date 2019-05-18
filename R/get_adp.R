#' Getting sf object of adp
#'
#' @description Returns sf object of chosen subdivision/subdivisions
#'
#' @param adp_type one of subdivision levels (panstwo, wojewodztwa, powiaty, gminy,
#' jednostki ewidencyjne, obreby ewidencyjne)
#'
#' @param name name of subdivision
#'
#' @param code code of subdivision
#'
#' @return sf object
#' @export
#'

get_adp = function(adp_type, name=NULL, code=NULL){

  codes = readRDS(paste0("data/", adp_type, ".RDS"))
  obj = sf::st_sf(sf::st_sfc(), crs = 2180)

  if (is.null(code)==FALSE){
    for (i in seq_along(code)) {
      download.file(sprintf("https://github.com/skowronskij/prgdata/blob/master/%s/%s.rds?raw=true",
                            adp_type, code[i]), destfile = paste0(tempdir(), "/", code[i], ".rds"))

      iterationObj = readRDS(paste0(tempdir(), "/", code[i], ".rds"))

      obj = rbind(obj, iterationObj)
    }
  }else if (is.null(name)==FALSE){
    for (i in seq_along(name)) {
      code = (subset(codes, nazwa==name[i])[,3])
      download.file(sprintf("https://github.com/skowronskij/prgdata/blob/master/%s/%s.rds?raw=true",
                            adp_type, code), destfile = paste0(tempdir(), "/", code, ".rds"))

      iterationObj = readRDS(paste0(tempdir(), "/", code, ".rds"))

      obj = rbind(obj, iterationObj)
    }
  }else {
    for (i in seq_len(nrow(codes))){
      code = codes[i,3]
      download.file(sprintf("https://github.com/skowronskij/prgdata/blob/master/%s/%s.rds?raw=true",
                            adp_type, code), destfile = paste0(tempdir(), "/", code, ".rds"))

      iterationObj = readRDS(paste0(tempdir(), "/", code, ".rds"))
      obj = rbind(obj, iterationObj)
      }
    }

  plot(obj$geometry)
  return(obj)
}
