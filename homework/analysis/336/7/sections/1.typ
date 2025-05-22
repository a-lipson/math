#import "@local/tinyset:0.2.1": *

#problem[
  Poisson summation formula.
  + Fix $tau$ with $im tau > 0$.
    Apply Poisson summation formula to
    #grid(
      //center content in bullets
      columns: 1fr,
      $ f(z) = (tau + z)^(-k) $
    )
    for $2 <= k in NN$ to obtain
    $
      sum_(n in ZZ) 1 / (tau + n)^k = (-2 pi i)^k / (k-1)! sum_(m=1)^(infinity) m^(k-1) e^(2 pi i m tau).
    $

  + Set $k=2$ in the above identity and use $im tau > 0$ to show $ sum_(n in ZZ) 1 / (tau + n)^2 = pi^2 / (sin^2(pi tau)). $

  + Can we conclude the above identity holds when $tau$ is any complex number and not just an integer?
]

#proof[(a)][
  Using residues, we will show that when $xi < 0$, we have $hat(f)(xi) = 0$, and for $xi > 0$, we have $ hat(f)(xi) = (-2 pi i)^k / (k-1)! xi^(k-1) e^(2 pi i xi tau). $

  Since $im tau > 0$ and $f$ has a pole of order $k$ at $z = -tau$, then this pole is not on the real axis, and $f$ is holomorphic in some strip of width $a< tau$.

  Since $f$ satisfies sufficient decay conditions for $k >= 2$, and is holomorphic within a strip, then we can apply the Fourier transform.
  So, $forall x in RR$,
  $
    hat(f)(xi) = limits(integral)_RR f(x)e^(-2 pi i x xi) dd x
  $

  Let
  $
    g(z) = f(z)e^(-2 pi i z xi) = e^(2 pi i z xi) / (tau + z)^k.
  $

  Since $e^(-2 pi i z xi)$ is holomorphic, then $g$ also has only a pole of order $k$ at $z = - tau$.

  Since $im tau > 0$, then $im (- tau) < 0$, so the pole of $g$ pole is the lower half-plane.

  We will consider the three cases where $xi < 0$, $xi = 0$, and $xi > 0$.

  For $xi < 0$, the exponential term decays in the upper half-plane, so a semicircular contour there will enclose no poles, contributing no residues to the integral $integral.cont g d z$, thus $hat(f)(xi) = 0$ for $xi < 0$.

  For $xi = 0$, $ limits(integral)_RR (d x) / (tau + x)^k $, since the integrand decays at sufficient magnitude of $z$, then can use the upper semicircular contour, again with no residues, or the lower semicircular contour, where the residue will vanish.
  So, the integral vanishes when $xi = 0$.

  For $xi > 0$, the exponential term will vanish in the lower half-plane, so we will construct a semicircular contour there, picking up the residue from the pole at $z = -tau$.
  Note that the positively oriented contour traverses the real axis in the opposite direction, so we pick up a negative sign.
  So, we have
  $
    - hat(f)(xi) = limits(integral)_RR g(x) dd x = 2 pi i res(-tau, g(z)).
  $

  For the residue, we have
  $
    res(-tau, g(z))
    &= lim_(z -> -tau) 1 / (k-1)! (d / (d x))^(k-1) e^(-2 pi i z xi) \
    &= lim_(z -> -tau) (- 2 pi i xi)^(k-1) / (k-1)! e^(-2 pi i z xi) \
    &= (-2 pi i)^(k-1) / (k-1)! xi^(k-1) e^(2 pi i tau xi). \
  $

  Therefore, $forall xi > 0$,
  $
    hat(f)(xi) = (-2 pi i)^k / (k-1)! xi^(k-1) e^(2 pi i tau xi),
  $
  and $hat(f)(xi)$ vanishes otherwise.

  Now, with the Poisson summation formula, we have
  $
    sum_(n in ZZ) 1 / (tau + n)^k =
    sum_(n in ZZ) f(n) =
    sum_(n in ZZ) hat(f)(n).
  $

  Since $forall xi <= 0, #h(0.5em) hat(f)(xi) = 0$, then the above becomes
  $
    sum_(n in ZZ) 1 / (tau + n)^k =
    (-2 pi i)^k / (k-1)! sum_(n in ZZ^+) n^(k-1) e^(2 pi i n tau),
  $
  as desired.
]

#proof[(b)][
  For $k = 2$, we have
  $
    sum_(n in ZZ) 1 / (tau + n)^2 =
    (-2 pi i)^2 / (2-1)! sum_(n in ZZ^+) n^(2-1) e^(2pi i n tau)=
    -4pi^2 sum_(n in ZZ^+) n e^(2 pi i n tau).
  $

  Note that
  $
    sum_(n in ZZ_(>= 0)) z^n = 1 / (1-z) ==> sum_(n in ZZ^+) n z^n = z / (1-z)^2.
  $

  Let $w = e^(pi i tau)$,
  $
    sin pi t = (e^(pi i tau) - e^(-pi i tau)) / (2 i) = (w - w^(-1)) / (2i).
  $

  Let $w^2 = z = e^(2 pi i tau)$,
  $
    sin^2 pi t = -1 / 4(w - w^(-1))^2 = -1 / 4 (w^2 - 2 + w^(-2)) = -(z^2-2z+1) / (4z) = -(z-1)^2 / (4z).
  $

  Therefore we have $sum_(n in ZZ^+) n z^n = -1 / (4 sin^2 pi tau)$, which implies
  $
    sum_(n in ZZ) 1 / (tau + n)^2 = -4pi^2 sum_(n in ZZ^+) n e^(2 pi i n tau) = pi^2 / (sin^2 pi tau),
  $
  #w5 to show.
]

#proof[(c)][
  Both functions in the identity of part (b) are meromorphic functions of $tau$ which agree on the open half-plane and have identical poles at integer values.

  We will show that the principle part of both functions matches at the poles.

  The principle part of the series near integer $tau$ poles is 1.

  We will take the Taylor expansion of $pi^2 / (sin^2 pi tau)$ near for $tau$ near integers $m$,
  $
    sin pi tau = sin(pi m + pi (tau - m)) approx pi (tau - m)
  $
  where the approximation holds by the Fundamental Theorem of Engineering.

  Therefore we have $sin^2 pi tau -> pi^2 (tau - m)^2$ near integers $m$, so $pi^2 / (sin^2 pi tau) -> 1 / (tau - m)^2$ there as well, which has principle part 1 as well.

  Since the principle parts agree near poles, then we have matching analytic continuations both functions on all $tau in CC$.

  Thus, the identity holds for all complex $tau$.
]
