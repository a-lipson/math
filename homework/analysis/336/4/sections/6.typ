#import "@local/tinyset:0.2.1": *

#problem[
  Let $f: hat(CC) -> hat(CC)$ be a continuous map where $hat(CC)$ is the Reimann sphere.

  We say that $f$ is holomorphic at $a$ if either:
  - $a != oo, f(a) != oo$, and $f$ is holomorphic at $a$ in the usual sense;
  - $a != oo, f(a) = oo$, and $z mapsto 1 \/ (f(z))$ is holomorphic at $a$;
  - $a = oo, f(a) != oo$, and $z mapsto f(1\/z)$ is holomorphic at 0;
  - $a = oo, f(a) = oo$, and $z mapsto 1\/f(1\/z)$ is holomorphic at 0.

  We say that $f$ is biholomorphic if it is holomorphic and has a holomorphic inverse.

  + Check that nonconstant holomorphic functions $hat(CC)->hat(CC)$ may be identified with nonconstant meromorphic functions $hat(CC)->CC$ and are hence rational functions.

  + Prove that any biholomorphic map $f:hat(CC)->hat(CC)$ has the form $f(z)= (a z+b) / (c z + d)$ where $a,b,c,d in CC$, with $a d - b c != 0$.
]


#proof[(a)][
  Let $f$ be a nonconstant holomorphic function $hat(CC) to hat(CC)$.

  We will proceed by cases.

  If $f(oo) != oo$, then, if $f$ holomorphic is in the usual sense, then it is also meromorphic.
  If instead we have that $f(1\/z)$ is holomorphic at zero, then it has a finite analytic expansion in $1\/z$ which yields a finite number of poles; hence $f(1\/z)$ is meromorphic.

  If $f(oo) = oo$, then, if $f$ is a meromorphic function, then $1\/f(z)$ is also meromorphic.
  Lastly, if $1 \/ f(1 \/ z)$ is holomorphic at $0$, consider $g(z) = 1 / f(z)$.
  By the first case, $g$ is meromorphic, so the inverse of $f = 1 / g$ is also meromorphic.
]

#proof[(b)][
  Since $f$ is holomorphic on $hat(CC)$, then, by part (a), $f$ is rational.

  Since $f$ is biholomorphic, then $f$ is bijective and $f^(-1)$ is holomorphic on $hat(CC)$ and hence rational as well.

  We have that a poly in $CC$ is injective iff it is linear, hence $f$ and $f^(-1)$ must be a ratio of linear polynomials.
  So we have that $f(z) = (a z + b) / (c z + d)$.

  But, $f$ is nonconstant, so the numerator $a z + b$ must not be proportional to the denominator $c z + d$.

  Suppose, for a contradiction, that $a z + b = lambda (c z + d)$. Then we would have $vec(a, b) = lambda vec(c, d)$, meaning that the vectors of coefficients are linearly dependent. This gives us
  $
    det mat(delim: "(", a, b; c, d) = 0 implies a d - b c = 0.
  $
  Thus, we must have $a d - b c != 0$ for $f$ nonconstant.

  We will now verify that $f$ is invertible and $f^(-1)$ is holomorphic on $hat(CC)$.

  Consider,
  $
    w &= (a z + b) / (c z + d) \
    c w z + d w &= a z + b \
    (c w - a) z &= b - d w \
    z &= (b-d w) / (c w - a) \
    &= (d w - b) / (-c w + a), \
  $ which implies that $f^(-1)(z) = (d z - b) / (-c z + a)$.

  Then, we have that $d a - (-b)(-c) != 0$, so $f^(-1)$ is nonconstant and rational, and hence holomorphic on $hat(CC)$.

  Thus, all biholomorphic functions $f$ take the form $(a z + b) / (c z + d)$ where $a d - b c != 0$.
]
