# The Iraq body count is a database that maintains records of violent civilian deaths since 2003. The heat map clearly should show that the most civilian deaths occurred in the 2006-2008 period and it declined thereafter

library(readr)
iraqbdc <- read_csv("graph_exercises/iraqbdc.csv")
View(iraqbdc)

library(ggplot2)
library(reshape2)
iraqbdc.m <- melt(iraqbdc, id="years")

colorends <- c("steelblue", "#fee395", "#bd4842")

p <- ggplot(iraqbdc.m, aes(x = variable,y = years)) + geom_tile(aes(fill = value)
      ,colour = "grey") +
  scale_fill_gradientn(colours = colorends) +
  scale_y_continuous(trans = "reverse",position = "right",breaks=iraqbdc.m$years) +
  ggtitle("Iraq Body Count") +
 theme(plot.title = element_text(hjust = 0.5),panel.background = element_rect(fill = NA),
legend.position="right",legend.justification = "top",axis.title=element_blank(),
axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 0.5))
