#' Export only names and codes
#'
#' @description Converting adp data to files with names and codes of subdivisions
#'

exportCodes = function(){
  files = list.files("~/Dokumenty/prg/", ".shp$")
  dir.create("data_raw/")
  dir.create("data/")

  for (file in files) {
    shp = sf::read_sf(paste0("~/Dokumenty/prg/",file), options = "ENCODING=UTF-8")
    adptype = data.frame(nazwa = shp$JPT_NAZWA_, teryt = as.character(shp$JPT_KOD_JE))
    name = paste0(gsub(".shp$", "", file))
    utils::write.csv(adptype, paste0("data_raw/", name, ".csv"), fileEncoding = "UTF-8")
    save(adptype, file = paste0("data/", name, ".rda"), compress = "bzip2")
  }
}
