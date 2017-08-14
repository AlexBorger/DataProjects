# Last revision: 8/13/2017 at 11:45 am

# Author: Alex Borger


# This document is designed to use ggplot2 to show a trend
# in my personal weight loss effort.  The data begins 11/3/2016 and runs
# until the present.  

# The data will be taken from Excel PRIOR to running this script.

library("ggplot2")
library(readxl)
Alex_Borger_Weight_Data <- read_excel("~/Alex Borger Weight Data.xlsx")
View(Alex_Borger_Weight_Data)

# I will be adding a smoothing function to the graph to show minor
# changes in the effectiveness of my diet.  I have chosen a span
# parameter of 0.3 because I feel it is the right balance of 
# bias and variance.

ggplot(data=Alex_Borger_Weight_Data, aes(x=Date,y=Weight))+
geom_point()+geom_smooth(span = 0.3)+
ggtitle("Alex Borger Weight Data")+labs(x="Date",y = "Weight in lbs")+
  theme(plot.subtitle = element_text(vjust = 1), 
        plot.caption = element_text(vjust = 2), 
        plot.title = element_text(hjust = 0.5), 
        panel.background = element_rect(fill = "azure2"))

# As you can see, the weight loss is pretty significant!
# A few key dates to keep in mind:

# 1/26/2017 was the date of my initial nutrition appointment.  We 
# talked about cutting out fast food - something I had been having
# 3-4 times a week on average.  Looking back, I think cutting out fast
# food was the biggest step towards being healthy.

# Another anomaly occurs March 10th-22nd.  The lack of data represents
# my trip to Disney World!  I did my best to avoid temptation while
# I was there, but there are just too many great restaurants to 
# have to try to avoid.  In the end, with all of the walking I did,
# I think I still maintained a decent diet.  I think traveling caused
# me to retain some water weight, but as soon as I came home, it all
# went away, and I was back on track!

# The last real deviation from the normal weight loss pattern occured
# rather recently.  Starting August 2nd, I began my liquid diet for
# my sleeve gastrectomy operation.  I have lost 20.8 lbs so far on this
# liquid diet - 1.89 lbs per day - and I'm very excited to see how the
# weight loss continues post-op.  My goal weight is 215 lbs.