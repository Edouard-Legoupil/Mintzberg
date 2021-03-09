library(ggplot2)
library(cluster)

mirror <- function(poly){
  m <- poly
  m$x <- -m$x
  m
}

poly_br <- data.frame(
  x=c(0, 4, 3, 0),
  y=c(0, 0, 1, 1),
  fill=rep("A", 4)
)


poly_mr <- data.frame(
  x=c(0, 3, 2, 0),
  y=c(1, 1, 2, 2),
  fill=rep("B", 4)
)

poly_tr <- data.frame(
  x=c(0.5, 2, 1, 0.5),
  y=c(2, 2, 3, 3),
  fill=rep("C", 4)
)

poly_tm <- data.frame(
  x=c(-0.5, 0.5, 0.5, -0.5),
  y=c(2, 2, 3, 3),
  fill=rep("D", 4)
)

poly_bl <- mirror(poly_br)
poly_ml <- mirror(poly_mr)
poly_tl <- mirror(poly_tr)


get_ellipse <- function(data, fill){
  edata <- as.matrix(data)
  ehull <- ellipsoidhull(edata)
  phull <- as.data.frame(predict(ehull))
  data.frame(
    x=phull$V1,
    y=phull$y,
    fill=rep(fill, nrow(phull))
  )
}

ellipse <- get_ellipse(
  data.frame(
    x=c(0, 2, 0, -2),
    y=c(3, 3.5, 4, 3.5)
  ), fill="E"
)

text <- data.frame(
  x=c(2, -2, 1.5, -1.5, 1.25, -1.25, 0, 0),
  y=c(0.5, 0.5, 1.5, 1.5, 2.5, 2.5, 2.5, 3.5),
  text=c("br", "bl", "mr", "ml", "tr", "tl", "tm", "ellipse"))


poly <- rbind(poly_br, poly_bl, poly_mr, poly_ml, poly_tr, poly_tm, poly_tl, ellipse)


ggplot() +
  geom_polygon(data=poly, aes(x=x, y=y, fill=fill), colour="black") +
  geom_text(data=text, aes(x=x, y=y, label=text)) +
  theme_void()
