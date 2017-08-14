# Initialization of variables, both numerical counters and list sets.


a = 0 # This will check the difference between the i+1 index of Col 1 in the X data.  

d = 0 # This will do the same for the Y values.  We are interested in when this value is NOT 1.

# Be sure to import Group14x and Group14y before running this code!  I felt it wasn't necessary to import it since
# it won't be in the same file location for everyone.

skippedlistX = c()  #This empty vector will end up collecting all the indices missing in Group14x.
skippedlistY = c()  #This will do the same for Group14y.

allskips = c()  #This will ultimately be the union set of skipped data in X and Y.

dtest = c()  # This was used in testing because I found that there was a difference in size between the resulting
# sorted X and Y value sets.  By using this I was able to discover that one data point in Y skipped two values, 
# not one.  This caused there to be one point in the X set to not be deleted that needed to be.



for (i in 1:1013) {   # Will execute the following block of code for all 1013 x values in Group14x.
  
  a = Group14x[i+1,1] - Group14x[i,1] #Takes a num value for the difference in consecutive X values in Col 1.
  
  if(a>1){   # I.E. If they are not consecutive, we'll add the missing values to our deletion list.
    
    for (j in 2:a){  #We cannot assume every value in the list will skip exactly one value.  Because of this,
      # we need to add a point to the deletion list for EVERY value skipped.  Just to be thorough.
      
      skippedlistX = c(skippedlistX, Group14x[i+1,1]-j+1)
      
    }
  }
  
}


for (i in 1:1017){    # Will execute the following block of code for all 1017 y values in Group14y.
  
  d = Group14y[i+1,1] - Group14y[i,1]
  dtest = c(dtest,d)  #This was the test list where I discovered there was a double gap.  To test this yourself,
  # you can run this by typing in --> dtest <-- in the console below after executing this program.
  
  if(d>1){
    
    for (j in 2:d){
      skippedlistY = c(skippedlistY, Group14y[i+1,1]-j+1)
    }
    
  }
  
  
}


allskips = union(skippedlistX,skippedlistY)  # This will combine all elements in either set in order to 
# delete values from both X and Y lists if EITHER list is missing that value.  Allows us to "cross-delete".


Xvalues = Group14x[!Group14x[,1] %in% allskips,2]  #Takes all the values that are in Group14x but NOT in the union of 
#Group14x and allskips.  We denote the second column so we are collecting the corresponding values.
Yvalues = Group14y[!Group14y[,1] %in% allskips,2]  #Same goes here for Y values.



#sortedXvalues = sort(Xvalues)  #All X data is sorted.
#sortedYvalues = sort(Yvalues)  #All y data is sorted.


#lm(sortedYvalues ~ sortedXvalues)  #This convenient function allows us to quickly test the linear relationship 
#between the dependent Y values and the independent X values.

plot(Xvalues,Yvalues)
#plot(sortedXvalues,sortedYvalues) #This will plot the result of this data in the bottom right of your studio
# if you are using R studio.

# Now, any calculations from here can be done using the variables that I have defined.  



lm(Yvalues ~ Xvalues)
