#import "@local/tinyset:0.2.1": *

#problem[
  + Show that for $a>0$ and $xi in RR$,
  $
    1 / pi limits(integral)_(RR) a / (a^2+x^2) e^(-2 pi i x xi) dd x = e^(-2 pi a abs(xi)).
  $
  + Check
  $
    limits(integral)_(RR) e^(-2 pi a abs(xi)) e^(2 pi x xi) dd xi = 1 / pi a / (a^2+x^2).
  $
]

#proof[(a)][
  Let $f(x) = 1 / pi a / (a^2 + x^2)$.
  Let $g(x) = f(x)e^(-2 pi x xi)$.

  // Since $f$ has moderate decay and is holomorphic at poles $plus.minus i a$, then $f in cal(F)_c, a<c$, so we can write $|f(x+i y)| <= C / (1+x^2)$.

  WLOG let $xi > 0$.
  Otherwise, use $x |-> -x$ where $f(x)=f(-x)$ with $xi |-> -xi$ to yield, $ g(x) = f(x)e^(-2 pi i x xi) = f(-x)e^(-2 pi i (-x)(-xi)). $

  Now, we will construct a semicircular contour $gamma$ in the negative imaginary half-plane which picks up a residue from the simple pole of $f$ at $- i a$.

  On the semicircular curve $C_R^-$ of the contour, we have
  $
    abs(limits(integral)_(C_R^-) g(z) dd z) <= limits(integral)_(C_R^-) abs(f(z)) abs(e^(-2 pi i z xi)) dd z.
  $
  Write $z=x-i y$. Since we are in the negative imaginary half-plane $y>0$, then
  $
    abs(e^(-2 pi i (x- i y) xi)) = e^(-2 pi y xi) <= 1,
  $
  with equality when $im z = -y = 0$.

  But, on $abs(z) = R$, we have $f(z)=O(R^(-2))$, which dominates over the length of the integration path , so the integral over $C_R^-$ vanishes as $R -> oo$.

  So, we recover
  $
    limits(integral)_(RR) g(x) dd x = - lim_(R -> infinity) limits(integral)_L g(z) dd z,
  $
  where the negation is obtained because the positively oriented contour traverses the real axis the in the opposing direction.

  Hence we have,
  $
    limits(integral.cont)g dd z
    = - limits(integral)_RR g dd z
    = 2pi i #h(0.25em) res(-i a, d).
  $
  Then,
  $
    res(-i a, g) & = lim_(z -> -i a)(z+i a)1 / pi a / (a^2+x^2)e^(-2pi i z xi) \
                 & = lim_(z -> -i a)1 / pi a / (z - i a)e^(-2 pi i z xi)       \
                 & = 1 / pi a / (-2 i a) e^(-2 pi i (-i a)xi)                  \
                 & = -1 / (2 pi i)e^(-2 pi a xi).                              \
  $

  So,
  $
    -limits(integral)_RR g dd z = -(2 pi i) / (2 pi i)e^(-2 pi a xi) = -e^(-2 pi a xi).
  $

  But, the above holds for both $xi$ and $-xi$, so
  $
    1 / pi limits(integral)_RR a / (a^2+x^2)e^(-2 pi i x xi) dd x = e^(-2 pi a abs(xi)),
  $
  as desired.
]

#proof[(b)][
  We will split the integral into two parts to separate $abs(xi)$,
  $
    integral_(-infinity)^(0) e^(2 pi a xi) e^(2 pi i x xi) dd xi + integral_(0)^(infinity) e^(-2 pi a xi)e^(2 pi i x xi) dd xi.
  $
  For the first integral, let $u=-xi$.
  Then,
  $
    integral_(0)^(infinity) e^(-2 pi u (a+i x)) dd u = 1 / (2pi (a + i x)).
  $
  Similarly, for the second integral,
  $
    integral_(0)^(infinity) e^(-2pi xi (a - i x)) dd xi = 1 / (2pi (a-i x)).
  $
  Recombining the two integrals,
  $
    integral_(-infinity)^(infinity) e^(-2pi a abs(xi))e^(2 pi i x xi) dd xi
    = 1 / (2pi)(1 / (a-i x)+1 / (a +i x))
    = 1 / pi a / (a^2+x^2),
  $
  which is what we wanted to show.
]
