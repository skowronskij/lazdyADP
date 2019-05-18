#' Slicer
#'
#' @description Slices sf object of subdivision to the smallest
#' possible elements by adp code
#'
#' @param file Shapefile to slice
#'


adp_slicer = function(file){
  # Loading files
  sf = sf::read_sf(file, options = "ENCODING=UTF-8")
  sf = sf::st_transform(sf, crs=2180)

  # Creating dir
  dataFile = "data"
  if (dir.exists(dataFile)==FALSE){
    dir.create("data")
    }
  woExt = gsub(".shp$", "", file)
  woExt = gsub("prg/", "", woExt)
  dir.create(paste0("data/", woExt))

  for (fid in seq_len(nrow(sf))){
    sfRow = sf[fid,]
    saveRDS(sfRow, paste0(sprintf("data/%s/",woExt), sfRow$JPT_KOD_JE, ".rds"), compress = "bzip2")
  }
}

