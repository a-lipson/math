#import "@local/tinyset:0.2.1": *

#problem[
  Let $k in ZZ^+$. A $k$-ary tree is defined recursively as follows: 
  - The empty set a $k$-ary treee.
  - If $T_1,#sym.dots.h,T_k$ are $k$-ary trees, then we can form a $k$-ary tree by drawing a root vertex $r$, drawing $T_1,#sym.dots.h,T_k$ below $r$ in that order, and rdawing an edge from $r$ to each of the roots of $T_1,#sym.dots.h,T_k$.

  Prove that the number of $k$-ary trees with $n$ vertices is 
  $
  1/((k-1)n+1)binom(k n,n).
  $      
]

#proof[
  By the definition of $k$-ary trees, we have the following generating function $F$ defined by $F = 1 + x F^k$.

  Let $H = F - 1 = x F^k$. Note that $H(0)=0$ and $H'(0)!=0$.    

  Then, for the generating function $G = sum g_n x^n$, using the Lagrange inversion formula with $H$, we have that 
  $
  g_n = 1/n [x^(n-1)]x^n (x F^k)^(-n) = 1/n [x^(n-1)] F^(-k n).
  $

  So, we must find the coefficient of $x^(n-1)$ is the power series $F^(-k n)$.

  Using the generalized binomial expansion, we have that,
  $ 
  F^(-k n) &= (H + 1)^(-k n) \
  &= sum_(j=0)^oo binom(-k n,j) H^j \
  &= sum_(j=0)^oo (-1)^j binom(k n+j-1,j) H^j.
  $

  So, consider $j=n-1$, which gives 
  $
  (-1)^(n-1) binom(k n + n - 2, n-1)[x^(n-1)] H^(n-1).
  $

  Since $H = x F^k$ and $F(0) = 1$, then the coefficient of $x^(n-1)$ is $H^(n-1)$ is one.    

  Therefore, 
  $
  g_n = 1/n (-1)^(n-1) binom(k n+n-2, n-1).
  $

  Thus, the number of $k$-ary trees with n vertices is
  $
  1/((k-1)n+1) binom(k n, n).
  $
]
