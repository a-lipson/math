#import "@local/tinyset:0.2.1": *

#problem[
  Suppose $hat(f)$ has compact support in $[-M,M]$ and $f(z)=sum_(n in NN) a_n z^n$.
  + Show
    #grid(
      columns: 1fr,
      $
        a_n = (2 pi i)^n / n! integral_(-M)^M hat(f)(xi)xi^n dd xi.
      $
    )

  + Show
    $
      limsup_(n -> oo) (n! |a_n|)^(1 / n) <= 2 pi M.
    $

  + In the converse direction, show that if $f$ is analytic with the limit supremum condition, then $f$ is entire and
  $
    forall epsilon > 0, #h(0.25em) exists A_(epsilon) > 0 #h(0.25em) : #h(0.25em) |f(z)| <= A_(epsilon) e^(2 pi (M+epsilon)|z|).
  $
]

#proof[(a)][
  Since $f$ has compact support, then $f$ and $hat(f)$ have moderate decay.

  Since $f$ is entire, then $f in cal(F)_a$, so Fourier inversion holds.

  Therefore, by the compact support of $hat(f)$
  $
    f(z) = limits(integral)_RR hat(f)(xi) e^(2pi i z xi) dd xi
    = integral_(-M)^M hat(f)(xi) e^(2pi i z xi) dd xi.
  $

  By the Cauchy integral formula for series coefficients,
  $
    a_n = 1 / (2pi i)limits(integral)_C f(z) / (z^(n+1)) dd z.
  $

  Since $f$ is entire, then the integrand has a pole of order $n+1$ at $z=0$.

  Using residues,
  $
    a_n &= lim_(z -> 0) 1 / n! (d / (d z))^n f(z) \
    &= lim_(z -> 0) 1 / n! (d / (d z))^n integral_(-M)^M hat(f)(xi) e^(2pi i z xi) dd xi \
    &= integral_(-M)^M 1 / n! hat(f)(xi) lim_(z -> 0) (d / (d z))^n e^(2pi i z xi) dd xi \
    &= integral_(-M)^M lim_(z -> 0) 1 / n! hat(f)(xi) (2pi i xi)^n e^(2pi i z xi) dd xi \
    &= (2pi i)^n / n! integral_(-M)^M hat(f)(xi) xi^n dd xi, \
  $
  where the interchange of limit processes is justified by the finite integral and continuity of the integrand in both $xi$ and $z$.

  Note that we can also arrive at this conclusion much faster by using the series expansion of $e^(2pi i z xi)$ inside the Fourier inversion integral for $f$.
]

#proof[(b)][
  With $|xi| <= M$ by the bounds of the integral and $hat(f)(xi)$ bounded by some constant $C$ from compact support, we have
  $
    n!|a_n| & = (2pi)^n abs(integral_(-M)^M hat(f)(xi)xi^n dd xi)     \
            & <= (2pi)^n integral_(-M)^M abs(hat(f)(xi)) |xi|^n dd xi \
            & <= (2pi)^n M^n integral_(-M)^M abs(hat(f)(xi)) dd xi    \
            & <= C(2pi M)^n.                                          \
  $

  So,
  $
    limsup_(n -> oo)(n! |a_n|)^(1\/n) <= limsup_(n -> oo) C^(1\/n) 2 pi M = 2 pi M.
  $
]

#proof[(c)][
  For all $epsilon > 0$, there exists an $N_(epsilon)$ such that for all $n > N_(epsilon)$, we have
  $
    (n! |a_n|)^(1\/n) < 2pi (M + epsilon) ==> |a_n| < (2pi (M + epsilon))^n / n!.
  $

  We can split the series of $f$ at $N_(epsilon)$,
  $
    |f(z)| <= sum_(n=0)^(N_(epsilon)) |a_n| |z|^n + sum_(n=N_(epsilon)+1)^(infinity) |a_n| |z|^n.
  $

  The first sum is bounded by $C_1 |z|^(N_(epsilon))$.

  For second sum with $n > N_(epsilon)$, we have the bound
  $
    sum_(n=N_(epsilon)+1)^(infinity) (2pi (M + epsilon))^n / n!,
  $
  which is part of the series expansion for the exponential function, hence we also have the bound
  $C_2 e^(2pi (M+epsilon)|z|)$.

  Combining the bounds,
  $
    |f(z)| < C_1|z|^(N_(epsilon)) + C_2 e^(2pi (M+epsilon)|z|).
  $

  Since exponential functions grow faster than polynomials, then, for some $A_(epsilon)$, we have
  $
    |f(z)| <= A_(epsilon)e^(2pi (M+epsilon)|z|),
  $
  #w5 to show.
]
