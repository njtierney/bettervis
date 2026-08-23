library(naniar)
library(tidyverse)

flagstaff <- pedestrian |>
  filter(sensor_name == "Flagstaff Station")

flagstaff_january <- flagstaff |>
  filter(
    month == "January"
  )

flagstaff_january_1 <- flagstaff_january |>
  filter(
    month_day == 1
  )

flagstaff_8am <- flagstaff |>
  filter(hour == 8)

flagstaff_january_1_8am <- flagstaff_january_1 |>
  filter(hour == 8)

ggplot(flagstaff, aes(x = hour, y = hourly_counts)) +
  geom_boxplot()

ggplot(flagstaff, aes(x = hour, y = hourly_counts, group = hour)) +
  geom_boxplot()

# look at each weekday

flagstaff_8am |>
  group_by(week_day) |>
  summarise(median_count = median(hourly_counts, na.rm = TRUE))

library(tidyverse)
library(naniar)
flagstaff <- pedestrian |>
  filter(sensor_name == "Flagstaff Station")

flagstaff_8am <- flagstaff |>
  filter(hour == 8)

flagstaff_8am

flagstaff_8am_weekend <- flagstaff_8am |>
  mutate(
    day_type = if_else(
      condition = week_day %in% c(..., ...),
      true = ...,
      false = ...
    )
  )

flagstaff_8am_weekend

ggplot(..., aes(x = ..., y = ...)) +
  geom_boxplot()


flagstaff_hourly <- flagstaff |>
  group_by(hour) |>
  summarise(mean_count = mean(hourly_counts, na.rm = TRUE))

flagstaff_hourly

ggplot(flagstaff_hourly, aes(x = hour, y = mean_count)) +
  geom_col()

flagstaff_hourly

ggplot(flagstaff_hourly, aes(x = hour)) +
  geom_bar()

# geom_bar --> count()

flagstaff_hourly |>
  count(hour)

ggplot(pedestrian, aes(x = hour)) +
  geom_bar()

pedestrian |> count(hour)

## geom_bar

mpg

ggplot(mpg, aes(x = class)) +
  geom_bar()

mpg |> count(class)

## binning and histograms
pedestrian
base_hist <- hist(pedestrian$hourly_counts, density = "FD")
base_hist <- hist(pedestrian$hourly_counts, breaks = "FD")

tibble(
  breaks = base_hist$breaks,
  counts = c(base_hist$counts, Inf)
)

ggplot(pedestrian, aes(x = hourly_counts)) +
  geom_histogram(colour = "white")

ggplot(pedestrian, aes(x = hourly_counts)) +
  geom_histogram(binwidth = 10)

ggplot(flagstaff_8am, aes(x = hourly_counts)) +
  geom_histogram(binwidth = 50) +
  geom_rug(alpha = 0.1)

### exercises!
#
# birrarung_8am <- pedestrian |>
#   filter(sensor_name == "Birrarung Marr",
#          hour == ___)
#
# ggplot(birrarung_8am,
#        aes(x = hourly_counts)) +
#   geom_histogram(binwidth = ___) +
#   geom_rug(alpha = ___)

birrarung <- pedestrian |>
  filter(sensor_name == "Birrarung Marr")

cut(birrarung$hour, breaks = 4) |> unique()
nrow(birrarung)
birrarung_day_types <- birrarung |>
  mutate(
    # parts_of_day = cut(hour, breaks = 6, labels = c("Morning", "Noon", "Afternoon", "Evening")),
    parts_of_day = case_when(
      between(hour, 4, 10) ~ "Morning",
      between(hour, 11, 14) ~ "Noon",
      between(hour, 15, 18) ~ "Afternoon",
      between(hour, 19, 23) ~ "Night",
      between(hour, 0, 3) ~ "Very Late"
    ),
    .after = hour
  )

ggplot(birrarung_day_types, aes(x = hourly_counts, colour = parts_of_day)) +
  geom_freqpoly()

ggplot(birrarung_day_types, aes(x = hourly_counts)) +
  geom_histogram(binwidth = 50) +
  facet_wrap(vars(parts_of_day), ncol = 1)

ggplot(pedestrian, aes(x = hourly_counts)) +
  geom_histogram(bins = 30, colour = "white") +
  # scale_x_continuous(labels = c("0", "3,000", "6,000", "9,000", "12,000"))
  scale_x_continuous(labels = scales::comma, n.breaks = 10)

## coords
ggplot(pedestrian, aes(x = hourly_counts)) +
  geom_histogram(bins = 30, colour = "white")
