library(naniar)
library(tidyverse)

ggplot(
  data = oceanbuoys,
  mapping = aes(x = air_temp_c, y = sea_temp_c)
) +
  geom_point()

ggplot(
  oceanbuoys,
  aes(x = air_temp_c, y = sea_temp_c)
) +
  geom_point()

ggplot(
  oceanbuoys,
  aes(x = air_temp_c, y = sea_temp_c)
) |>
  geom_point()

##
library(tidyverse)
library(naniar)

# How many rows do you think oceanbuoys has? Have a guess, then check with nrow(oceanbuoys).

nrow(oceanbuoys)

# If you mapped humidity onto the y axis instead of sea_temp_c, which part of the code would change?

# Can you draw this plot, with humidity on the y axis?
# ggplot(oceanbuoys, x = air_temp_y, y = ???) +
#     geom_point()
#
# ggplot(oceanbuoys, aes(x = air_temp_y, y = ???)) +
#     geom_point()
#
#
# ggplot(oceanbuoys, aes(x = air_temp_c, y = sea_temp_c)) +
#     geom_point()

summary(oceanbuoys)

oceanbuoys |>
  group_by(year) |>
  summarise(
    across(everything(), list(min, mean, median, max))
  )

oceanbuoys

ggplot(oceanbuoys, aes(x = humidity, y = as.factor(year))) +
  geom_boxplot()
# facet_wrap(~)

## always multiple ways

ggplot(
  oceanbuoys,
  aes(
    x = air_temp_c,
    y = sea_temp_c
  )
) +
  geom_point(shape = 21, colour = "black", fill = "white")


ggplot(
  oceanbuoys,
  aes(
    x = air_temp_c,
    y = sea_temp_c,
    colour = factor(year)
  )
) +
  geom_point(alpha = 0.5) +
  # adding things layer by layer
  geom_smooth(method = "lm") +
  # overriding arguments by specifying them again
  geom_smooth(method = "lm", colour = "black")

## change the order of the layering

ggplot(
  oceanbuoys,
  aes(
    x = air_temp_c,
    y = sea_temp_c,
    colour = factor(year)
  )
) +
  # adding things layer by layer
  geom_smooth(method = "lm") +
  # overriding arguments by specifying them again
  geom_smooth(method = "lm", colour = "black") +
  geom_point(alpha = 0.5)


## to pipe or not?

# I prefer to keep the data as a separate unit to the graphic
# but intial exploration it can be nice to use the pipe straight into a ggplot

oceanbuoys |>
  mutate(air_sea_ratio = air_temp_c / sea_temp_c) |>
  ggplot(aes(
    x = air_sea_ratio,
    colour = factor(year)
  )) +
  geom_density()

## generally prefer to only use a pipe for more than 1 function

oceanbuoys |> tail()
# prefer
tail(oceanbuoys)
