# Making Better Graphs


<!-- README.md is generated from README.qmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

## Prerequisites

- Basic R programming experience
- No familiarity with ggplot2 required
- Experience working with data

## Learning outcomes

- How to think about creating good plots
- Good vs bad charts  
- Data-ink ratio  
- Clear message communication  
- Hierarchy of plot design (concepts of proximity)
- Fundamentals of ggplot2:
  - Understanding the grammar of graphics
  - Working with different geoms and aesthetics
  - Common pitfalls and how to avoid them
  - Polishing plots for publication
  - Brief introduction to useful common extensions (e.g., patchwork)

## Learning Outcomes

By the end of this course, participants will be able to:

1.  Understand the grammar of graphics and how ggplot2 implements it
2.  Map variables to aesthetics (x, y, colour, fill, shape, size)
    appropriately
3.  Choose appropriate geometries for different data types (points,
    lines, bars, histograms)
4.  Use faceting strategically to create small multiples with
    `facet_wrap()` and `facet_grid()`
5.  Apply the proximity principle when designing multi-variable plots
6.  Recognise and create tidy data suitable for ggplot2
7.  Reshape data using `pivot_longer()` and `pivot_wider()`
8.  Create effective bar plots with proper sorting and positioning
9.  Polish plots with labels, themes, colours, and legends
10. Handle overplotting using jitter, transparency, and summaries
11. Save publication-quality figures with `ggsave()`

## Course website

<https://better-vis.njtierney.com>

This course goes through not just how to create graphics, but how to
communicate your message in your graphic.

## Schedule

### Session 1: Introduction & Scatterplots

- Philosophy and approach to understanding ggplot2
- Learn the anatomy of a ggplot using the template approach
- Map variables to aesthetics (x, y, colour, shape, size)
- Understand the difference between mapping aesthetics inside `aes()`
  versus setting them outside
- Practice with `variables-aesthetics.R` and `colour.R`

### Session 2: Faceting & Small Multiples

- Learn to create small multiples with `facet_wrap()` and `facet_grid()`
- Understand when to use single vs multiple variable faceting
- Apply the proximity principle: put the comparisons you want readers to
  make close together
- Explore different orderings of colour vs facets to change
  interpretations
- Practice recreating plots with different faceting strategies using
  `facet.R`

### Session 3: Tidy Data & Line Graphs

- Introduction to tidy data principles and why they matter for ggplot2
- Learn to identify if data is tidy using the template: variables,
  observations, and values
- Reshape data with `pivot_longer()` and `pivot_wider()`
- Create line graphs with `geom_line()` using gapminder data
- Understand the `group` aesthetic for multiple series
- Practice with `tidy-data.R` and `gapminder-line.R`

### Session 4: Bar Plots & Histograms

- Create bar plots with `geom_bar()` and understand when to use
  `geom_col()`
- Learn the importance of sorting with `fct_infreq()` and `fct_rev()`
- Understand `fill` vs `colour` for 2D shapes
- Use position options (stack, dodge, fill) for grouped bar plots
- Create histograms with `geom_histogram()` and choose appropriate bins
  or binwidth
- Handle overlapping histograms with `alpha` and `position = "identity"`
- Practice with `barplots.R` and `histogram.R`

### Session 5: Polishing Your Plots

- Learn the polishing workflow: save plots to objects, then add labels,
  improve colours, apply themes, and adjust legends
- Add comprehensive labels with `labs()`
- Use colourblind-safe colour palettes: `scale_colour_brewer()`,
  `scale_colour_viridis_d()`, and colorspace palettes
- Apply built-in themes like `theme_minimal()` and extension themes from
  `ggthemes` and `hrbrthemes`
- Control legend position with `theme(legend.position)`
- Save publication-quality plots with `ggsave()`
- Practice with `polish.R`

### Session 6: Advanced Topics & Practice

- Handle overplotting with `geom_jitter()`, controlling width and using
  `alpha` for transparency
- Understand boxplot anatomy and when to use summaries
- Learn why summaries lose detail (DataSaurus revisited)
- Explore alternatives like half-and-half plots with `gghalves` and
  raincloud plots with `ggrain`
- Advanced tricks: adding background data layers to faceted plots, and
  plotting many variables at once with `pivot_longer()` and faceting
- Open practice time and Q&A session
