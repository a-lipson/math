#import "@local/tinyset:0.2.1": *

#problem[
  Let $G : DD -> HH$ be the inverse Cayley map defined by $G(w) = i (1-w) / (1+w)$.
  Find the image of the following curves under $G$:
  + Circles centered at the origin, and
  + Straight line segments through the origin.
  Sketch the original curves in $DD$ on one diagram, and the image curves in $HH$ on another.
]

Consider $z = r e^(i theta)$

(a) Here we fix the magnitude $r$ and vary $theta$.
We will obtain circles with the equation
$
  x^2 + (y- (1+r^2) / (1-r^2))^2 = ((2r) / (1-r^2))^2,
$
which start centered at $(0,1) = i$ near $r = 0$, and expand to have infinite radius as $r -> 1$ and become tangent to the real axis at the origin.

(b) Here we fix the argument $theta$ and vary $r$.
We will obtain circles with the equation
$
  (x - 1 / 2 (tan theta / 2 - cot theta / 2))^2 + y^2 = (1 / 2 (tan theta / 2 + cot theta / 2))^2,
$
which intersect the points $(0, plus.minus 1) = plus.minus i$, and expand to infinite radius as $theta -> 0, pi$.
At $theta = pi / 2$, the circle is centered at the origin with radius 1.

#figure(
  image("figures/sketch.png"),
  caption: [Sketch of curves in $DD$ and $HH$; (a) is blue and (b) is green.],
)
