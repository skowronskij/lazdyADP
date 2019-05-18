#' Download adp and change name of files
#'
#' @description Function for downloading and renaming adp data
#'
#'
adp_download = function() {
  dir.create("prg")
  download.file("ftp://91.223.135.109/prg/jednostki_administracyjne.zip",
               destfile = "jednostki_administracyjne.zip")
  unzip("jednostki_administracyjne.zip", exdir = "prg")

  prg = "prg/"
  files = list.files(path = prg)
  for (fname in files) {
    print(Encoding(fname))
    if (Encoding(fname)!="UTF-8"){
      newName = tolower(iconv(fname,"WINDOWS-1250","UTF-8"))
      print("changing to utf8")
    }else{
      newName = tolower(fname)
      print("encoding utf8")
    }
    file.rename(paste0(prg, fname), paste0(prg, newName))
    if (stringr::str_detect(newName, pattern = "stwo")){
      print(newName)
      file.rename(paste0(prg, newName), paste0(prg, "panstwo.", tools::file_ext(newName)))
    }
    if (stringr::str_detect(newName, pattern = "obr")){
      print(newName)
      file.rename(paste0(prg, newName), paste0(prg, "obreby_ewidencyjne.", tools::file_ext(newName)))
    }
    if (stringr::str_detect(newName, pattern = "wojew")){
      print(newName)
      file.rename(paste0(prg, newName), paste0(prg, "wojewodztwa.", tools::file_ext(newName)))
    }
  }
}
