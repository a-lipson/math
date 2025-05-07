#import "@local/tinyset:0.2.1": *

#problem[
  Find the number of zeros, counting multiplicities, of $ p(z) = z^4-2x^3+9x^2+z-1 $ inside $abs(z)=2$.
]

#proof[
  Consider the behavior of the terms of $p$ on the boundary $abs(z)=2$,
  $
    |9z^2| &= 36 \
    |z^4-2x^3+z-1| <= |z^4| + |2z^3| + |z| + 1 = 16 + 16 + 2 + 1 &= 35. \
  $

  Hence $|9z^2| > |z^4-2x^3+z-1|$ on $abs(z)=2$.

  So, $9z^2$ and $p(z)$ have the same number of zeros inside $abs(z)=2$ by Rouché.

  Since $9z^2$ has one zero of multiplicity two, then $p(z)$ has two zeros inside $abs(z)=2$.
]
