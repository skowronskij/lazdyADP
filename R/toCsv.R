#' Export only names and codes
#'
#' @description Converting adp data to files with names and codes of subdivisions
#'

exportCodes = function(){
  files = list.files("prg/", ".shp$")
  dir.create("data_raw/")
  dir.create("data_rds/")

  for (file in files) {
    shp = sf::read_sf(paste0("prg/",file), options = "ENCODING=UTF-8")
    df = data.frame(nazwa = shp$JPT_NAZWA_, teryt = as.character(shp$JPT_KOD_JE))
    name = paste0(gsub(".shp$", "", file))
    write.csv(df, paste0("data_raw/", name, ".csv"), fileEncoding = "UTF-8")
    saveRDS(df, file = paste0("data_rds/", name, ".RDS"), compress = "bzip2")
  }
}
