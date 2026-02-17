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


### Polishing

- Polishing workflow
- Using labels with `labs()`
- Colourblind-safe colour palettes
- Themes, and how to extend them
- Legends, position, customisation
- Writing plots to file

### Advanced Topics & Practice

- Handling many data points and overplotting
- Using boxplots
- Understanding trade offs of summaries (Anscombe's Quartet)
- Plots to show distribution and data: half plots, raincloud plots
- Comparing groups by using a light background
- Exploring missing data with {naniar}
- Open practice time and Q&A session


## Packages

```r
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
- [R for Data Science](https://r4ds.had.co.nz/) by Hadley Wickham & Garrett Grolemund
- [Fundamentals of Data Visualization](https://clauswilke.com/dataviz/) by Claus Wilke
- [Data Visualization: A Practical Introduction](https://socviz.co/) by Kieran Healy
- [R Graph Gallery](https://r-graph-gallery.com/)
- [Tidy Data for Reproducibility](https://openscapes.org/blog/2020-10-12-tidy-data/) blog post
