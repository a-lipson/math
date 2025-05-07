#import "@local/tinyset:0.2.1": *

#import "@preview/cetz:0.3.4"

#problem[
  Show that $ integral_(0)^(infinity) (d x) / (sqrt(x)(x^2+1)) = pi / sqrt(2) $
  by integrating over the appropriate branch of the multi-valued function $ f(z)=z^(-1 / 2) / (z^2+1) = e^(-1 / 2 log z) / (z^2+1) $ over
  + the closed contour $gamma$ which bounds the region ${p<abs(z)<R, im z > 0}$, and
  + the closed contour $gamma_(epsilon)$ which bounds the region ${p < |z| < R } without {re z > 0, |im z| < epsilon}$.

]


#proof[(a)][
  Let $I$ be the given integral.
  We wish to show that $I = pi / sqrt(2)$.
  Note that $f$ has poles at $0$ and $plus.minus i$.

  For $gamma$, we will consider the logarithm function branch cut in the negative imaginary axis.

  This yields the following definition of log: $ log z = log |z| + i arg z, " where " arg z in (-pi / 2, (3pi) / 2). $

  Let the pieces of the indented semicircular contour $gamma$ be:
  #footnote[
    i recently switched from LaTeX to a different typesetting language called Typst.
    i am still learning how to format diagrams.
  ]
  // #figure(
  //   cetz.canvas({
  //     import cetz.draw: *
  //   }),
  //   caption: [],
  // )
  - $C_R^+$, for the upper curve with radius $R$;
  - $C_(rho)^+$, for the lower curve with radius $rho$;
  - $L_-$, for the horizontal line on the negative real axis from $rho$ to $R$; and
  - $L_+$, for the horizontal line on the positive real axis from $-R -> -rho$.

  On $L_+$, we find our desired integral, $limits(integral)_(L_+) f -> I$ as $R->oo$.

  On $L_-$, we have that $log(-x) = log(x e^(i pi)) = log x + i pi$, which is a valid argument for our branch cut.
  So,
  $
    limits(integral)_(L_-) f
    = limits(integral)_(L_+) e^(-1 / 2 (log x + i pi) ) / (z^2+1) dd z
    = e^(- i pi / 2) limits(integral)_(L_+) f
    = -i I.
  $

  On $C_(rho)^+$, $ |f| = abs(e^(-1 / 2 (log |z| + i arg z)) / (z^2+1)) = rho^(-1 / 2) / (rho^2+1). $
  So, $ abs(limits(integral)_(C_(rho)^+) f) <= pi rho rho^(-1 / 2) / (rho^2+1) = pi rho^(1 / 2) / (rho^2+1) -> 0, " as " rho -> 0. $

  Similarly, on $C_R^+$, $ abs(limits(integral)_(C_(R)^+) f) <= pi R R^(-1 / 2) / (R^2+1) = pi R^(1 / 2) / (R^2+1) -> 0, " as " R -> oo. $

  In total, since $f$ only have one pole at $i$ inside $gamma$,
  $
    limits(integral.cont)_(gamma) f = limits(integral)_(L_+) f +limits(integral)_(L_-) f + limits(integral)_(C_R^+) f+ limits(integral)_(C_rho^+) f = 2 pi i res(i, f).
  $

  But, the integrals on the curve vanish and we can relate the straight line integrals to our desired integral $I$,
  $
    I - i I = 2 pi i res(i, f).
  $

  Then,
  $
    res(i, f)
    = lim_(z -> i) e^(-1 / 2 log z ) / (z+i)
    = e^(-1 / 2 (log|i| + i arg i)) / (2i)
    = e^(-1 / 2 (i pi / 2)) / (2i)
    = e^(-pi / 4) / (2i)
    = (1-i) / (2 sqrt(2) i).
  $

  Thus,
  $
    I - i I = pi (1 - i) / sqrt(2) implies I = pi / sqrt(2),
  $ which is what we wanted to show.
]

#proof[(b)][
  For $gamma_(epsilon)$, we will consider the logarithm function branch cut in the positive real axis.

  Let the pieces of the keyhole contour $gamma_(epsilon)$ be:
  - $C_R$, for the outer circle of radius $R$ with $epsilon$ height removed from the part on the positive real axis;
  - $C_(epsilon)$, for the inner semicircle circle of radius $epsilon$, facing the negative real axis;
  - $L_+$, for the horizontal line $epsilon$ above the positive real axis from 0 to about $R$; and
  - $L_-$, for the horizontal line $epsilon$ below the positive real axis from about $R$ to zero.

  On $L_+$, since $arg z -> 0$ as $epsilon -> 0$, then $limits(integral)_(L_+) f -> I$ as $epsilon -> 0$.

  On $L_-$, since $arg z -> 2pi$ as $epsilon -> 0$ by the branch cut, then $e^(-1 / 2 (log|z| + 2pi)) / (z^2+1) = e^(-i pi) f = -f$.
  But, $L_-$ is traversed in the opposite direction of $L_+$, therefore we have $limits(integral)_(L_-) f = limits(integral)_(L_+) f = I$ as $epsilon -> 0$.

  The line integrals on $C_R$ and $C_(epsilon)$ will vanish as in part (a) because we have merely doubled the path length with the same limit $R -> oo$ but replacing $epsilon -> 0$ for $rho -> 0$.

  So, with the appropriate limits,
  $
    limits(integral.cont)_(gamma_(epsilon)) f
    = limits(integral)_(L_+) f +limits(integral)_(L_-) f + limits(integral)_(C_R) f+ limits(integral)_(C_(epsilon)) f
    = 2 I
    = 2pi i sum_("poles") res(z_i, f).
  $

  However, now we have both resides at $-i$ and $i$ inside $gamma_(epsilon)$.
  So,
  $
    res(-i, f)
    = lim_(z -> -i) e^(-1 / 2 log z ) / (z-i)
    = e^(-1 / 2 (log abs(-i) + i arg (-i))) / (-2i)
    = e^(-1 / 2 (i (3pi) / 2)) / (-2i)
    = e^(-(3pi) / 4) / (-2i)
    = (-1-i) / (-2 sqrt(2) i)
    = (1+i) / (2sqrt(2) i).
  $

  Thus,
  $
    2I = 2 pi i ((1-i) / (2sqrt(2) i) + (1+i) / (2sqrt(2) i)) = (2pi) / sqrt(2) => I = pi / sqrt(2),
  $ as desired.
]
