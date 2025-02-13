# the following exercises are a test in disguise. 
# can you think of any improvements to the following code?
# go through the exercises and answer them while fixing issues and improving on code workflow
# make a Rmarkdown (or Quarto) version of this document with your responses 
# render the document in PDF and HTML formats

rm(list=ls()) 

 install.packages("tidyverse") 
 

library(tidyverse)

## PROBLEM 1 ##

#visualizing your data is important!
#summary statistics can be highly misleading, and simply plotting the data can #reveal a lot more!
#Lets look at the Anscombe’s Quartet data. There are four different data sets.
#Anscombe, F. J. (1973). "Graphs in Statistical Analysis". American Statistician. 27 (1): 17–21. doi:10.1080/00031305.1973.10478966. JSTOR 2682899.

anscombe_quartet = readRDS("anscombe quartet.rds")

# let's explore the dataset 
str(anscombe_quartet)

# what does the function str() do? 
#It provides a list of variables console 

# let's check some summary statistics:

anscombe_quartet %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )

# what do the summary statistics tell us about the different datasets? 
#The summary statistics say the data sets are similar, with data set 4 seeming to span wider 

# let's plot the data with ggplot:

library(ggplot2)

theme_set(theme_bw(base_size = 15) + theme(legend.position="bottom"))

aq_plot <-
ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
    theme(panel.grid.minor = element_blank()) +
   coord_cartesian(ylim = c(0, 20), xlim = c(0, 20)) +
  facet_wrap(~dataset)


# save as plot - PNG format
# width 5 inch, height = 5 inch for paper

ggsave(filename ='anscombe_quartet.png', plot = aq_plot, width = 5, height = 5)

# what do the plots tell us about the different datasets? 
# describe the relationship between x and y in the different datasets. 
#x and y have a postive relationship in both data set 1 and 

# would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset?
#I would say so as the are 

# what conclusions can you draw for the plots and summary statistics? 




## PROBLEM 2 ##

#(adapt code from problem 1 if encessary)

# load in the datasaurus dataset
datasaurus_dozen = readRDS("WEEK5/files_week5/datasaurus_dozen.rds")

# explore the different datasets in datasaurus_dozen 

# print descriptive statistics and make a nicely formatted table

# calculate the correlations for x and y

# Plot their relationships including the line of best fit.

# save the plot 

