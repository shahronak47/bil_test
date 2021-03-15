# Data Explorer


This application is built to explore the clinical dataset available in the `Data` folder of this repository. The two files are merged together to create a new dataset. 

The app is available at https://shahronak.shinyapps.io/data_explorer/ 


This app shows 2 `plotly` plots. 

1. Histogram for `AGE` variable for different `BMRKR2` values. There are 3 unique `BMRKR2` values (`LOW`, `MEDIUM` and `HIGH`) which can be selected using a dropdown. User can also specify number of bins in the histogram. 

2. A dodged bar plot where user upon selection of subject ID can see `LBCAT` values colored with `AVISIT`. 

User can download these plots as images in a PDF file upon clicking. 
