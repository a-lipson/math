#import "@local/tinyset:0.2.1": *

#problem[
  Prove for $f$ holomorphic in an annulus $A = {z bar r_1 <= |z-z_0| <= r_2}$, with $0<r_1<r_2$, then
  $
    f(z)=sum_(-infinity)^(infinity) a_n (z-z_0)^n,
  $ where the series converges absolutely on the interior of the annulus.
]

#proof[
  Consider the two contour integrals
  $
    f(z)=1 / (2 pi i) [ limits(integral.cont)_(C_r_2) (f(w)) / (w-z) dd w - limits(integral.cont)_(C_r_1) (f(w)) / (w-z) dd w ]
  $ where the circles $C_r_2$ and $C_r_1$ bound the annulus $A$ with $z in A$.

  For the outer circle contour integral on $C_r_2$, we have
  $
    1 / (w-z) = 1 / (z-z_0 - (z-z_0)) = 1 / (w-z_0) 1 / (1 - (z-z_0) / (w-z_0)).
  $
  Note that, for $w$ on $C_r_2$, we have that $|w-z_0| > |z-z_0|$, hence $abs((z-z_0) / (w-z_0))<1$.

  So, with the geometric series, the above becomes
  $
    1 / (w-z_0)sum_(n=0)^(infinity) ((z-z_0) / (w-z_0))^n,
  $ which converges uniformly for all $w in C_r_2$.

  For the inner circle contour integral on $C_r_1$, we have
  $
    1 / (w-z) = -1 / (z-w) = 1 / ((z-z_0)-(w-z_0)) = -1 / (z-z_0)1 / (1- (w-z_0) / (z-z_0)),
  $ because $|w-z_0| < |z-z_0|$ on $C_r_1$.

  Then, with the geometric series, we have,
  $
    -1 / (z-z_0)sum_(n=0)^(infinity) ((w-z_0) / (z-z_0))^n,
  $ which converges for all $w in C_r_1$.

  Substituting back into the integrals, we have
  $
    f(z) = 1 / (2 pi i) [
      limits(integral.cont)_(C_r_2) (f(w)) / (w-z_0)sum_(n=0)^(infinity) ((z-z_0) / (w-z_0))^n d w -
      limits(integral.cont)_(C_r_1) (f(w)) / (z-z_0)sum_(n=0)^(infinity) ((w-z_0) / (z-z_0))^n d w
    ].
  $

  Since both integrals converge uniformly, then we can interchange the sums and integrals.
  So, we have
  $
    f(z) = 1 / (2 pi i) [
      sum_(n=0)^(infinity) (limits(integral.cont)_(C_r_2) (f(w)) / (w-z_0)^(n+1) dd w ) (z-z_0)^n -
      sum_(n=0)^(infinity) (limits(integral.cont)_(C_r_1) f(w)(w-z_0)^n dd w)(z-z_0)^(-(n+1))
    ].
  $
  Each integral can be evaluated with CIF for the nonnegative and negative coefficients respectively.

  Note that the right hand series begins at a pole of order 1, and has no constant term.
  Thus we have
  $
    f(z) = sum_(-infinity)^(infinity) a_n (z-z_0)^n ,
  $ which is what we wanted to show.
]
