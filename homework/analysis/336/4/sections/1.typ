#import "@local/tinyset:0.2.1": *

#import "@preview/cetz:0.3.4"

#problem[
  Prove that for $u in.not ZZ$,
  $
    sum_(-infinity)^(infinity) 1 / (u+n)^2 = pi^2 / (sin pi u)^2.
  $
  by integrating $f(z)= (pi cot pi z) / ((u+z)^2)$ on the circle $|z| = R_N = N+1 / 2$ for $N in ZZ$ and $N >= |w|$, and adding residues of $f$ on the inside of the circle $C_R_N$, letting $N->oo$.
]

#proof[
  The simple poles of $f$ occur at $z in [-N,N] subset ZZ$ and there is a second order pole at $z=-u$.

  We have that $ limits(integral.cont)_(C_R_N) f dd z = 2 pi i (sum_(-N)^(N) "res"_k f + "res"_(-u) f). $

  For the integer residues $[-N,N]$,
  $
    "res"_k f &= lim_(z -> k) (z-k)(pi cos pi z) / ((u+z)^2 sin pi z) \
    &limits(=)^("LH") lim_(z -> k) (pi cos pi k - (z-k) pi^2 sin pi z) / (2(u+z)sin pi z + (u+z)^2 pi cos pi z) \
    &= (pi (-1)^k) / ((u+z)^2 pi (-1)^k) \
    &= 1 / (u+k)^2. \
  $

  For the second order pole,
  $
    "res"_(-u)f &= lim_(z -> -u) (d) / (d z) ((z+u)^2 (pi cot pi z) / (u+z)^2)\
    &=lim_(z -> -u) (d) / (d z) (pi cot pi z) \
    &= lim_(z -> -u) -pi^2 csc^2 pi z \
    &= -pi^2 / (sin pi u)^2,\
  $ by the oddness of sine.

  So, we have
  $
    limits(integral.cont)_(C_R_N) f dd z = 2pi i (sum_(-N)^(N) 1 / (u+n)^2 - pi^2 / (sin pi u)^2).
  $

  We will show that the contour integral vanishes as $N->oo$.
  We begin by splitting the circle contour into parts and estimating $cot pi z$ on each part.
  We will write $z=x+i y$.

  For the first part, we will consider the pieces of the circle with a modulus of real part between $N$ and $N+1$.
  Since $cot pi z$ has a period of 1, with singularities at 0 and 1 but is bounded between, then it is also bounded when $|"Re"(z)| = |x|$ is on the open interval $(N,N+1)$.

  For the second part, we will consider the pieces of the contour with a modulus of imaginary part greater than the value of the contour for which the real part is above $N$ is magnitude.
  Since the contour is a circle, then we can find the height of the contour that is achieved prior to $|"Re"(z)| = |x| = N$.
  So,
  $
    x^2+y^2&=R_N^2 \
    y &= sqrt((N+1 / 2)^2-N^2) \
    &= sqrt(N+1 / 4) approx sqrt(N). \
  $

  Next, we will show that $cot pi z$ is bounded for $|"Im"(z)| = |y| >= sqrt(N)$.

  We begin with the identifying cotangent with exponential functions using Euler's formula,
  $
    cot pi z = i (e^(2pi i z)+1 ) / (e^(2pi i z)-1).
  $
  So, as $|y| = sqrt(N) -> oo$, we have
  $
    i (e^(2pi i (x+i y))+1 ) / (e^(2pi i (x+i y))-1) = i (e^(-2 pi y) e^(2 pi i x) + 1) / (e^(-2 pi y) e^(2 pi i x) - 1) -> -i.
  $

  Hence, cotangent is bounded on the two parts of the contour, while the denominator of the integrand grows without bound.

  So, we have
  $
    limits(integral)_(|"Re"(z)| > N) (pi cot pi z) / (u + z)^2 dd z <= abs(C / N^2) &-> 0 \
    limits(integral)_(|"Im"(z)| > sqrt(N) )(pi cot pi z) / (u + z)^2 dd z <= abs(1 / N^2) &-> 0 \
  $

  Therefore the contour integral vanishes as $N->oo$.
  Thus we are left with,
  $
    lim_(N -> infinity) sum_(-N)^(N) 1 / (u+k)^2 = pi^2 / (sin pi u)^2,
  $ as desired.
]
