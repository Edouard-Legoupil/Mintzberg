## ggforce

library(ggforce)
# Adapted from geom_polygon documentation
ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))

values <- data.frame(
  id = ids,
  value = c(3, 3.1, 3.1, 3.2, 3.15, 3.5)
)

positions <- data.frame(
  id = rep(ids, each = 4),
  x = c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5, 1.1, 0.3,
        0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5, 0.6, 1.3),
  y = c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1, 1.7, 1, 1.5,
        2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1, 2.2, 3.3, 3.2)
)

datapoly <- merge(values, positions, by = c("id"))

ggplot(datapoly, aes(x = x, y = y)) +
  geom_shape(aes(fill = value, group = id), expand = unit(-3, 'mm'))


ggplot(datapoly, aes(x = x, y = y)) +
  geom_shape(aes(fill = value, group = id), radius = unit(3, 'mm'))

ggplot(datapoly, aes(x = x, y = y)) +
  geom_shape(aes(fill = value, group = id), expand = unit(3, 'mm'), radius = unit(2, 'mm'), alpha = 0.5)


# Basic usage
ggplot() +
  geom_ellipse(aes(x0 = 0, y0 = 0, a = 10, b = 3, angle = 0)) +
  coord_fixed()

ggplot(datapoly, aes(x = x, y = y)) +
  geom_shape(aes(fill = value, group = id), expand = unit(3, 'mm'), radius = unit(2, 'mm'), alpha = 0.5)+
  geom_ellipse(aes(x0 = 0, y0 = 0, a = 10, b = 3, angle = 0)) +
  coord_fixed()

# Rotation
# Note that it expects radians and rotates the ellipse counter-clockwise
ggplot() +
  geom_ellipse(aes(x0 = 0, y0 = 0, a = 10, b = 3, angle = pi/4)) + ## techno
  geom_ellipse(aes(x0 = 0, y0 = 0, a = 10, b = 3, angle = - pi/4)) + ## support
  coord_fixed()


middle <- data.frame(
  x = c(1, 2, 2, 1),
  y = c(1, 2, 3, 5),
  group = c(1, 1, 1, 1)
)

middle <- data.frame(
  y = c(130, 180, 280, 355),
  x = c(110, 370, 370, 110),
  group = c(1, 1, 1, 1)
)
ggplot(middle) +
  geom_diagonal_wide(aes(x, y, group = group),
                     colour = 'black', fill = 'steelblue',
                     radius = 0.01) +
   coord_flip()

### Mintzberg


ids <- factor(c("operating","apex" ))

values <- data.frame(
  id = ids,
  value = c(3, 3.1)
)


apexoperating <- data.frame(
  id = rep(factor(c("operating","apex" )), each = 4),
  y = c(0, 0, 500, 500,
        155, 155, 330, 330),
  x = c(0, 105, 105, 0,
        370,  415, 415, 370)
)


apexoperating <- data.frame(
  id = rep(factor(c("operating","apex" )), each = 4),
  y = c(0, 0, 500, 500,
        155, 155, 330, 330),
  x = c(0, 105, 105, 0,
        370,  415, 415, 370)
)

#apexoperating <- merge(values, apexoperating, by = c("id"))

middle <- data.frame(
  y = c(130, 180, 280, 355),
  x = c(115, 360, 360, 115),
  group = c(1, 1, 1, 1)
)


ggplot(apexoperating, aes(x = x, y = y)) +
  geom_shape(aes( group = id),
             expand = unit(3, 'mm'),
             radius = unit(2, 'mm'),
             colour = 'black',
             fill = 'steelblue') +
  geom_diagonal_wide(data = middle, aes(x, y, group = group),
                     colour = 'black',
                     fill = 'steelblue',
                     radius = 0.01) +
  geom_ellipse(aes(y0 = 100, x0 = 250, a = 110, b = 45, angle = 0.6),
               colour = 'black',
               fill = 'steelblue') + ## techno
  geom_ellipse(aes(y0 = 380, x0 = 250, a = 110, b = 45, angle = -0.6),
                     colour = 'black',
                     fill = 'steelblue') + ## support
  #coord_fixed() #+
  coord_flip() #+
  #theme_void()

##### Factor the mintzberg

Operating.sizefactor <- 100
Apex.sizefactor <- 70

Operating.centroid <- data.frame( y = 250, x = 100)
Apex.centroid <- data.frame( y = 250, x = 400 )

Operating.sizefactor <- 100
Apex.sizefactor <- 100

