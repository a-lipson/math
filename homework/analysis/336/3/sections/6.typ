#import "@local/tinyset:0.2.1": *

#problem[
  For even $n in NN$, find $ integral_(0)^(pi) sin^n (theta) d theta. $
]

#proof[
With Euler's identity and the binomial expansion, we have that 
$
integral_0^pi ( (e^(i x) - e^(-i x)) / (2i))^n dd x 
= 1/(2 i)^n integral_0^pi sum_(k=0)^n binom(n,k) e^(i x (n - k)) (-e^(i x))^k dd x.
$

Since we have a finite integral and series, we can interchange to achieve, 
$
1/(2 i)^n sum_(k=0)^n binom(n,k) (-1)^k integral_0^pi e^(i x (n - 2k)) dd x.
$

Since $e^(i x (n-2k))$ is even on $x in [0, pi]$ for all $n != 2k$, then the integral over this interval vanishes. 

So, for $k=n/2$, we have 
$ 
integral_0^pi e^(i x (n - 2k)) dd x = pi.
$

Thus, we are left with 
$
1/(2i)^n binom(n, n/2)(-1)^(n/2) pi = pi/2^n binom(n, n/2).
$
]

