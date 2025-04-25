#import "@local/tinyset:0.2.1": *

#problem[
  $f$ non-vanishing and continuous on $overline(DD)$, holomorphic on $DD$.    
  Prove that if $|f(z)| = 1$ when $|z| = 1$, then $f$ is constant.    
  // extend f to C by f(z)=1/bar(f(1/bar(z))) for all |z| > 1 and argue as in Schwarz reflection principle.
]

#proof[
  Since $f$ is holomorphic on $overline(DD)$, then $limits(integral.cont)_(gamma) f = 0$ for all closed curves $gamma$ contained in $overline(DD)$.       

  Let $g = 1 \/ overline(f( 1 \/ overline(z) ))) $. We will show that $g$ is holomorphic as well.

  Since $|z| <= 1 => | 1 \/ overline(z) | >= 1$ are both continuous, then any closed contour $C$ contained in $DD$ will map to a closed counter $C'$ outside of $DD$. 
  
  Therefore, we have that 
  $
  limits(integral.cont)_(C') g = limits(integral.cont)_(C) f = 0.
  $

  If $C'$ covers part of $DD$, we can split it into two contours along the boundary of $DD$, and adjust each contour by some small about $epsilon$ is in Schwarz reflection. Then, we have two separate contours: one of which is on the inside of $DD$, and one of which is on the outside. The contour on the inside must integrate 

If $C'$ covers $DD$ entirely, then we can split it up into multiple contours which only cover part of $DD$ and proceed as in the above case.


We can extend Morera to say that for all closed loops $gamma$, 
$
limits(integral.cont)_(gamma)g = 0 => g "holomorphic". 
$ 

Since $g$ is holomorphic and agrees with $f$ on the unit circle, then, by analytic continuation, we can construct the entire function 
$ 
F(z) = cases(
  f(z) "," & |z|<= 1, \ 
  g(z) "," & |z| > 1.
) 
$

We will show that $F$ is bounded. 
Since $F$ is continuous on the compact set $DD$, then it is bounded there by EVT. 

Since $|z| >= 1 => | 1 \/ overline(z) | <= 1$ and $f$ is non-vanishing and continuous on $DD$,
then $g = 1 \/ overline(f (1 \/ overline(z)))$ continuous on a compact set and hence bounded. 

Thus, since $F$ is entire and bounded, then it is constant by Liouville.
]

