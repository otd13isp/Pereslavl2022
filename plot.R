library(plumber)
library(ggplot2)
library(png)

#' @filter cors
cors <- function(req, res) {
res$setHeader("Access-Control-Allow-Origin", "*")
  if (req$REQUEST_METHOD == "OPTIONS") {
  res$setHeader("Access-Control-Allow-Methods", "*")
  res$setHeader("Access-Control-Allow-Headers", "*")
  res$status <- 200
  return(list())
  } else {
  plumber::forward()
  }
}

#* @post /plotly
#* @serializer png list(width = 800, height = 400)
plotly <- function(a, b) {
b = ggplot2::qplot(mpg, wt, data = mtcars, colour = cyl)
print(b)
}
