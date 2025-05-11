#import "@local/tinyset:0.2.1": *

#problem[
Prove that $f in cal(F)_a$ and $0 <= b < a$ implies $forall n in NN, #h(0.5em) f^((n)) in cal(F)_b$.
]

#proof[
We wish to show that for $f^((n)) in cal(F)_b$, 
$ 
exists B : abs(f^((n))(x+i y))<= B/(1+x^2) " and " f^((n))(z) "is holorphic for all " z : abs(im(z))<b<a.  
$ 

First, since $f$ is holomorphic on $abs(im(z))<a$ and $b<a$, then $f^((n))$ is holomorphic on $abs(im(z))<b$.

Next, using the Cauchy inequality and considering disks of radius $a$ centered on the real axis, we have that where $z=x+i y$, 
$ 
forall x in RR, #h(0.5em) abs(f^((n))(x)) <= n!/a^n limits(sup)_(z in C_R(x)) abs(f(z)) <=  (n!A)/(a^n (1+x^2)).
$ 
Let $B = (A n!)/(a^n)$, which is constant for all $a$ and $n$ fixed.
Hence $abs(f^((n))(x+i y)) <= B/(1+x^2)$.

Thus, $f^((n)) in cal(F)_b$ as desired.
]
