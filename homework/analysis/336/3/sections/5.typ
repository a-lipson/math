#import "@local/tinyset:0.2.1": *

#problem[
  Show for $|a| < 1|$, $ integral_(0)^(2 pi) log lr(|1 - a e^(i theta)|) d theta = 0. $ 
  Show that the above also holds for $|a| = 1$.
]

#proof(of: "(a)")[
  Since $log|1-a e^(i theta)|$ is holomorphic for all $a<1$, then, by Goursat, the integral around the closed circular loop of radius $a$ is zero.
  
  Alternatively, we can use Corollary 7.3 with the fact that $"Re"[log z] = log |z|$ and evaluate $log|1-z|$ at $z=0$.
]

#proof(of: "(b)")[
Let $z=e^(i theta)$ and $C_1$ be the unit circle contour. 

We have that
$
limits(integral.cont)_(C_1) (log |1 - z|)/(i z) dd z.
$
Note that the integrand $f$ has poles at $z=0$ and $z=1$. 

First, we will consider the pole at $z=0$, 
$ 
  "res"_0 f = limits(lim)_(z->0) (z) (log|1-z|)/(i z) = 0.
$
Since this residue is zero, then $z=0$ was not a simple pole and instead was a removable singularity.

Thus, we will consider $f$ to be holomorphic over the origin. 

We will construct a new contour $gamma$ similar to $C_1$ which avoids the pole at $z=1$ by an epsilon bubble of radius $epsilon$, given by the curve $C_(epsilon)$, as an indent to our circle contour. 

Since $f$ is holomorphic on the region enclosed by $gamma$, then  
$
0 = limits(integral.cont)_(gamma)f dd z = limits(integral)_(C_1)f dd z + limits(integral)_(C_(epsilon))f dd z.
$

We will now show that the integral over $C_(epsilon)$ will vanish as $epsilon->0$, so the integral over $C_1$ must vanish as well.

Let $z=1+epsilon e^(i theta)$ for $theta in [-pi / 2 , pi /2]$.
Then, $d z = i epsilon e^(i theta) d theta = i z d theta$ and $z-1 = epsilon e^(i theta)$. 

So, 
$
limits(integral)_(C_(epsilon)) (log|1-z|)/(i z) dd z 
= integral_(-pi / 2)^(pi / 2) log|epsilon e^(i theta)| dd theta
= pi log epsilon -> 0.
$

Thus, we have that the integral vanishes for all $a <= 1$.
]
