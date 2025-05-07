#import "@local/tinyset:0.2.1": *

#problem[
  Find $ integral_(0)^(2 pi) (cos^2 3 theta) / (5-4 cos 2 theta) dd theta. $
]

#proof[
  Let $t = 2 theta$.
  Then, with the period of cosine, we have,
  $
    integral_(0)^(2 pi) (cos^2 3 theta) / (5-4 cos 2 theta) dd theta
    &= 1 / 2 integral_(0)^(4 pi) (cos^2(3 / 2 t)) / (5 - 4 cos t) dd t \
    &= integral_(0)^(2 pi) (cos^2 (3 / 2 t)) / (5 - 4 cos t) dd t \
    &= 1 / 2 integral_(0)^(2 pi) (1 + cos 3 t) / (5 - 4 cos t) dd t \
    &= 1 / 2 limits(integral.cont)_(partial DD) (1 + (z^3+z^(-3)) / 2) / (5-4 (z+z^(-1)) / 2) (dd z) / (i z) \
    &= 1 / (4i) limits(integral.cont)_(partial DD) (z^3+2+z^(-3)) / (-2z^2+5z-2) dd z \
    &= -1 / (8i) limits(integral.cont)_(partial DD) (z^6+2z^3+1) / (z^3(z-2)(z-1 / 2)) dd z \
    &= -1 / (8i) limits(integral.cont)_(partial DD) ((z^3+2) / ((z-2)(z-1 / 2)) + 1 / (z^3(z-2)(z-1 / 2))) dd z. \
  $
  Call the functions in the sum $g$ and $h$ respectively, left to right.
  We must consider the residues of $g$ and $h$ inside the unit disk.
  We see that $g$ has a simple pole at $1 / 2$, and $h$ has a third order pole at $0$ and a simple pole at $1 / 2$.

  First, we have that
  $
    res(1 / 2, g) = lim_(z -> 1 / 2) (z^3+2) / (z-2) = (1 / 8+2) / (-3 / 2) = (17 / 8) / (-3 / 2) = -17 / 12.
  $

  Next, by partial fractions, we have $ 1 / ((z-2)(z-1 / 2)) = 2 / 3 (1 / (z-2)-1 / (z-1 / 2)). $

  So, for the third order pole at zero of $h$,
  $
    res(0, h)&=lim_(z -> 0) 1 / 2! (d^2) / (d z^2) 2 / 3 (1 / (z-2)-1 / (z-1 / 2)) \
    &= 1 / 3 lim_(z -> 0) (2 / (z-3)^3 - 2 / (z-1 / 2)^3) \
    &= 2 / 3 (-1 / 8-1 / (-1 / 8))\
    &= 2 / 3(8-1 / 8) \
    &= 21 / 4. \
  $

  Then, for the simple pole at $1 / 2$,
  $
    res(1 / 2, h) = lim_(z -> 1 / 2) 1 / (z^3(z-2)) = 1 / (1 / 8 (-3 / 2)) = -16 / 3.
  $

  Thus, we have
  $
    integral_(0)^(2 pi) (cos^2 3 theta) / (5-4 cos 2 theta) dd theta
    &=- 1 / (8i) limits(integral.cont)_(partial DD) ((z^3+2) / ((z-2)(z-1 / 2)) + 1 / (z^3(z-2)(z-1 / 2))) dd z \
    &= - (2 pi i) / (8 i) (res(0, g) + res(0, h) + res(1 / 2, h)) \
    &= - pi / (4) ( 21 / 4 - 16 / 3 - 17 / 12) \
    &= - pi / 4 (- 3 / 2) \
    &= (3 pi) / 8. \
  $
]
