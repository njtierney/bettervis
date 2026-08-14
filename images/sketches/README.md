# Sketches

Hand-drawn sketches, made on the reMarkable and exported as PNG.

Every file in here is currently a generated placeholder. Overwrite it with the
real export, keeping the filename, and the chapter picks it up on the next
render.

## Naming

`sketch-<what-it-is>.png`, lowercase, hyphens. The name matches the Quarto
cross-reference id in the chapter, so `sketch-scatter.png` is `@fig-sketch-scatter`.

| file | chapter | what it shows |
| --- | --- | --- |
| `sketch-scatter.png` | `anatomy-of-a-ggplot.qmd` | Six rows of `oceanbuoys` sketched as a scatterplot. Two labelled axes, six dots in two loose groups. |
| `sketch-histogram.png` | `anatomy-of-a-ggplot.qmd` | Eight humidity readings sketched as a histogram. Bars form one hump, and the axis only runs 75 to 80. |

## Exporting

The reMarkable exports portrait at the full page size. Crop to roughly 4:3
landscape around the drawing before saving, otherwise the sketch sits in a
column of white space and renders tiny in the book column.

Aim for around 1200px wide. These are line drawings, so they stay legible well
below the export resolution and the book does not need the file size.

## If you change a sketch

The `fig-alt` text in the chapter describes what is actually drawn, down to the
axis ranges. If a redrawn sketch says something different, update the alt text
with it.
