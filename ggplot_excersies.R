# Afternoon ggplot excersises 
install.packages("ggplot2", dependencies=TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

# Load packages
library("ggplot2")
library("plyr")
library("ggthemes")
library("reshape2")

# ggplot needs type data.frame 

# Load some sample data
head(iris)
# Look at the dara
iris[1:2, ]

# melt data
df <- melt(iris, id.vars = "Species")
df[1:2,]

# AESthetics

myplot <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)

# GEOMetry
ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
# OR
myplot <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))
myplot + geom_point() 

# Changing aesthetics of a geom
# Size 
ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point(size = 3)
# Size & Color
ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(size = 3)
# Size & Shape
ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(aes(shape = Species), size = 3)

# Excersise 1
# Make a small sample of the diamonds dataset
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
# Plot carat X Price graph
ggplot(data=d2, aes(x= carat, y = price, color = color )) + geom_point(size=3)

# STATs
# Statistical transformations and data summary (binning for a histogram for fitting linear model)

library(MASS)
myplot <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
summary(myplot)

# Facets (POWWWWWWWWWWwwwwwwwwwwwawaaaaaaaaaa)
# Subsetting data to make lattice plors
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid(Species ~ .)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid(. ~ Species)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid( ~ Species)

# Scales
# Control mapping from data to aesthetics
aes(color = variable) # Mapping
color = "black" # Setting
# Or add it as a scale 
scale_fill_manual(values = c("color1", "color2"))

library(RColorBrewer)
display.brewer.all()

# Color brewer plette
df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat = "identity", position = "dodge") + scale_fill_brewer(palette = "Set1")

# Continuous scale to an axis
library(MASS)
myplot <- ggplot(birthwt, aes(factor(race), bwt)) + 
  geom_boxplot(width  = .2) +
  scale_y_continuous(labels = (paste0(1:4, " Kg")), breaks = seq(1000, 4000, by = 1000))

# Histograms
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 30, colour="black" )
# Smaller bin & different color
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 8, colour="black", fill="steelblue")

# Wat
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "identity")
# ?
df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable )) + geom_bar(stat = "identity")
# Previous was plotting the maximum
ggplot(df, aes(Species, value, fill = variable )) + geom_bar(stat = "identity", position = "dodge")
# 
ggplot(d2, aes(clarity, cut)) + geom_bar(stat = "identity")
ggplot(d2, aes(x=clarity, fill= cut)) + geom_bar(position = "dodge")
ggplot(d2, aes(x=clarity, fill= cut)) + geom_histogram(position = "dodge")

# Density plots
ggplot(faithful, aes(waiting)) + geom_density()
ggplot(faithful, aes(waiting)) + geom_density(fill = "blue", alpha = 0.1)
ggplot(faithful, aes(waiting)) + geom_line(stat = "density")
# Smoothers
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species), size = 3) +
  geom_smooth(method = "lm")

# Themes
install.packages("ggthemes")
library(ggthemes)

# Publication Quality Figures
ggsave(~/pathtofigure.png)
ggsave(plot1, file = "~/pathtofigure.png")
ggsave(plot1, file = "~/pathtofigure.png", width = 6, height = 4 )
# EPS, PDF, PNG
# docs.ggplot2.org/current/





