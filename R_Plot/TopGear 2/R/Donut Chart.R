#Use below data and create donut chart as shown in below figure.
#data = c(179718,41370,41914,44280)


library(ggplot2)

# Create test data.
dat = data.frame(count=c(179718,41370,41914,44280), category=c("Army", "Navy", "Air Force","Marines"))

# Add addition columns, needed for drawing with geom_rect.
dat$fraction = dat$count / sum(dat$count)
dat = dat[order(dat$fraction), ]
dat$ymax = cumsum(dat$fraction)
dat$ymin = c(0, head(dat$ymax, n=-1))

# Make the plot
p1 = ggplot(dat, aes(fill=category, ymax=ymax, ymin=ymin, xmax=5, xmin=3)) +
  geom_rect() +
  geom_text( aes(label = paste(category," ",round(fraction*100,2), "%"), x=6, y=ymin +(fraction/2)), size=4)+
  coord_polar(theta="y") +
  xlim(c(0, 7)) +
  labs(x=NULL, y=NULL)+
  theme(panel.grid=element_blank(),
  axis.text=element_blank(),
  legend.position="none",
  axis.ticks=element_blank()) +
  annotate("text", x = 0, y = 0, label = "Traumatic Brain \nInjury 2000-2014(Q2)") +
  labs(title="")
p1