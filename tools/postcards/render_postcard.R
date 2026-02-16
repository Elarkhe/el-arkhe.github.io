# tools/postcards/render_postcard.R
# Renderiza la postcard Jolla y publica la salida en assets/ para GitHub Pages

source_rmd <- "tools/postcards/jolla/index.Rmd"
out_html_dir <- "assets/postcards/jolla"

if (!dir.exists(out_html_dir)) dir.create(out_html_dir, recursive = TRUE)

# Render HTML
rmarkdown::render(
  input = source_rmd,
  output_file = "index.html",
  output_dir = out_html_dir,
  quiet = TRUE
)

message("✅ Postcard HTML generada: ", file.path(out_html_dir, "index.html"))

# Exportar a PNG (para incrustar en páginas)
library(webshot2)

webshot(
  url  = "assets/postcards/jolla/index.html",
  file = "assets/img/postcard_talleres_multiomics.png",
  vwidth  = 1400,
  vheight = 1000
)
