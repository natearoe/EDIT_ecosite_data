# This is a for loop that will produce your reports for all the ecosites provided on line 19.
#
# Replace the ecosites on line 19 with the list of ecosites that you created in Step 3.
#
# Remember to perform QC on the list of ecosites. Sometimes, you might find that a component
# was correlated to two ecosites. This could result in something like, 'R018XI163CA & R018XD076CA'.
# These should be removed. Any other ecosites that are clearly erroneous should be removed as well.
#
# You will need to change the file path on line 28. The easiest way to do that is to find the
# 'NASIS_data_to_EDIT_multiple.Rmd in your directory. It should be in the folder with all your other
# 'EDIT ecosite data' files. Shift + right click > copy as path. Then paste the path in, replacing
# the existing one. That path will have backslashes / these all need to be changed to forwardslashes /.
#
# If you want to map your ecosites, you will need to delete the "#" before lines 23 & 24 and replace the
# paths with the appropriate .gdb and .shp files.
#
# Once you have made those change, Ctrl+ a, then click Run in the top right corner.

ecosites_of_interest <- c( 'F018XC201CA', 'F018XI201CA', 'F018XI200CA', 'R018XI163CA', 'F018XI205CA', 'R018XE104CA', 'F018XE201CA', 'F018XA201CA', 'F018XI202CA', 'R018XE103CA', 'R018XA103CA', 'R018XC105CA', 'R018XE101CA', 'R018XI105CA', 'R018XI107CA', 'R018XC107CA', 'F018XI208CA', 'F018XA202CA', 'R018XI106CA', 'R018XI164CA', 'R018XC104CA', 'R018XE102CA', 'R018XX101CA', 'R018XC103CA', 'F018XC203CA', 'F018XI207CA', 'R018XD092CA', 'R018XA101CA', 'R018XC101CA', 'R018XC106CA', 'R018XI101CA', 'R018XI102CA', 'R018XC102CA', 'R018XD089CA', 'R018XI111CA', 'R018XA102CA', 'R018XD076CA', 'R018XA104CA', 'R018XI103CA', 'R018XI125CA', 'F018XI204CA', 'R018XD082CA', 'R018XD091CA', 'F018XI206CA', 'R018XC109CA', 'R018XD001CA', 'R018XI104CA', 'R018XC110CA', 'R018XD064CA', 'R018XD066CA', 'R018XD075CA', 'R018XD084CA', 'R018XD095CA' )
# I am now including a map of the distribution of the ecosite. To do that, I am going to read in the shapefiles here, that way they aren't
# read within the looping which would require the shapefiles to be read as many times as you have sites.

# mapunit_boundaries <- sf::read_sf("C:/Users/Nathan.Roe/Documents/PES/gSSURGO_CA_2022.gdb", "mupolygon")
# mlra_boundaries <- read_sf("C:/Users/Nathan.Roe/Documents/PES/MLRA_52_2022/MLRA_52_2022/MLRA_52.shp")


for (ecosites_of_interest in ecosites_of_interest) {
  rmarkdown::render(input = "C:/Users/Nathan.Roe/Documents/SEKI/edit_reports/NASIS_data_to_EDIT_multiple.Rmd",
                    output_file = paste0(ecosites_of_interest,".html"),
                    params = list(ecosites_of_interest = ecosites_of_interest))
}


# read within the looping which would require the shapefiles to be read as many times as you have sites.

# mapunit_boundaries <- sf::read_sf("C:/Users/Nathan.Roe/Documents/PES/gSSURGO_CA_2022.gdb", "mupolygon")
# mlra_boundaries <- read_sf("C:/Users/Nathan.Roe/Documents/PES/MLRA_52_2022/MLRA_52_2022/MLRA_52.shp")


for (ecosites_of_interest in ecosites_of_interest) {
  rmarkdown::render(input = "C:/Users/Nathan.Roe/Documents/PES4ever/NASIS_ecosite_to_EDIT/EDIT_ecosite_data/ecosite_report.csv",
                    output_file = paste0(ecosites_of_interest,".html"),
                    params = list(ecosites_of_interest = ecosites_of_interest))
}


