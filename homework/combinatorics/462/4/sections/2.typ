#import "@local/tinyset:0.2.1": *



#problem[
  Let $p(n)$ denote the number of partitions of $n$.
  Let $p_(<= k)(n)$ denote the number of partitions of $n$ where all parts have size at most $k$.
  + We have that $p_(<= k)(n)~ C n^(k-1)$. Find the constant $C$.
  + Without citing an asymptotic formula for $p(n)$, prove that $p(n)$ grows faster than any polynomial function; i.e., prove that for any positive integer $d$,
  $
    lim_(n -> infinity) p(n) / (n^d) = oo.
  $
]

#proposition[
  $1-x^j approx j(1-x)$ near $x=1$.
]

#proof[Proposition 1][
  Consider the Taylor expansion of $f(x) = 1-x^j$ centered at 1,
  $
    1-x^j &= 1-sum_(n=0)^(infinity) f^((n))(1) / (n!)(x-1)^n \
    &= 1 - (f(1) + f'(1)(x-1) + "higher order terms in" (x-1))\
    &approx j(1-x), \
  $ where the higher order terms will go vanish faster as $x -> 1$.
  // Thus we have that $1-x^j approx j(1-x)$ near 1.
]

#proof[(a)][
  We have that the generating function of $p_(<= k)(n)$ is given by $F(x) = product_(j=1)^(k) 1 / (1-x^j)$, where $1$ is a root of multiplicity $k$ in the denominator.
  All other roots of the denominator have magnitude 1, with multiplicity less that $k$.

  So, by Homework 2, we have
  $
    p_(<= k)(n) ~ c / (k-1)! n^(k-1) / (1^n) = c n^(k-1) / (k-1)!,
  $ where
  $
    c = lim_(x -> 1) (1-x)^k F(x)
    = lim_(x -> 1) product_(j=1)^(k) (1-x)^k / (1-x^j)
    approx product_(j=1)^(k) (1-x)^k / (j(1-x)^k)
    = 1 / k!,
  $ where the approximation is given by Proposition 1.

  Thus, $C = c / (k-1)! = 1 / (k!(k-1)!)$.
]

#proof[(b)][
  From part (a), we have that $p_(<= k) ~ C n^(k-1)$, so for any fixed $d$, set $k-1=d+1$ such that
  $
    p_(<= k)(n) / (n^d) ~ (c d^(d+1)) / (n^d) -> oo.
  $

  But $p(n)>= p_(<= k)(n)$ for any $k$, because $p(n)$ contains all partitions, including those with above $k$ parts.

  Thus,
  $
    lim_(n -> infinity) p(n) / (n^d) >= lim_(n -> infinity) (p_(<=k)(n)) / (n^d) = oo.
  $
]
