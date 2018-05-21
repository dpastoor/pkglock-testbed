tmppkg <- "scratch"
res__ <- callr::r(function(tmppkg, .pkgdir) {
  setwd(tmppkg)
  packrat::init(options = list(snapshot.fields = c("Imports", "Depends", "Suggests", "LinkingTo")), restart = TRUE)
  install.packages("remotes")
  remotes::install_deps(.pkgdir, dependencies = TRUE, threads = 8)
  pkgs <- c(
    "purrr",
    "covr",
    "dplyr",
    "knitr",
    "rmarkdown",
    "testthat",
    "debugme",
    "fs",
    "mockery",
    "pingr",
    "ggplot2movies",
    "hexbin",
    "Hmisc",
    "mapproj",
    "maptools",
    "multcomp",
    "nlme",
    "nlme",
    "vdiffr",
    "quantreg"
  )
  pkgtext <- sprintf("library(%s)", pkgs)
  writeLines(pkgtext, "packages.R")
  snapshot <- packrat::snapshot(snapshot.sources = TRUE, prompt = FALSE, infer.dependencies = FALSE)
  snapshot
}, show = TRUE,
args = list(tmppkg = tmppkg, 
           .pkgdir = "~/Projects/rvalidation/pkglock-testbed/tmp/runtime_pkg/runtime_pkg"
           ))
