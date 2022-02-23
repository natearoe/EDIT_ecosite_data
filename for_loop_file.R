# This is a for loop that will produce your reports for all the ecosites provided on line 16. 
#
# Replace the ecosites on line 16 with the list of ecosites that you created in Step 3. 
#
# Remember to perform QC on the list of ecosites. Sometimes, you might find that a component 
# was correlated to two ecosites. This could result in something like, 'R018XI163CA & R018XD076CA'.
# These should be removed. Any other ecosites that are clearly erroneous should be removed as well.
#
# You will need to change the file path on line 20. The easiest way to do that is to find the
# 'NASIS_data_to_EDIT_multiple.Rmd in your directory. It should be in the folder with all your other 
# 'EDIT ecosite data' files. Shift + right click > copy as path. Then paste the path in, replacing
# the existing one. That path will have backslashes \ these all need to be changed to forwardslashes /. 
#
# Once you have made those change, Ctrl+ a, then click Run in the top right corner. 

ecosites_of_interest <-  c( 'F018XC201CA', 'F018XI201CA', 'F018XI200CA', 'F018XI205CA', 'R018XE104CA', 'R018XI163CA', 'F018XE201CA', 'F018XI202CA', 'R018XE103CA', 'R018XI105CA', 'R018XC105CA', 'R018XC107CA', 'R018XE101CA', 'R018XI107CA', 'F018XA201CA', 'F018XI208CA', 'R018XI106CA', 'R018XC104CA', 'R018XE102CA', 'F018XC203CA', 'R018XC103CA', 'R018XX101CA', 'F018XI207CA', 'R018XC101CA', 'R018XD092CA', 'R018XC102CA', 'R018XC106CA', 'R018XI102CA', 'R018XI111CA', 'R018XI164CA', 'R018XA103CA', 'R018XI101CA', 'F018XA202CA', 'R018XA101CA', 'R018XD082CA', 'R018XD089CA', 'R018XI103CA', 'R018XI125CA', 'F018XI204CA', 'F018XI206CA', 'R018XA104CA', 'R018XA102CA', 'R018XC109CA', 'R018XC110CA', 'R018XI104CA', 'R018XD064CA', 'R018XD066CA', 'R018XD084CA', 'R018XD091CA', 'R018XD095CA' )


for (ecosites_of_interest in ecosites_of_interest) {
  rmarkdown::render(input = "C:/Users/Nathan.Roe/Documents/PES4ever/NASIS_ecosite_to_EDIT/NASIS_data_to_EDIT_multiple.Rmd",
                    output_file = paste0(ecosites_of_interest,".html"), 
                    params = list(ecosites_of_interest = ecosites_of_interest))
}


