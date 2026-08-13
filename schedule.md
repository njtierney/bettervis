# Schedule

## Anatomy of a ggplot

**`aes()`, geoms, layers**

- Taking a finished plot apart
- The seven pieces of the grammar
- Building a plot up from nothing
- Variables and aesthetics (x, y, colour, shape, size)
- Aesthetics inside `aes()` versus outside
- Adding layers

## The shape of your data

**tidy data, `pivot_longer()`, `separate_\*()`**

- What shape ggplot2 expects
- Reshaping with `pivot_longer()` and `pivot_wider()`
- Line graphs, `group`, and why they come out as a scribble
- Missing values, and the rows ggplot2 quietly drops, with {naniar}

## What gets computed

**`geom_bar()` vs `geom_col()`, binwidths, scales, coords**

- Geoms that count for you: `geom_bar()` versus `geom_col()`
- Geoms that bin for you: histograms, binwidths, bins
- Overlaying distributions
- Scales, log scales, and coords

## What am I comparing?

**`facet_wrap()`, `facet_grid()`, position adjustments**

- Why a plot can hold all your data and answer nothing
- Small multiples with `facet_wrap()` and `facet_grid()`
- Proximity: what is adjacent is what gets compared
- Swapping colour for facets, and what that changes
- Position in bar plots (stack, dodge, fill)
- Free scales, and what they cost

## What's in the way?

**data:ink, `alpha`, `geom_hex()`, gghighlight, raincloud plots**

- The data:ink ratio, and how far to take it
- Overplotting: `alpha`, jittering, `geom_hex()`
- Highlighting with gghighlight and labelling with ggrepel
- What summaries hide: Anscombe's quartet
- Boxplots, and when they mislead
- Showing distribution and data together: half plots, raincloud plots

## Where should the eye go?

**`fct_reorder()`, colour palettes, colourblind safety**

- Visual hierarchy, and what a reader looks at first
- Ordering with `fct_reorder()`, `fct_infreq()`, and `fct_rev()`
- Matching the palette to the variable: qualitative, sequential, diverging
- Colourblind-safe colour, with colorspace and viridis
- Aesthetics: `fill` versus `colour`
- Emphasis by contrast, and direct labelling instead of legends

## Making it land

**`labs()`, themes, patchwork, `ggsave()`**

- When to start polishing
- Labels with `labs()`, and titles that state the finding
- Alt text with `labs(alt = )`
- Customising text with marquee
- Themes, extending them, and writing your own
- Extension themes such as ggthemes and hrbrthemes
- Combining plots with patchwork
- Writing plots to file with `ggsave()`
- Critique: good questions to ask of your plot
- Open practice and Q&A

## Appendices

- Just enough dplyr
- Interactive graphics: gganimate and ggiraph

# Packages

```r
install.packages(c(
  "tidyverse",
  "naniar",
  "colorspace",
  "viridis",
  "hexbin",
  "gghighlight",
  "ggrepel",
  "ggrain",
  "patchwork",
  "marquee",
  "ggthemes",
  "hrbrthemes",
  "DAAG",
  "gapminder",
  "ozbabynames",
  "tsibbledata"
))
```

Optional, for the appendix:

```r
install.packages(c("gganimate", "ggiraph"))
```

# Resources

- [ggplot2 book](https://ggplot2-book.org/) by Hadley Wickham
- [R for Data Science](https://r4ds.hadley.nz/) by Hadley Wickham, Mine Çetinkaya-Rundel and Garrett Grolemund
- [Fundamentals of Data Visualization](https://clauswilke.com/dataviz/) by Claus Wilke
- [Data Visualization: A Practical Introduction](https://socviz.co/) by Kieran Healy
- [R Graph Gallery](https://r-graph-gallery.com/)
- [ggplot2 extension gallery](https://exts.ggplot2.tidyverse.org/gallery/)
- [Tidy Data for Reproducibility](https://openscapes.org/blog/2020-10-12-tidy-data/) blog post
