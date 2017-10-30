#getwd() #get the working direct
#WaterfallData = read.csv("C:/Users/vi392289/Documents/waterfall_charts_trng_project/waterfall.csv")

WaterfallData <- data.frame(labels = c("Prev yr","jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec","prent yr"), 
                    value = c(45,2,-18,-25,6,7.6,9.8,-6.8,-10,7.7,8.5,-16,5,15.8),
                    logic = c(TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE)
)
library(ggplot2)
WaterfallData$labels <- factor(WaterfallData$labels, levels = WaterfallData$labels)
WaterfallData$end <- cumsum(WaterfallData$value)
WaterfallData$end <-c(head(WaterfallData$end,-1),0)
WaterfallData$start <- c(0,head(WaterfallData$end, -1))
WaterfallData$id <- seq_along(WaterfallData$value)

WaterfallData$logic1 <- ifelse(WaterfallData$logic == "TRUE", "TOTAL", ifelse(sign(WaterfallData$value) == 1, "UP", "DOWN"))

ggplot(WaterfallData, aes(value, fill = logic1)) + geom_rect(aes(x = labels, xmin = id - 0.35, xmax = id + 0.35, ymin = end,ymax = start)) + ggtitle("WaterfallData Plot to showing financial data") + geom_text(data=WaterfallData, aes(x=id, y=pmax(start,end)+2,label=value), size=4)  +     theme(plot.title = element_text(hjust = 0.5),legend.position="none")
