#import "@local/tinyset:0.2.1": *

#proposition(numbering: false)[
  $Chi(G) >= n \/ alpha(G)$ where $n=|V(G)|$ and $alpha(G)$ gives the size of the largest independent set of $G$.
]

#proof[Proposition][
  Create a coloring of $G$ such that all the vertices in the largest independent set $alpha(G)$ have the same color.

  By the definition of $alpha(G)$, all color classes must be assigned to at most $alpha(G)$ vertices.

  Since there are $Chi(G)$ color classes, then $n$ vertices can be partitioned into at most $Chi(G)$ parts of size $alpha(G)$.
  Hence $n <= Chi(G) alpha(G)$, which is what we wanted to show.
]

#problem[
  Let $G=(V,E)$ be a simple graph, $|V| = n$, and $k in NN$.
  Prove that if $|E| <= n k\/2$, then $alpha(G) >= n\/(k+1)$.
]

#proof[
  By the handshake lemma, $2|E| <= n k$ implies that the average degree of the vertices in $G$ is at most $k$.

  So, in any such graph $G$, there exists a vertex with degree at most the average degree $k$, call it $v$.

  Consider the extreme case where $v$ has $k$ neighbors, all of which are assigned different colors.
  Then, $v$ must be colored with a new and different color, so we must have $k+1$ total colors.
  Hence $Chi(G) <= k+1$.

  By the Proposition, we have $alpha(G) >= n \/ Chi(G)$.

  Thus, we have
  $
    n / (k+1) <= n / Chi(G) <= alpha(G),
  $
  as desired.
]
