#import "@local/tinyset:0.2.1": *

#problem[
  Let $P$ be a poset such that the maximum size of an antichain is $a$ and the maximum size of a chain is $c$.
  Let $a'$ be the maximum size of an antichain of $P times P$.
  Determine, as a function of $a$ and $c$, the maximum possible value of $a'$.
]

#proof[
  First, consider the maximal case where $c=1$, then $P$ itself must be an antichain.
  So, all elements in $P times P$ must be mutually incomparable.
  Therefore, $a' = abs(P times P) = a^2$.

  Next, consider the minimal case where $a=1$, then $P$ is a chain.
  So, all elements in $P times P$ are comparable.
  WLOG let $P = [n]$ with partial ordering $<=$.
  Then, we can construct a rectangular diagram with $P times P$ which has a symmetric chain decomposition with an antichain along the diagonal, that is
  $
    (1,c), (2,c-1), dots, (c-1,2), (c,1),
  $
  which is an antichain of length $c$.
  Therefore, $a' = a c = c$.

  // TODO: finish proof.

  Now, consider the case with $a,c>1$.
  By Dilworth, we can partition $P$ into $a$ disjoint chains, call them $C_1 union.sq dots.c union.sq C_a = P$, where $C_i$ has at most length $c$.

  If all chains have exactly length $c$. Then, since antichains have size $a$, we have $a' = a c$.

  Then, define the antichain along the antidiagonal similar to the construction in the minimal case,
  $
    A={(c_(i,j),c_(i,c+1−j)) : 1 <= i <= a, 1 <= j <= c},
  $
  which has size $|A| = a c$.

  Thus, $a' = a c$.
]
