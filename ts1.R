library(ggplot2)
data <- read.csv("C:/Users/Nusatrip/OneDrive/Documents/IPB/Semester 2/Data mining/crop/Crops_AllData_Normalized.csv")
summary(data)
#get country liberia
data_liberia <- filter(data, Area=="Liberia")

#convert string to numuric
mapping <- c("Area harvested" = "0", "Yield" = "1", "Production" = "2")
data_liberia$Element <- mapping[as.character(data_liberia$Element)]
#applyTo
data_liberia$Element <- as.numeric(data_liberia$Element)

ggplot(data_liberia, aes(x = Element)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  coord_cartesian(ylim = c(1900, 2050)) + 
  scale_x_continuous(labels = c("Harvested", "Yield", "Production"), breaks = c(0, 1, 2)) +
  labs(title = "Histogram of Data Liberia", x = "Element", y = "Frequency")
