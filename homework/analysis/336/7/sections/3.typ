#import "@local/tinyset:0.2.1": *

#problem[
  We will show results similar to Phragmén-Lindelöf.

  + Suppose $F$ is holomorphic is the right half-plane and extends continuously to the imaginary axis boundary.
    Given the boundary condition $forall y in RR, #h(0.5em) |F(i y)| <= 1$ and the growth condition $|F(z)| <= C exp(c|z|^(gamma))$ for $c,C > 0$ and $gamma > 1$,
    prove $|F(z)| <= 1$ for all $z$ in the right half-plane.

  + Let $S$ be the sector with vertex at the origin, forming an angle of $pi / beta$.
    Suppose $F$ is holomorphic in $S$ and continuous on the boundary, $|F(z)|<= 1$ on $partial S$, and $|F(z)| <= C exp(c|z|^(alpha))$ for all $z$ in $S$, with $c,C > 0$ and $0 < alpha < beta$.
    Prove $forall z in S, #h(0.5em) |F(z)| <= 1$.
]

#proof[(b)][
  Note that we will first prove part (b) as a more general case of part (a).

  We have that $|arg z| < (pi) / (2 beta)$.

  Assume that $beta > 1$, i.e. the sector remains in the right half-plane.
  #footnote[We need $cos(arg z) > 0$ for decay.]

  We will take the principal log branch cut on $RR^-$.

  Consider the function $exp(-epsilon z^beta)$ where $z=re^(i theta)$,
  $
    abs(exp(-epsilon z^beta)) = exp(-epsilon r^beta cos beta theta).
  $

  But, $|beta theta| < (pi) / (2 beta)$, so $|theta| < pi / 2$ and $cos theta > 1$.

  Let $F_(epsilon)(z) = F(z)exp(-epsilon z^beta)$.
  So,
  $
    |F_(epsilon)(z)| <= |F(z)| |exp(-epsilon z^beta)| <= C exp(c|z|^alpha - epsilon z^beta).
  $

  Since $alpha<beta$, then $|F_(epsilon)| -> 0$ as $|z| -> oo$.

  Therefore $ sup_(partial S inter C_R) |F_(epsilon)| -> 0 "as" R -> oo. $

  Consider the compact region $overline(S) inter D_R$, the intersection between the closure of $S$ and the closed disk of radius $R$.

  On $partial S$, since $|F|<= 1$ , then $|F_(epsilon)|<= exp(-epsilon z^beta) <= 1$.

  On the outer arc, with $alpha < beta$ and for sufficiently large $R$, $|F_(epsilon)| <= C exp(c R^alpha - epsilon R^beta) < 1$.

  By MMP, as $R->oo$,
  $
    sup_(overline(S) inter D_R) |F_(epsilon)| <= sup_partial(overline(S) inter D_R) |F_(epsilon)| <= 1.
  $

  Since $F_(epsilon)$ is continuous in $epsilon$, then as $epsilon -> 0$,
  $
    sup_(overline(S) inter D_R) |F_(epsilon)| -> sup_(overline(S) inter D_R) |F| <= 1,
  $
  #w5 to show.
]

#proof[(a)][
  Let $S$ be the right half-plane sector.
  On $S$, we have $arg z in (-pi / 2, pi / 2)$, so we will use the principal log branch.

  For $epsilon > 0$, let $F_(epsilon)(z) = F(z)exp(-epsilon z)$.

  On $S$, the real part of $z$ is be positive.
  So, $|F_(epsilon)| <= C exp(c|z|^(gamma) - epsilon z)$ will vanish as $|z| -> oo$ because $gamma < 1$, and $F_(epsilon)$ is bounded.

  On $partial S$, $|F_(epsilon)| = |F| |e^(-epsilon z)| <= 1$.

  On the outer arc $|F_(epsilon)| <= 1$ from the decay demonstrated above.

  So, as $R -> oo$, we have $|F_(epsilon)| <= 1$ on the boundary $partial(overline(S) inter D_R)$, which bounds $F_(epsilon)$ on the interior by MMP.

  Then, as $epsilon -> 0$, we have that $|F| <= 1$ on $S$, #w5 to show.
]
