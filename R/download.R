#' Download adp and change name of files
#'
#' @param path path for downloading and unziping files
#'
#' @description Function for downloading and renaming adp data

adp_download = function(path) {

  dir.create(paste0(path, "/prg"))
  cat("\nPobieranie danych...")
  #download.file("ftp://91.223.135.109/prg/jednostki_administracyjne.zip",
   #           destfile = paste0(path, "/jednostki_administracyjne.zip"))
  cat("\nPobrano pomyslnie \n")

  cat("Rozpakowywanie...")
  unzip(paste0(path, "/jednostki_administracyjne.zip"), exdir = paste0(path, "/prg/"))
  cat("Rozpakowano pomyslnie")

  pathh = paste0(path, "/prg/")
  cat("Zmiana nazw...")
  files = list.files(pathh)
  for (fname in files) {
    print(Encoding(fname))
    if (Encoding(fname)!="UTF-8"){
      newName = tolower(iconv(fname,"WINDOWS-1250","UTF-8"))
      print("changing to utf8")
    }else{
      newName = tolower(fname)
      print("encoding utf8")
    }
    file.rename(paste0(pathh, fname), paste0(pathh, newName))
    if (stringr::str_detect(newName, pattern = "stwo")){
      print(newName)
      file.rename(paste0(pathh, newName), paste0(pathh, "panstwo.", tools::file_ext(newName)))
    }
    if (stringr::str_detect(newName, pattern = "obr")){
      print(newName)
      file.rename(paste0(pathh, newName), paste0(pathh, "obreby_ewidencyjne.", tools::file_ext(newName)))
    }
    if (stringr::str_detect(newName, pattern = "wojew")){
      print(newName)
      file.rename(paste0(pathh, newName), paste0(pathh, "wojewodztwa.", tools::file_ext(newName)))
    }
  }
  cat("Zmieniono nazwy!")
}
