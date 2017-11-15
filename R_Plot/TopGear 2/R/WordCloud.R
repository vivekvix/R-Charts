#Generate a word cloud in R. A word cloud is simply a graphical representation in which the size of the font used for the word corresponds to its frequency relative to others. Bigger the size of the word, higher is its frequency


install.packages(c("wordcloud","RColorBrewer","tm"))
library(wordcloud)
library(RColorBrewer)
library(tm)
pal =brewer.pal(6,"RdGy")
wordcloud("I also want to thank all the members of Congress and my administration who are here today for the wonderful work that they do.  I want to thank Mayor Gray and everyone here at THEARC for having me..",
          min.freq=1, scale=c(2,0.5),random.color= TRUE ,color=pal)
          
   