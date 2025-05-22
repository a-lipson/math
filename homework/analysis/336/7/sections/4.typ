#import "@local/tinyset:0.2.1": *

#problem[
  A function and its Fourier transform cannot both be too small at infinity, this is illustrated by the following theorem by Hardy.
  If the function $f$ on $RR$ satisfies
  $
    f(x) = O(e^(-pi x^2)) and hat(f)(xi) = O(e^(-pi xi^2)),
  $
  then $f = c e^(- pi x^2)$.
  As a result, $f(x) = O(e^(-pi A x^2) )$ and $hat(f)(xi) = O(e^(- pi B xi^2))$.
  When $A B > 1$ and $A,B > 0$, then $f$ is identically zero.

  + Show that for $f$ even, $hat(f)$ extends to an even entire function.
    Let $g(z) = hat(f)(z^(1\/2))$, which satisfies
    $
      |g(x)| <= c e^(-pi x) and |g(z)| <= c exp(pi R sin^2 theta \/ 2) <= c e^(pi |z|),
    $
    when $x, theta in RR$, $R >= 0$, and $z = R e^(i theta)$.

  + Apply the Phragmén-Lindelöf principle to
    $
      F(z) = g(z)e^(gamma z) "where" gamma = i pi e^(-pi \/ (2 beta)) / (sin pi\/(2 beta))
    $
    and the sector $0 <= theta <= pi\/beta < pi$.

    Let $beta -> 1$ to deduce $e^(pi z) g(z)$ is bounded in the closed upper half-plane, and the same in the lower half-plane.
    By Liouville, $e^(pi z)g(z)$ is constant, as desired.


  + If $f$ is odd, then $hat(f)(0) = 0$.
    Apply the above argument to $(hat(f)(z)) / z$ to deduce $f = hat(f) = 0$.
    Write $f$ as an appropriate sum of an even and odd function.

  Note that there is likely a typo in the suggested solution, the original erroneous statement was taking $beta -> pi$.
]

#proof[(a)][
  We will consider
  $
    hat(f)(-xi) = limits(integral)_RR f(x)e^(2pi i x xi) dd x.
  $
  Note that flipping the differential and direction of integration cancel out opposing signs.

  Since $f$ is even, then with the map $x |-> -x$, we have
  $
    hat(f)(-xi) = limits(integral)_RR f(x)e^(-2pi i x xi) dd x = hat(f)(xi),
  $
  which implies that $hat(f)$ is even.

  Since $f(x) = O(e^(-pi x^2))$, then the integral
  $
    hat(f)(z) = limits(integral)_RR f(x)e^(2pi i x z) dd x
  $
  will converge for all $z in CC$, hence $hat(f)$ is entire.

  Now, $forall x in RR$, we have $hat(f)(xi) = O(e^(-pi xi^2))$.

  Let $g(x) = hat(f)(x^(1\/2))$.
  So, $|g(x)| = hat(f)(x^(1\/2)) <= c e^(-pi (x^(1\/2))^2) = c e^(-pi x)$.

  With $z=R e^(i theta)$, $cos theta = 1 - 2sin^2 theta \/ 2$, and $sin^2 theta \/ 2 < 1$ for all $theta$,
  $
    |g(z)| & <=|c exp(-pi R e^(i theta))|          \
           & = c exp(-pi R cos theta)              \
           & = c exp(-pi R (1 - sin^2 theta \/ 2)) \
           & = c exp(pi R (2sin^2 theta \/ 2 - 1)) \
           & <= c exp(pi R sin^2 theta \/ 2)       \
           & <= c e^(pi R)                         \
           & = c e^(pi |z|).                       \
  $
]

#proof[(b)][
  We will examine $|F|$ on the boundaries of the sector $partial S$.

  When $theta = 0$ on $RR^+$,
  $
    |F(x)| = |g(x) e^(gamma x)| <= c e^(-pi x) e^(gamma x) = c e^((gamma - pi).
  $

  We have
  $
    gamma = i pi e^(-pi \/ (2 beta)) / (sin pi \/ (2 beta)) =
    pi / (sin pi \/ (2 beta)) (i cos -pi / (2 beta) - sin -pi / (2 beta) ),
  $
  by the oddness of sine, $re gamma = pi$ for all $beta$.

  So $|F(x)| <= c$.

  For $theta = pi \/ beta$, $z = |z| e^(i pi \/ beta)$.
  $
    |F(z)| = |g(z)e^(gamma z)| & <= c e^(pi |z|) e^(gamma z)                  \
                               & = c exp(pi |z| + gamma |z| e^(i pi \/ beta)) \
                               & = c exp((pi + gamma e^(i pi\/beta) )|z|).    \
  $

  We have
  $
    e^(i pi \/ beta) gamma = i pi e^(pi \/ (2 beta)) / (sin pi \/ (2 beta)) =
    pi / (sin pi \/ (2 beta)) (i cos pi / (2 beta) - sin pi / (2 beta) ).
  $

  Now, taking $re (e^(i pi \/ beta) gamma) = -pi$, the exponential argument of the bound above will vanish, so $|F|$ is bounded by $c$.

  So $|F| <= c$ on $partial S$.

  Since $S$, we have
  $
    |F(z)| <= c e^(pi |z|) abs(e^(gamma z)) <= c e^(2 pi |z|)
  $
  because $re gamma = pi$, which gives us a sufficient global bound to apply Phragmén-Lindelöf.

  We will apply the PL principle to a normalized version of $F(z) / c$, which does not change the holomorphicity or growth conditions of $F$.

  Therefore, we have that $F(z) <= c$ inside $S$.

  Now, as $beta -> 1$, the sector $S$ becomes the upper half-plane,
  #footnote[We take the limit to retain the principle log branch cut used in the relation of $g$ to $hat(f)$.]
  and $lim_(beta -> 1) gamma = i pi e^(i pi \/ 2) / (sin pi\/2) = pi$.

  So $F(z) -> e^(pi z)g(z)$ is bounded by $c$ in the upper half-plane.

  For the lower half-plane, we can use the same bound on the positive real axis, and consider the sector with opening angle $-pi\/beta$.

  Since $F$ is bounded in the lower half-plane as well, and $F$ is entire given that $hat(f)$ was entire, then $F$ must be constant by Liouville.

  Since $F$ is constant, then
  $
    g(z) = C e^(-pi z) = hat(f)(z^(1\/2)) implies hat(f)(z) = C e^(-pi z^2).
  $

  Since the Gaussian function is its own Fourier transform, then we have $f(x) = C e^(-pi x^2)$, as desired.
]

#proof[(c)][
  If $f$ is odd, then $hat(f)(0) = limits(integral)_RR f(x) dd x = 0$.

  Consider $(hat(f)(z)) / z$, which has a removable singularity at $z=0$ by L'Hôpital with $hat(f)(0)=0$.

  Let $tilde(g)(z) =( hat(f)(z^(1\/2) )) / z^(1\/2)$.

  As in part (b), we wish to show that $e^(pi z) tilde(g)(z)$ is constant.

  Now,
  $
    tilde(g) = B e^(-pi z) implies hat(f)(z) = B z e^(-pi z^2).
  $

  However, to satisfy our decay condition on $hat(f)$, we must have $B=0$, so $f = hat(f) = 0$.

  Any function can be written as a sum of even and odd parts,
  $
    f(x) = (f(x)+f(-x)) / 2 + (f(x)-f(-x)) / 2 = f_e(x) + f_o(x).
  $

  By the linearity of the Fourier transform, we can consider $hat(f)_e$ and $hat(f)_o$ independently.
]
