if (!require(ggplot2)) {
  install.packages("ggplot2")
}
if (!require(dplyr)) {
  install.packages("dplyr")
}

library(ggplot2)
library(dplyr)

data("mtcars")

mtcars$cyl <- as.factor(mtcars$cyl)

p <- ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ cyl) +
  labs(
    title = "Scatter plot of MPG vs Weight by Cylinder Count",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon (MPG)",
    color = "Number of Cylinders"
  ) +
  theme_minimal()

ggsave("scatter_plot.png", plot = p)

print(p)
