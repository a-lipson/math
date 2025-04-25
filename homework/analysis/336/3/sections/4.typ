#import "@local/tinyset:0.2.1": *

#problem[
  Evaluate the following integrals: 
  + $ integral_(-infinity)^(infinity) (d x) / (1 + x^4). $
  + $ integral_(-infinity)^(infinity) (cos x)/(x^2 + a^2). $
]

#proof(of: "(a)")[
By the FTA, $1/(1 + x^4)$ has four poles, one in each quadrant of the complex plane. 

We will consider the positive imaginary semicircle contour $C_R$ with radius $R$. 

The desired integral is found on the bottom of the contour as $R->oo$.  

Since $f = O(z^(-4))$, then the integral around the upper part of the contour with radius $R$ will vanish as $R->oo$.       

So, we are left with 
$
integral_(-infinity)^(infinity) (d x) / (1 + x^4) = limits(integral.cont)_(C_R) (d z) / (1 + z^4).
$

By the residue theorem, the contour integral will evaluate to $2 pi i$ times the sum of the residues contained in the contour. 

For the first pole at $z_1= 1/sqrt(2) (1+i)$, we have 
$
"res"_(z_1) f = limits(lim)_(z->z_1) (z-z_1)/(1+z^4) = 1/(sqrt(8)(i-1)).
$ 

For the second pole at $z_2 = 1/sqrt(2)(-1+i)$ we have 
$ 
"res"_(z_2) f = limits(lim)_(z->z_2) (z-z_2)/(1+z^4) = 1/(sqrt(8)(i+1)).
$

So,
$
limits(integral.cont)_(C_R) f dd z = 2 pi i ("res"_(z_1) f + "res"_(z_2) f ) = (2 pi i)/sqrt(8) (1/(i+1) + 1/(i-1)) = pi/sqrt(2).  
$

Thus, $
limits(lim)_(R->oo) integral_(-R)^(R) (d x)/(1 + x^4) = pi/sqrt(2) 
$  
]

#proof(of: "(b)")[
  We will consider the same contour $C_R$ as in the previous problem. 

  For the integral on the top curve of $C_R$, we have that 
  $ 
  f = "Re"lr([ e^(i z)/(z^2 + a^2) ]).
  $

  Note that for $z=R e^(i t)$ and $t in [0, pi]$, 
  $
  lr([ e^(i R e^(i t)) / (R^2 e^(2 i t)) + a^2 ]) <= e^(-R sin t)/(R^2 - a^2),
  $ where $lr(| e^(i R e^(i t)) |) = lr(| e^(i R cos t - R sin t ) |) = e^(-R sin t)$. 
  Since $sin t >= 0$ for all $t in [0, pi]$, then this goes to zero as $R -> oo$. 

  Hence, the integral of this term will vanish on the upper part of the contour with radius $R$. 

  We are left with the integral on the real line equal to the integral over the entire contour $C_R$.

  We have that the poles of the integrand $f$ occur at $plus.minus a i$. 
  Since we have the semicircle contour in the positive imaginary axis, then we will find the residue at $a i$,  
  $
  "res"_(a i)f = limits(lim)_(z-> a i) (cos z)/(z + a i) = (cos a i) / (2 a i) = e^(-a)/( 2 a i) 
  $ where $e^(i (a i)) = e^(-a) = cos (a i) + i sin (a i) $.

  So, $
   integral_(-infinity)^(infinity) (cos x)/(x^2 + a^2) = limits(integral.cont)_(C_R) f = 2 pi i " res"_(a i) f = (pi e^(-a))/a
  $ as desired.
]
