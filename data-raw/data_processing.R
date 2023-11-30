## code to prepare `data_processing` dataset goes here
library(readxl)
library(stringr)
library(dplyr)
library(tidyr)
library(usethis)
stn <- read_xls("data-raw/sustainability.xls")

# extract names first because we can't assign them
# until the data.frame has 15 columns
nms <- unlist(str_split(names(stn),pattern = ";"))
nms <- tolower(nms)
nms <- gsub("_$","",nms)
# set temporary name to make handling easier
names(stn) <- "col1"
dtaset <- stn |>
  separate(col1,
           into = paste0("col",1:length(nms)),
           sep = ";")
names(dtaset) <- nms


# set proper data types ####
faecalsludge <- dtaset |>
  mutate(across(c(fid), as.integer)) |>
  mutate(across(c(height, volume, longitude, latitude), as.numeric)) |>
  mutate(date = as.Date(date, format = "%d.%m.%Y")) |>
  mutate(date_1 = as.Date(date_1, format = "%d.%m.%Y")) |>
  select(-c(shape_,`shape *`))


use_data(faecalsludge, overwrite = TRUE)




