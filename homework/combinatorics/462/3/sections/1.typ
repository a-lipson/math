#import "@local/tinyset:0.2.1": *

#problem[
Draw $n$ points on a circle labeled $1, #sym.dots.h, n$. 
Draw zero or more line segments between points so that no two line segments intersect.

Let $D$ be the set of all such drawings over all $n$, where the weight of a drawing is $n$, the point of points on the circle.      

+ Find a closed form for the generating function $F_D (x)$ of $D$.

+ A full drawing is a drawing where every point on the circle is on a line segment. 
  Prove that, if $n$ is even, then the number of full drawings of weight $n$ is $c_(n\/2)$, \
  where $c_n=1/(n+1) binom(2n, n)$ is the $n$-th Catalan number.

+ Let $d_n$ be the number of drawings (not necessarily full) of we weight $n$.
  Prove that $ d_n =sum_(k=0)^(floor(n\/2)) binom(n,2k)c_k. $
]

#proof(of: "(a)")[
  We will consider a circle of $n+1$ points. The $(n+1)$-th points fits in exactly one of the following two cases: 
  - it is not connected to any other point in the circle, or
  - it is connected to exactly one other point in the circle, call this point $i$.  

  In the second case, then the segment between $n+1$ and $i$ bisects the circle into two circles with $i-1$ and $n-i$ points respectively. 

  So, we can construct the following recurrence relationship:
  $ 
  d_(n+1) = d_n + sum_(i=1)^n d_(i-1)d_(n-i),
  $ where we consider the cases where the point $n+1$ is be connected to each one of the other points $1$ through $n$ in the circle.

  With the relation, we can construct the generation function $F_D (x)$, 
  $ 
  sum_0^oo d_(n+1)x^n &= sum_0^oo d_n x^n + sum_0^oo sum_(i=1)^n d_(i-1)d_(n-i)x^n \
sum_0^oo d_(n+1)x^n &= sum_0^oo d_n x^n + x sum_0^oo sum_(i=0)^(n-1) d_i d_((n-1)-i)x^(n-1) \
sum_0^oo d_(n+1)x^n &= sum_0^oo d_n x^n + x ( sum_(n=0)^oo d_n x^n )^2 \
  1/x (F_D (x)-d_0) &= F_D (x) + x (F_D (x))^2 \

  F_D (x) - 1 &= x F_D (x) + x^2 F_D (x)^2 \
  0 &= 1 + (x-1) F_D (x) + x^2 F_D (x)^2 \
  F_D (x) &= (1-x plus.minus sqrt((x-1)^2-4x^2) )/(2x^2) \
  F_D (x) &= (1-x plus.minus sqrt(1-2x-3x^2) )/(2x^2), \
  $ where the reduction from the double sum is given by the Cauchy product for series.

  Since we have that $1=d_0=F(0)$, then we can consider $lim_(x->0)F(x)$ to determine the proper branch of the above function. 
  Applying L'Hôpital twice in the limit yields
  $ 
  F_D (x) = (1-x - sqrt(1-2x-3x^2) )/(2x^2).
  $
]

#proof(of: "(b)")[
  Let $f_n$ be the number of full drawings with $n$ points and let $F$ be the set of all full drawings, weighted by number of points.

  Then, the elements of $F$ belong to one of the following two cases: 
  - an empty drawing $f_0$ with weight zero, or
  - a drawing with a segment chord that splits the circle into two more full drawings.

  // define a custom two dot symbol, displays differently inline versus display
#let twodotcircle = {
  stack(
    dir: ttb,
    spacing: -0.35em,
    // spacing: -0.5em,
    // box(move(dx: 0.2em, text(size: 1.5em, $dot$))), 
    // $circle$,
    // box(move(dy: -0.1em, dx: 0.2em, text(size: 1.5em, $dot$)))
    $circle.filled.tiny$,
    $circle$,
    $circle.filled.tiny$,
  )
}

  So, we have a weight preserving bijection given by 
  $
  F <-> {circle} union.sq {#twodotcircle} times F times F,
  $ where circle the circle with zero points has weight zero and the circle with two points has weight two.

  This gives, 
  $ 
  F_F (x) = 1 + x^2 F_F (x)^2 = (1 plus.minus sqrt(1-4x^2) )/(2x^2 ).
  $

  As before, with $f_0 = 1 => F(0)=1$, we can consider the limit as $x->0$ to see that 
  $
  F_F (x) = (1 - sqrt(1-4x^2) )/(2x^2 ).
  $
  
  By the general binomial theorem, we have that 
  $
  (1-4x^2)^(1\/2) = sum_0^oo binom(1/2, n)(-4x^2)^n
  = 1 + sum_1^oo (-1)^(n-1)2/(4^n n)binom(2n-2,n-1) x^(2n).
  $

  So, 
  $
  F &= (1-(1-4x^2)^(1\/2))/(2x^2) \
  &= -1/(2x^2) sum_1^oo (-1)^(n-1)2/(4^n n)binom(2n-2,n-1)(-4)^n x^(2n) \
  &= sum_1^oo binom(2(n-1),n-1)x^(2(n-1))/n \
&= sum_0^oo binom(2n,n)x^(2n)/(n+1) \
&= sum_0^oo binom(n,n\/2)x^n/(n\/2+1), \
  $ which implies that 
  $
  f_n = binom(n,n\/2)1/(n\/2+1) = c_(n\/2).
  $
]


#proof(of: "(c)")[
Consider the provided definition of $d_n$, we have that $k$ is the number of segments in the circle. 

Then, we must use $2 k$ points to create the $k$ segments. 

By part (b), we have that there are $c_(2k\/k) = c_k$ ways to create $k$ non-intersecting segments on a circle with $2 k$ points.

For any circle with $n$ points, we can have up to $floor(n\/2)$ segments, because we need two points per segment.

For each of the $k in [0,floor(n\/2)]$ segments, we can pick $2 k$ points of $n$ total points as segment endpoint; there are $binom(n,2k)$ ways to do this. 

Hence, considering all possible number of segments, we have 
$
d_n =sum_(k=0)^(floor(n\/2)) binom(n,2k)c_k,
$ as desired
]
