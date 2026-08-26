# making sequential colour palettes
library(colorspace)
library(farver)

# see https://colorspace.r-forge.r-project.org/articles/approximations.html
color_space_pink <- "#e94c6f"

pink_hcl <- decode_colour(color_space_pink, to = "hcl")

pink_hcl |> as.list() |> setNames(c("h", "c", "l"))

pink_hcl <- color_space_pink |>
  decode_colour(to = "hcl") |>
  as.list() |>
  setNames(c("h", "c", "l"))

pink_hcls <- sequential_hcl(
  n = 6,
  h = pink_hcl$h,
  c = pink_hcl$c,
  l = pink_hcl$l
)

pink_hcls |> swatchplot()
pink_hcls |> specplot()
pink_hcls |> demoplot()

# hmmmm I want something more like
colorspace::hcl_palettes(plot = TRUE, type = "sequential")

# purples 2 or 3
ppl3 <- colorspace::sequential_hcl(palette = "Purples 3", n = 6)
ppl3 |> swatchplot()
ppl3 |> demoplot()
ppl3 |> specplot()

# let's see how these are different.
specplot(x = ppl3, y = pink_hcls)
# they both have fixes hue
# but they change thir luminance and chroma trajectory
# methods?
# read https://colorspace.r-forge.r-project.org/articles/hcl_palettes.html#construction-details

pink_max_chroma <- colorspace::max_chroma(
  h = pink_hcl$h,
  l = pink_hcl$l
)

new_pink_seq <- colorspace::sequential_hcl(
  n = 6,
  h = pink_hcl$h,
  c = c(pink_hcl$c, pink_max_chroma),
  l = pink_hcl$l
)

new_pink_seq |> swatchplot()
new_pink_seq |> specplot()

# change luminance?
new_pink_seq_l <- colorspace::sequential_hcl(
  n = 6,
  h = pink_hcl$h,
  c = c(pink_hcl$c, pink_max_chroma),
  l = c(pink_hcl$l, 120)
)

new_pink_seq_l |> swatchplot()
new_pink_seq_l |> specplot()
new_pink_seq_l |> demoplot()

# what are the key parameters here?

# what if I just lighten them?

colorspace::lighten(
  col = color_space_pink,
  amount = seq(0, 0.9, length.out = 10)
) |>
  swatchplot()
colorspace::lighten(
  col = color_space_pink,
  amount = seq(0, 0.9, length.out = 10)
) |>
  specplot()
colorspace::lighten(
  col = color_space_pink,
  amount = seq(0, 0.9, length.out = 10),
  fixup = TRUE
) |>
  specplot()
colorspace::lighten(
  col = color_space_pink,
  amount = seq(0, 0.9, length.out = 10)
) |>
  specplot()
