#' Slicer
#'
#' @description Slices sf object of subdivision to the smallest
#' possible elements by adp code
#'
#' @param path Path to files
#' @param file Shapefile name
#'


adp_slicer = function(path, file){
  # Loading files
  filePath = paste0(path, "/prg/", file)
  sf = sf::read_sf(filePath, options = "ENCODING=UTF-8")
  sf = sf::st_transform(sf, crs=2180)

  # Creating dir

  dataFile = paste0(path, "/prgdata")
  if (dir.exists(dataFile)==FALSE){
    dir.create(paste0(path, "/prgdata"))
    }
  woExt = gsub(".shp$", "", file)
  dir.create(paste0(path, "/prgdata/", woExt))

  for (fid in seq_len(nrow(sf))){
    sfRow = sf[fid,]
    saveRDS(sfRow, paste0(paste0(path, "/prgdata/", woExt, "/"), sfRow$JPT_KOD_JE, ".rds"), compress = "bzip2")
  }
}
