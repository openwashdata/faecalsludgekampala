library(openwashdata)
library(usethis)

# Process after running init_data_pkg(). #########


# Add Additional authors ####
# This not only the basis for license file creation, but
# also for the CITATION file and data publication.
# Make to add all authors at this stage.
# To do so simply add multiple use_author() calls here.

# use_author(
#   given = "Donald",
#   family = "Duck",
#   role = "aut",
#   comment = c(ORCID = "YOUR-ORCID-ID")
#   )

# or read as a bulk import of multiple authors from a .csv file.
a <- use_authors_from_csv()

# edit the skeleton & read in csv.
# Write the CITATION file
# This is based on the DESCRIPTION file of the
# active working directory

# ! MAKE SURE ORCIDs are correct ####
# OR left out as these are being validated !!
# add CITATION file to the data package skeleton
use_cff()


# DATA Manipulation Stage START #############

# Edit data-raw/data_processing.R to extract
# data.frame(s) from the initial input data, e.g., .xlsx spreadsheets or API
# then, run
source("data-raw/data_processing.R")

# 2. generate an editable dictionary from the newly created data folder
use_dictionary()

# After replacing placeholder NA with an actual Description of each
# variable run
# TODO / next up: fix this function

generate_dataset_documentation("faecalsludge",
                               dataset_title = "it stinks")


# Initialize git once all the files are there.
# Be aware that this triggers an RStudio restart.
init_git()



# DATA Manipulation Stage END #############


# openwashdata GitHub
debug(push_package)
push_package()












