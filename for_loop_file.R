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

ecosites_of_interest <-  c( 'R023XY006NV', 'R023XY031NV', 'R023XY216OR', 'R023XY039NV', 'R023XY017NV', 'R023XY020NV', 'R023XY212OR', 'R023XY300OR', 'R023XY310OR', 'R023XY318OR', 'R023XY316OR', 'R023XY007NV', 'R023XY037NV', 'R023XY214OR', 'R023XY220OR', 'R023XY015NV', 'R023XY008NV', 'R023XY016NV', 'R023XY047NV', 'R023XY312OR', 'R023XY065NV', 'R023XY302OR', 'R023XY211OR', 'R023XY200OR', 'R023XY511OR', 'R023XY514OR', 'R023XY041NV', 'R023XY093NV', 'R023XY213OR', 'R023XF082CA', 'R023XY026NV', 'R023XY059NV', 'R023XY608OR', 'R023XY061NV', 'R023XY094NV', 'R023XY066NV', 'R023XY021NV', 'R023XY308OR', 'F023XY028NV', 'R023XY005NV', 'R023XY054NV', 'R023XY088NV', 'R023XY097NV', 'R023XY218OR', 'R023XF084CA', 'R023XY001NV', 'R023XY044NV', 'R023XY089NV', 'R023XY104OR', 'R023XY516OR', 'R023XF081CA', 'R023XY202OR', 'R023XY117OR', 'R023XY604OR', 'R023XY607OR', 'R023XY301OR', 'R023XY320OR', 'R023XY508OR', 'R023XY003NV', 'R023XY010NV', 'R023XY019NV', 'R023XY043NV', 'R023XY404OR', 'F023XY095NV', 'R023XF083CA', 'R023XY210OR', 'R023XY418OR', 'R023XY009NV', 'R023XY025NV', 'R023XY030NV', 'R023XY042NV', 'R023XY100OR', 'R023XY115OR', 'R023XY408OR', 'R023XY515OR', 'R023XY610OR', 'R023XF087CA', 'R023XG058CA', 'R023XY002NV', 'R023XY013NV', 'R023XY018NV', 'R023XY023NV', 'R023XY048NV', 'R023XY053NV', 'R023XY079NV', 'R023XY507OR', 'R023XY602OR', 'R023XY057NV', 'R023XY082NV', 'R023XY096NV', 'R023XY118OR', 'R023XY217OR', 'R023XY512OR', 'F023XY024NV', 'F023XY091NV', 'R023XF088CA', 'R023XF089CA', 'R023XF091CA', 'R023XG048CA', 'R023XG054CA', 'R023XY033NV', 'R023XY051NV', 'R023XY060NV', 'R023XY064NV', 'R023XY071NV', 'R023XY072NV', 'R023XY090NV', 'R023XY119OR', 'R023XY215OR', 'R023XY324OR', 'R023XY501OR', 'R023XY509OR', 'R023XY600OR', 'R023XY666OR', 'R023XY670OR', 'F023XY036NV', 'R023XF085CA', 'R023XF092CA', 'R023XF093CA', 'R023XG051CA', 'R023XG059CA', 'R023XY011NV', 'R023XY014NV', 'R023XY038NV', 'R023XY040NV', 'R023XY116OR', 'R023XY222OR', 'R023XY406OR', 'R023XY510OR', 'F023XY092NV', 'R023XF034OR', 'R023XG049CA', 'R023XG053CA', 'R023XY068NV', 'R023XY073NV', 'R023XY078NV', 'R023XY321OR', 'R023XY414OR', 'R023XY416OR', 'R023XY606OR', 'R023XY612OR', 'R023XY613OR', 'F023XY034NV', 'F023XY070NV', 'R023XG050CA', 'R023XG056CA', 'R023XG057CA', 'R023XY022NV', 'R023XY049NV', 'R023XY052NV', 'R023XY056NV', 'R023XY058NV', 'R023XY063NV', 'R023XY098NV', 'R023XY099NV', 'R023XY101NV', 'R023XY219OR', 'R023XY221OR', 'R023XY303OR', 'R023XY314OR', 'R023XY410OR', 'R023XY412OR', 'R023XY502OR', 'R023XY503OR', 'R023XY504OR', 'R023XY505OR', 'R023XY506OR', 'R023XY672OR' )

# I am now including a map of the distribution of the ecosite. To do that, I am going to read in the shapefiles here, that way they aren't 
# read within the looping which would require the shapefiles to be read as many times as you have sites. 

mapunit_boundaries <- sf::read_sf("C:/Users/Nathan.Roe/Documents/PES/gSSURGO_CA_2022.gdb", "mupolygon")
mlra_boundaries <- read_sf("C:/Users/Nathan.Roe/Documents/PES/MLRA_52_2022/MLRA_52_2022/MLRA_52.shp")


for (ecosites_of_interest in ecosites_of_interest) {
  rmarkdown::render(input = "C:/Users/Nathan.Roe/Documents/PES4ever/NASIS_ecosite_to_EDIT/NASIS_data_to_EDIT_multiple.Rmd",
                    output_file = paste0(ecosites_of_interest,".html"), 
                    params = list(ecosites_of_interest = ecosites_of_interest))
}


