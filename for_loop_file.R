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

library(plyr)
library(dplyr)
library(wordcloud)
library(wordcloud2)
library(ggplot2)
library(plotly)
library(manipulateWidget)
library(knitr)
library(stringr)
library(DescTools)

ecosites_of_interest <- c( 'F022AD102CA', 'F022AH102CA', 'R022AD002CA', 'R022AA010CA', 'F022AD104CA', 'R022AK002CA', 'F022AH106CA', 'R022AB010CA', 'F022AB100CA', 'F022AD103CA', 'F022AH104CA', 'F022AB114CA', 'R022AH001CA', 'R022AX000CA', 'F022AD101CA', 'F022AK101CA', 'F022AX017CA', 'R022AA102CA', 'R022AD009CA', 'R022AH000CA', 'R022AK001CA', 'F022AB111CA', 'F022AH101CA', 'F022AH203CA', 'F022AK100CA', 'F022AX014CA', 'R022AA106CA', 'R022AB001CA', 'R022AD001CA', 'R022AD003CA', 'R022AD007CA', 'R022AD010CA', 'R022AX007CA', 'R022AX008CA', 'R022AX009CA', 'R022AX010CA', 'R022AX011CA', 'F022AB108CA', 'F022AB113CA', 'F022AD100CA', 'F022AD105CA', 'F022AH201CA', 'F022AX005CA', 'R022AA101CA', 'R022AA104CA', 'R022AB004CA', 'R022AB006CA', 'R022AB009CA', 'R022AB012CA', 'R022AX001CA', 'R022AX006CA', 'R018XC107CA', 'F018XC201CA', 'F018XC203CA', 'R018XC109CA', 'R018XX101CA', 'R018XC110CA' )

NASIS_data_multiple <- "./NASIS_data_to_EDIT_multiple.Rmd"


for (ecosites_of_interest in ecosites_of_interest) {
  rmarkdown::render(input = NASIS_data_multiple,
                    output_file = paste0(ecosites_of_interest,".html"),
                    params = list(ecosites_of_interest = ecosites_of_interest))
}