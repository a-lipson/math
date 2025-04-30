#import "@local/tinyset:0.2.1": *

#problem[
  Suppose $f$ and $g$ are holomorphic in a region containing the closed unit disk $overline(DD)$.
  Suppose $f$ has a simple zero at $z=0$, and vanishes nowhere else in the $overline(DD)$.
  Let $ f_(epsilon) (z) = f(z)+ epsilon g(z). $

  Show that for $epsilon$ sufficiently small, then

  + $f_(epsilon)(z)$ has a unique zero $z_(epsilon)$ in $D$, and
  + the map $epsilon mapsto z_(epsilon)$ is continuous.
]

#proof[(a)][
  Since $f$ and $g$ are holomorphic on the $overline(DD)$, which is compact, then they are continuous and bounded there as well.

  Since $|f| > 0$ on the $diff DD$, then, for all $z$ on the $diff DD$ there exists an $epsilon$ such that $|f(z)| > epsilon|g(z)| >= 0$.
  So, by Rouché, $f$ and $f_(epsilon) = f + epsilon g$ have the same number of zeros in $DD$.

  Since $f$ has one zero in $DD$, then so does $f_(epsilon)$, call it $z_(epsilon)$.
]

#proof[(b)][
  Consider the argument principle for $f_(epsilon)$, which has one zero and no poles in $DD$,
  $
    1 = 1 / (2 pi i) limits(integral.cont)_(diff DD) (f'_(epsilon)(z)) / (f_(epsilon)(z)) dd z.
  $

  Since $f$ has a single simple zero inside $DD$, then, counting the multiplicity of 1, $f_(epsilon)$ must have a simple pole at $z_(epsilon)$.
  So, we can write $f_(epsilon)(z) = (z-z_(epsilon))p(z)$ for some holomorphic function $p$ nonvanishing on $D$.

  Consider the following function,
  $
    z (f'_(epsilon)(z)) / (f_(epsilon)(z)) = z (p(z) + (z-z_(epsilon))p'(z)) / ((z-z_(epsilon)p(z))) = z / (z-z_(epsilon)) + z (p'(z)) / (p(z))
  $

  Now, if we take the contour integral on the unit circle $diff DD$ of the above, then the left hand term will yield $2 pi i z_(epsilon)$ by the residue theorem.

  But, since $p(z)$ was nonvanishing in the unit disk $overline(DD)$, then the integrand is holomorphic, and so the contour integral will vanish.

  Therefore, we have that
  $
    z_(epsilon) = 1 / (2 pi i) limits(integral.cont)_(diff DD) (z f'_(epsilon)(z)) / (f_(epsilon)(z)) dd z.
  $
  Since $f_(epsilon)$ is nonvanishing on the unit circle, holomorphic, and continuous in $epsilon$, then the integrand is continuous in $epsilon$.
  Hence $z_(epsilon)$ is continuous in $epsilon$ as well.
]
