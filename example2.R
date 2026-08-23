pen_short <- penguins |>
  as_tibble() |>
  select(species, year, bill_len, bill_dep) |>
  drop_na() |>
  group_by(species, year) |>
  slice(1) |>
  ungroup()

# variables sitting in the rows instead of forming columns
pen_long_bill <- pen_short |>
  pivot_longer(
    cols = c(bill_len, bill_dep),
    names_to = "bill_variable",
    values_to = "measurement"
  )

pen_long_bill |>
  pivot_wider(
    names_from = bill_variable,
    values_from = measurement
  )

# two values jammed into one cell
pen_two_val <- pen_short |>
  mutate(bill_ratio = paste0(bill_len, "/", bill_dep)) |>
  select(-bill_len, -bill_dep)

# year spread across the column names
pen_year_bill_dep <- pen_short |>
  select(-bill_len) |>
  pivot_wider(names_from = year, values_from = bill_dep)

pen_year_bill_len <- pen_short |>
  select(-bill_dep) |>
  pivot_wider(names_from = year, values_from = bill_len)
# hiscore example

hi_score <- tibble::tribble(
  ~score , ~variable , ~values     ,
   11000 , "game"    , "pacman"    ,
   11000 , "person"  , "James"     ,
    9100 , "game"    , "asteroids" ,
    9100 , "person"  , "James"     ,
   18000 , "game"    , "pacman"    ,
   18000 , "person"  , "Sarida"    ,
    1200 , "game"    , "asteroids" ,
    1200 , "person"  , "Sarida"    ,
)

hi_score |>
  pivot_wider(
    names_from = ,
    values_from =
  )


## ?pivot_wider_spec

us_rent_income
spec1 <- us_rent_income |>
  build_wider_spec(
    names_from = variable,
    values_from = c(estimate, moe)
  )

spec1

us_rent_income |>
  pivot_wider_spec(spec1)

# Is equivalent to
us_rent_income |>
  pivot_wider(
    names_from = variable,
    values_from = c(estimate, moe)
  )


library(janitor)

pen_year_janitored <- pen_year_bill_dep |> clean_names()

pen_year_bill_dep |>
  pivot_longer(
    cols = c(`2007`, `2008`, `2009`),
    names_to = "year",
    values_to = "bill_dep"
  )

pen_year_bill_dep |>
  pivot_longer(
    cols = -species,
    names_to = "year",
    values_to = "bill_dep"
  )

pen_year_bill_dep |>
  select(
    stars_with()
  )

# tidyselect helper
# starts_with, ends_with, contains(), etc
# see ?
pen_year_bill_dep |>
  pivot_longer(
    cols = -species,
    names_to = "year",
    values_to = "bill_dep"
  )

pen_year_janitored$x2009


relig_tidy <- relig_income |>
  pivot_longer(
    cols = -religion,
    names_to = "income_bracket",
    values_to = "number_respondees"
  )

relig_tidy |>
  mutate(
    income_fct = factor(
      income_bracket
    )
  ) |>
  pull(income_fct) |>
  levels()

relig_tidy |>
  mutate(
    income_fct = factor(
      income_bracket
    ),
    income_fct = fct_relevel(income_fct, )
  )

ggplot(relig_tidy, aes(x))
