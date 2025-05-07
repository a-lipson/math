#import "@local/tinyset:0.2.1": *

#problem[
  Let $F$ be the generating function for the set of all partitions, weighted by sum.
  Prove that
  $
    F(x) = sum_(k=0)^(infinity) product_(j=1)^(k) x^(k^2) / (1-x^j)^2.
  $
  // hint: for each partition lambda, consider the largest square that fits in the upper left corner of its Young diagram.
]

#proof[
  Consider a partition $lambda$.
  Let $k$ be the size of the largest square that fits in the upper left corner of the Young diagram of $lambda$.

  Then, $lambda$ has at least $k$ parts of size at least $k$.
  Now, we can decompose the Young diagram into three sub pieces:
  - the $k times k$ square;
  - a partition $alpha$ to the right of the square, with at most $k$ parts; and
  - a partition $beta$ below the square, with parts at most $k$.

  The $k times k$ square has weight $k^2$, which contributes $x^(k^2)$ to the generating function $F$.

  Both $alpha$ and $beta$ are in bijection with $P_(<= k)$, which counts the number of partitions weighted by sum with at most $k$ parts, and, by conjugation, also the number of partitions with parts at most $k$.

  We have that the generation function for $P_(<= k)$ is $product_(j=1)^(k) 1 / (1-x^j)$. So, this gives the generating function for the partitions $alpha$ and $beta$ as well.

  Combining these and summing over all possible $k$ yields
  $
    sum_(k=0)^(infinity) x^(k^2) (product_(j=1)^(k) 1 / (1-x^j))^2 =
    sum_(k=0)^(infinity) product_(j=1)^(k) x^(k^2) / (1-x^j)^2,
  $ as desired.
]
