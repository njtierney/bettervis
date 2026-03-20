# Making Better Graphs


<!-- README.md is generated from README.qmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

<https://better-vis.njtierney.com>

**Prerequisites**

- Basic R programming experience
- No familiarity with ggplot2 required

**Learning outcomes**

- Apply the grammar of graphics
- Use different geoms and aesthetics
- Choose the right graphic for the right data type
- Use facets to explore subsets
- Apply principles of plot hierarchy and proximity
- Understand the fundamentals of tidy data
- Link tidy data with ggplot2
- Polish graphics for publication with labels, themes, colours, and
  legends
- Save ggplots as high quality images
- Use ggplot2 extensions such as patchwork, marquee, and ggrepel
- Apply techniques to improve clarity (overplotting, faceting,
  highlighting, colour)
- Identify and avoid common pitfalls
- Critique graphics using principles such as data:ink ratio and
  hierarchy

This course goes through not just how to create graphics, but how to
communicate your message effectively.

## Schedule

### Introduction & Scatterplots

- Philosophy and approach to understanding ggplot2
- Anatomy of a ggplot
- Variables and aesthetics (x, y, colour, shape, size)
- Aesthetics inside `aes()` versus outside

### Bar Plots & Histograms

- Using `geom_bar()` vs `geom_col()`
- Sorting: `fct_infreq()` and `fct_rev()`
- Aesthetics: `fill` vs `colour`
- Position in barplots (stack, dodge, fill)
- Histograms, binwidths, bins
- Overlaying multiple histograms

### Faceting & Small Multiples

- Small multiples with `facet_wrap()` and `facet_grid()`
- Single vs multiple variable faceting
- Proximity principle: put comparisons closer together
- Orderings of colour vs facets to change interpretations

### Tidy Data & Line Graphs

- Why Tidy Data matters in ggplot2
- Identifying tidy data
- Reshaping data with `pivot_longer()` and `pivot_wider()`
- Line graphs with `geom_line()` and `group`

### Polishing and Extensions

- Polishing workflow
- Using labels with `labs()`
- Colourblind-safe colour palettes
- Extension themes (such as ggthemes and hrbrthemes)
- How to extend themes
- Legends, position, customisation (patchwork)
- Customise text with marquee
- Writing plots to file

### Advanced Topics & Practice

- Handling many data points and overplotting (gghighlight and ggrepel)
- Using boxplots
- Using animation with gganimate
- Understanding trade offs of summaries (Anscombe’s Quartet)
- Plots to show distribution and data: half plots, raincloud plots
- Comparing groups by using a light background
- Interactive graphics with ggiraph
- Discussion of extension packages at
  https://exts.ggplot2.tidyverse.org/gallery/
- Exploring missing data with {naniar}
- Open practice time and Q&A session

## Packages

``` r
install.packages(c(
  "tidyverse",
  "palmerpenguins",
  "gapminder",
  "colorspace",
  "viridis",
  "gghalves",
  "ggrain",
  "patchwork"
))
```

## Resources

- [ggplot2 book](https://ggplot2-book.org/) by Hadley Wickham
- [R for Data Science](https://r4ds.had.co.nz/) by Hadley Wickham &
  Garrett Grolemund
- [Fundamentals of Data Visualization](https://clauswilke.com/dataviz/)
  by Claus Wilke
- [Data Visualization: A Practical Introduction](https://socviz.co/) by
  Kieran Healy
- [R Graph Gallery](https://r-graph-gallery.com/)
- [Tidy Data for
  Reproducibility](https://openscapes.org/blog/2020-10-12-tidy-data/)
  blog post
