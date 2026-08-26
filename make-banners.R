# Chapter banners.
#
# Each chapter opens with a wide strip taken from a plot the chapter actually
# builds, so the banner previews the work rather than decorating it. Titles,
# legends and axis titles come off: at this size they are unreadable, and the
# banner is meant to be recognised rather than read.
#
# Run from the project root:
#   R --quiet --vanilla -f make-banners.R

library(tidyverse)
library(naniar) # pedestrian
library(colorspace)
library(patchwork)
library(fs)

banner_dir <- path("images", "banners")
dir_create(banner_dir)

# The banner look. Everything that needs reading at full size gets dropped,
# because none of it survives being 2.6 inches tall.
theme_banner <- function() {
  theme_minimal(base_size = 9) +
    theme(
      axis.title = element_blank(),
      axis.text = element_blank(),
      legend.position = "none",
      plot.title = element_blank(),
      strip.text = element_blank(),
      panel.grid.minor = element_blank()
    )
}

save_banner <- function(plot, name, height = 2.6) {
  ggsave(
    filename = path(banner_dir, name, ext = "png"),
    plot = plot,
    width = 12,
    height = height,
    dpi = 150
  )
}

# ── data, matching what each chapter builds ──────────────────────────────

pen_short <- penguins |>
  as_tibble() |>
  select(species, year, bill_len, bill_dep) |>
  drop_na() |>
  group_by(species, year) |>
  slice(1) |>
  ungroup()

pedestrian_day <- pedestrian |>
  mutate(
    day_type = if_else(
      condition = str_starts(week_day, "S"),
      true = "weekend",
      false = "weekday"
    )
  )

pedestrian_hourly <- pedestrian_day |>
  group_by(sensor_name, day_type, hour) |>
  summarise(mean_count = mean(hourly_counts, na.rm = TRUE), .groups = "drop")

pedestrian_totals <- pedestrian_day |>
  group_by(sensor_name, day_type) |>
  summarise(total = sum(hourly_counts, na.rm = TRUE), .groups = "drop")

pedestrian_weekday <- filter(pedestrian_hourly, day_type == "weekday")

# ── ch3, the shape of your data ──────────────────────────────────────────
# The sawtooth. The chapter's signature failure, and it reads as a shape from
# across the room.

save_banner(
  ggplot(pen_short, aes(x = year, y = bill_len)) +
    geom_line(linewidth = 0.8, colour = "grey30") +
    theme_banner(),
  "shape-of-your-data"
)

# ── ch4, what gets computed ──────────────────────────────────────────────
# One variable, three bin widths. The whole chapter in three panels.

hist_bw <- function(bw) {
  ggplot(pedestrian, aes(x = hourly_counts)) +
    geom_histogram(binwidth = bw, fill = "grey30") +
    # hourly_counts has a long right tail. Left alone it puts every bar in the
    # first tenth of the strip and the three bin widths look the same.
    coord_cartesian(xlim = c(0, 2500)) +
    theme_banner()
}

save_banner(
  hist_bw(1000) | hist_bw(100) | hist_bw(10),
  "what-gets-computed"
)

# ── ch5, what am I comparing ─────────────────────────────────────────────
# The same numbers stacked, dodged and filled.

bar_pos <- function(pos) {
  ggplot(pedestrian_totals, aes(x = total, y = sensor_name, fill = day_type)) +
    geom_col(position = pos) +
    scale_fill_discrete_qualitative(palette = "Dark 3") +
    theme_banner()
}

save_banner(
  bar_pos("stack") | bar_pos("dodge") | bar_pos("fill"),
  "what-am-i-comparing"
)

# ── ch6, what's in the way ───────────────────────────────────────────────
# Before and after, which is the argument.

p_busy <- ggplot(
  pedestrian_hourly,
  aes(x = hour, y = mean_count, colour = day_type)
) +
  geom_line() +
  facet_wrap(vars(sensor_name)) +
  scale_colour_discrete_qualitative(palette = "Dark 3")

save_banner(
  (p_busy +
    theme_grey(base_size = 9) +
    theme(
      axis.title = element_blank(),
      axis.text = element_blank(),
      legend.position = "bottom"
    )) |
    (p_busy + theme_banner()),
  "whats-in-the-way"
)

# ── ch7, where should the eye go ─────────────────────────────────────────
# The mismatch next to the match. Nick's pick.

p_tiles <- ggplot(
  pedestrian_weekday,
  aes(x = hour, y = sensor_name, fill = mean_count)
) +
  geom_tile() +
  theme_banner()

save_banner(
  (p_tiles + scale_fill_continuous_sequential(palette = "Viridis")) |
    (p_tiles + scale_fill_gradientn(colours = rainbow(7))),
  "where-should-the-eye-go"
)

# ── ch8, making it land ──────────────────────────────────────────────────
# The finished article, which is what the chapter is for. This one keeps its
# title, because the title is the chapter's whole point.

p_land <- ggplot(
  pedestrian_hourly,
  aes(x = hour, y = mean_count, colour = day_type)
) +
  geom_line() +
  facet_wrap(vars(sensor_name), nrow = 1) +
  scale_colour_discrete_qualitative(palette = "Dark 3") +
  labs(title = "Only the park gets busier on a weekend") +
  theme_minimal(base_size = 11) +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    legend.position = "none",
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )

save_banner(p_land, "making-it-land")

cat("banners written to", path_abs(banner_dir), "\n")
print(dir_ls(banner_dir))
