args = commandArgs(trailingOnly=TRUE)
update = function(path){
  download = dget(file = "~/Dokumenty/lazyADP/R/download.R")
  slicer = dget(file = "~/Dokumenty/lazyADP/R/slicer.R")

  download(path)
  files = list.files(path = paste0(path, "/prg"), pattern = ".shp$")
  for (filex in files){
    if (filex == "wojewodztwa.shp") {
      cat("/nSlicing", filex)
      slicer(path = path, file = filex)
    }
  }
}
update(path = args[1])
