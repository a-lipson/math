#import "@local/tinyset:0.2.1": *

#problem[
  Given a simple graph $G$, let $overline(G)$ denote the _complement_ of $G$.
  That is, $overline(G)$ is a simple graph with the same vertex set as $G$, and for any two distinct vertices $x$ and $y$, $x$ and $y$ are adjacent in $G$ iff they are not adjacent in $G$.
  + Let $G$ be a simple graph with n vertices.
    Prove that $chi(G)+chi(overline(G)) <= n + 1$.
    Hint: Use induction.

  + Use part (a) to prove that $chi(G)chi(overline(G))<= (n+1)^2\/4$.

  + Conclude that $chi(G) <= (n + 1)^2\/(4 alpha(G))$, where $alpha(G)$ is the size of the largest independent set of $G$.
]

#proof[(a)][
  Induction on the number of vertices $n$.

  For the base case when $n=1$, both $G$ and $overline(G)$ contain one vertex, so they each have a chromatic number of 1.
  Hence, $chi(G) + chi(overline(G)) = 1 + 1 <= 1 + 1$, as desired.

  Assume the result for $n-1$ vertices,
  $
    chi(G) + chi(overline(G)) <= (n-1) + 1 = n,
  $
  and consider $G$ with $n$ vertices.

  Choose any vertex $v in V(G)$, and let $G' = G - v$, $overline(G') = overline(G) - v$.
  By the inductive hypothesis,
  $
    chi(G') + chi(overline(G')) <= n.
  $

  Now, adding back the vertex $v$ can increase the chromatic number by at most one in either $G'$ or $overline(G')$ but not both.

  If $v$ is connected to all color classes in $G'$, then it needs a new color in $G$.
  But, this means that $v$ could not have been connected to all color classes in $overline(G')$.

  Similarly, the argument holds for $v$ connected to all color classes in $overline(G')$.

  So, either $chi(G) <= chi(G')$ or $chi(overline(G)) <= chi(overline(G'))$.

  So, we must have that
  $
    chi(G) + chi(G') <= chi(G') + chi(overline(G')) + 1 <= n + 1,
  $
  #w5 to show.
]

#proof[(b)][
  From part (a), we have
  $
    chi(G) + chi(G') + 1 <= n + 1,
  $
  Then, with the AM-GM inequality, we have
  $
    chi(G)chi(G') <= ((chi(G) + chi(G')) / (2))^2 <= ((n + 1) / 2)^2 = (n+1)^2 / 4.
  $
]

#proof[(c)][
  // We will show that $chi(overline(G)) >= n \/ alpha(G)$.
  //
  // Since every coloring of $overline(G)$ is a clique in $G$, then each color class in $overline(G)$ contains at most $alpha(G)$ vertices.
  //
  // Hence, at most $n \/ alpha(G)$ color classes are needed for a proper coloring of $overline(G)$.
  Since any proper coloring of $overline(G)$ requires at least $omega(overline(G))$ colors, then $chi(overline(G)) >= omega(overline(G)) = alpha(G)$.

  Combining the above with part (b) yields the desired result.
]
