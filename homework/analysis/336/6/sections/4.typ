#import "@local/tinyset:0.2.1": *

#problem[
  Solve the differential equation
  $
    sum_(j=0)^(n) a_j (d / (d t))^j u(t) = f(t),
  $
  where $a_k in CC$ and $f in C^2$ has bounded support.

  + Let
  $
    hat(f)(z) = limits(integral)_RR f(t) e^(-2 pi i z t) dd t.
  $
  Note that $hat(f)$ is entire.
  Show using IBP that, for fixed $0 <= a$, if $|y| <= a$, then
  $
    abs(hat(f)(x + i y)) <= A / (1 + x^2).
  $

  + Write
  $
    P(z) = sum_(j=0)^(n) a_j (2pi i z)^j.
  $
  Find $c in RR$ such that $P$ does not vanish on the line
  $
    L = {z | z = x + i c, x in RR}.
  $

  + Set
  $
    u(t) = limits(integral)_L e^(2 pi i x z) / P(z) hat(f)(z) dd z.
  $
  Check that
  $
    sum_(j=0)^(n) a_j (d / (d t))^j u(t) = limits(integral)_L e^(2 pi i z t)hat(f)(z)dd z
  $
  and
  $
    integral_L e^(2 pi i z t)hat(f)(z)dd z = limits(integral)_RR e^(2 pi i x t) hat(f)(x) dd x.
  $
  Conclude by the Fourier inversion theorem that
  $
    sum_(j=0)^(n) a_j (d / (d t))^j u(t) = f(t).
  $
  Note that the solution $u$ depends on the choice of $c$.
]

#proof[(a)][
  Since $f$ has bounded support, say on $[-M,M]$, then for all $|t| > M$, $f(t)=0$ and $f'(t)=0$.

  So,
  $
    limits(integral)_RR f(t) e^(-2 pi i z t) dd t = integral_(-M)^M f(t) e^(-2 pi i z t) dd t.
  $

  Since $f in C^2$, then we can perform IBP twice.
  First, we have
  $
    limits(integral)_([-M,M]) f(t) e^(-2 pi i z t) dd t = lr(f(t)e^(-2 pi i z t) / (-2 pi i z)|)_(-M)^M - integral_(-M)^M e^(-2 pi i z t) / (-2 pi i z) f'(t) dd t,
  $
  but the first term vanishes by the bounded support of $f$.
  Second, we have
  $
    integral_(-M)^M e^(2 pi i z t) / (-2 pi i z) f'(t) dd t = lr(f'(t)e^(-2 pi i z t) / (4 pi^2 z^2) |)_(-M)^M - 1 / (4pi^2 z^2)integral_(-M)^M e^(-2 pi i z t) f''(t) dd t,
  $
  but the first term vanishes by the bounded support of $f$ for $f'$.

  So, we have that
  $
    abs(hat(f)(x+i y))
    = abs(1 / (4pi^2 (x+i y)^2)) integral_(-M)^M abs(e^(-2pi i (x + i y) t)) abs(f''(t)) dd t
    <= 1 / (4pi^2) 1 / (x^2+y^2) 2 M B e^(2pi a M)
  $
  where $f in C^2$ implies that $f''$ is continuous and bounded by some $B$ on $[-M,M]$ by EVT.

  Hence, exchanging constants and using $abs(y) <= a$, we have
  $
    abs(hat(f)(x+i y)) <= A / (1+x^2),
  $
  as desired.
]

#proof[(b)][
  Since $P$ is a polynomial of degree $n$, then it has $n$ roots by FTA.
  Let these roots be $z_j = x_j + i y_j$.

  Then, we can choose any $c != y_i$ for any $j$.
  In particular, let $abs(c) > limits(max)_(1 <= j <= n) abs(y_j)$.

  Thus, $P(x+i c)$ will not vanish for all $x$ in $RR$.
]

#proof[(c)][
  We will first find the derivatives of $u$,
  $
    (d / (d t))^j u(t)
    &= (d / (d t))^j limits(integral)_L e^(2 pi i z t) / P(z) hat(f)(z)dd z \
    &= limits(integral)_L (d / (d t))^j e^(2 pi i z t) / P(z)hat(f)(z)dd z \
    &= limits(integral)_L (2 pi i z)^j e^(2 pi i z t) / P(z)hat(f)(z)dd z, \
  $
  where the interchange of the derivative and the integral is justified with Leibniz rule given that the path $L$ does not depend on $t$, and the integrand has continuous partials in both $t$ and $z$.

  So,
  $
    sum_(j=0)^(n) a_j (d / (d t))^j u(t)
    &= sum_(j=0)^(n) a_j limits(integral)_L (2pi i z)^j e^(2 pi i z t) / P(z) hat(f)(z)dd z \
    &= limits(integral)_L (sum_(j=0)^(n) a_j (2 pi i z)^j) e^(2 pi i z t) / P(z) hat(f)(z)dd z \
    &= limits(integral)_L e^(2 pi i z t) hat(f)(z) dd z.
  $
  by considering the definition of $P$ and where a finite sum can be interchanged without consequence.

  Now, create a closed rectangular contour joining the real axis and $R$ with sides at $plus.minus R$.

  Since $hat(f)(z)$ and $e^(2 pi i z t)$ are entire, then the integral over the closed loop contour will vanish.

  Furthermore, at $x = plus.minus R$,
  $
    abs(hat(f)(x + i y)) <= A / (1+R^2) -> 0 " as " R -> oo.
  $

  So, the integral will vanish on the vertical sides of the contour.

  Therefore, we are left with
  $
    limits(integral)_L e^(2 pi i z t) hat(f)(z) dd z = limits(integral)_RR e^(2 pi i x t) hat(f)(x) dd x.
  $

  Thus, by the Fourier inversion theorem, we have
  $
    f(t) = limits(integral)_RR e^(2 pi i x t) hat(f)(x) dd x = sum_(j=0)^(n) a_j (d / (d t))^j u(t),
  $
  which is what we wanted to show.
]
