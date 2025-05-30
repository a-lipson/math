#import "@local/tinyset:0.2.1": *

#problem[
  Dirichlet problem in a strip.
  It suffices to compute solutions at points $z=i y$ for $y in (0,1)$.

  + Show that if $r e^(i theta) = G(i y)$, then
    #grid(
      columns: 1fr,
      $ r e^(i theta) = i (cos pi y) / (1 + sin pi y). $
    )
    leads to two cases: $y in (0,1 / 2]$ and $theta = pi / 2$, or $y in [1 / 2,1)$ and $theta = -pi / 2$.

    In either case, show
    $
      r^2 = (1-sin pi y) / (1 + sin pi y) #h(1em) " and " #h(1em) P_(r)(theta - phi) = (sin pi y) / (1 - cos pi y sin phi).
    $

  + With the change of variables $t = F(e^(i phi))$ in $1 / (2pi) integral_0^pi P_r (theta-phi) tilde(f_0)(phi) dd phi$, show
    $
      e^(i phi) = (i - e^(pi t)) / (i + e^(pi t)).
    $
    Take the imaginary part and differentiate to establish
    $
      sin phi = 1 / (cosh pi t) #h(1em) " and " #h(1em) (d phi) / (d t) = (pi) / (cosh pi t).
    $
    Hence deduce
    $
      1 / (2pi) integral_0^pi P_r (theta - phi) tilde(f_0)(phi) dd phi
      &= 1 / (2pi) integral_0^pi (sin pi y) / (1 - cos pi y sin phi) tilde(f_0)(phi) dd phi \
      &= (sin pi y) / 2 limits(integral)_RR (f_(0)(t)) / (cos pi t - cos pi y) dd t. \
    $

  + Use a similar argument to prove the formula for the integral
    $
      1 / (2pi) integral_(-pi)^0 P_r (theta - phi) tilde(f_1)(phi) dd phi.
    $

]

#proof[(a)][
  From the definition of $G$, we have
  $
    r e^(i theta) = (i - e^(i pi y)) / (i + e^(i pi y)).
  $
  Multiplying by the conjugate of the denominator, $cos pi y - i(1 + sin pi y)$, we have the following:

  For the numerator, $(i(1 - sin pi y) - cos pi y) (cos pi y - i(1 + sin pi y)) = 2 i cos pi y$. \
  For the denominator, $(i(1 + sin pi y) + cos pi y) (cos pi y - i(1 + sin pi y)) = 2(1 + sin pi y)$.

  So, we have
  $
    r e^(i theta) = i (cos pi y) / (1 + sin pi y),
  $
  as desired.

  In the first case, with $y in (0, 1 / 2] ==> pi y in (0,pi / 2]$, we have $cos pi y >= 0$ and $sin pi y > 0$.
  Therefore the above expression is purely imaginary with positive imaginary part, so
  $
    theta = pi / 2 " and " r = (cos pi y) / (1 + sin pi y) in [0,1).
  $

  In the second case, with $y in [1 / 2,1)$, we have $cos pi y <= 0$ and $sin pi y > 0$.
  Therefore
  $
    theta = -pi / 2 " and " 0 < r = (-cos pi y) / (1 + sin pi y) in [0,1).
  $

  We can now verify the following:
  $
    r^2 = (cos^2 pi y) / (1 + sin pi y)^2 = (1 - sin^2 pi y) / (1 + sin pi y)^2 = (1 - sin pi y) / (1 + sin pi y).
  $

  For
  $
    P_r (theta - phi) = (1 - r^2) / (1 - 2r cos (theta - phi) + r^2),
  $
  note that for $theta = pi / 2, -pi / 2$, we have $cos (pi / 2 - phi) = sin phi$ and $cos (-pi / 2 - phi) = -sin phi$ respecively.
  But, in either case,
  $
    r cos(theta - phi) = (cos pi y) / (1 + sin pi y) sin phi.
  $

  For the numerator, we have
  $
    1 - r^2 = (2 sin pi y) / (1 + sin pi y).
  $

  For the denominator,
  $
    1 - 2r cos(theta - phi) + r^2
    &= 1 - 2 (cos pi y) / (1 + sin pi y) sin phi + (1 - sin pi y) / (1 + sin pi y) \
    &= (2(1 - cos pi y sin phi)) / (1 + sin pi y).
  $

  Therefore,
  $
    P_r (theta - phi) = (sin pi y) / (1 - cos pi y sin phi).
  $
]

#proof[(b)][
  Multiplying by the conjugate of the denominator, we have
  $
    e^(i phi) = (1 + 2 i e^(pi t) - e^(2 pi t)) / (1 + e^(2 pi t)),
  $
  which provides the following:
  $
    cos phi &= (1 - e^(2 pi t)) / (1 + e^(2 pi t)) = -tanh pi t = - (sinh pi t) / (cosh pi t), " and"\
    sin phi &= (2 e^(pi t)) / (1 + e^(2 pi t)) = 1 / (cosh pi t).
  $

  Therefore,
  $
          d / (d t) sin phi & = d / (d t) 1 / (cosh pi t)        \
    (d phi) / (d t) cos phi & = (- pi sinh pi t) / (cosh^2 pi t) \
            (d phi) / (d t) & = (pi) / (cosh pi t).              \
  $

  With the change of variables $t = F(e^(i phi))$ where $F : DD -> HH$ is the Cayley map, as $phi$ traverses $(0,pi)$, t will traverse the real axis.
  We have that $tilde(f_0)(phi) = f_0(F(e^(i phi)))$.

  So,
  $
    1 / (2pi) integral_0^pi P_r (theta - phi) tilde(f_0)(phi) dd phi
    &= 1 / (2pi) integral_0^pi (sin pi y) / (1 - cos pi y sin phi) f_0(F(e^(i phi)) dd phi \
    &= (sin pi y) / (2 pi) limits(integral)_(t(0) -> oo)^(t(pi) -> oo) 1 / (1-(cos pi y) / (cosh pi t)) (pi) / (cosh pi t) f_0(t) dd t \
    &= (sin pi y) / (2 pi) limits(integral)_RR (f_0(t)) / (cosh pi t - cos pi y) dd t.
  $
]

#proof[(c)][
  A similar argument follows for $1 / (2pi) integral_(-pi)^0 P_r (theta - phi) tilde(f_1)(phi) dd phi$ using the case with $theta = -pi / 2$ and $y in [1 / 2,1)$.

  Thus,
  $
    u(0,y) = (sin pi y) / 2 ( limits(integral)_RR (f_0(t)) / (cosh pi t - cos pi y) dd t +limits(integral)_RR (f_1(t)) / (cosh pi t + cos pi y) dd t )
  $
]

#proof[bonus][
  Since "translation of the boundary condition by $x$ results in a translation of the solution by $x$ as well,"#footnote[Stein & Shakarchi p. 216] then applying the same derivation to the boundary conditions $f_0(x+t)$ and $f_1(x+t)$ yields the same intermediate result,
  $
    u(x,y) = (sin pi y) / 2 ( limits(integral)_RR (f_0(x+t)) / (cosh pi t - cos pi y) dd t +limits(integral)_RR (f_1(x+t)) / (cosh pi t + cos pi y) dd t ).
  $

  Using the substitution $t |-> -t$ with the oddness of hyperbolic cosine and reversing the integration direction, we have
  $
    u(x,y) = (sin pi y) / 2 ( limits(integral)_RR (f_0(x-t)) / (cosh pi t - cos pi y) dd t +limits(integral)_RR (f_1(x-t)) / (cosh pi t + cos pi y) dd t ),
  $
  #w5 to show.
]


