#import "@local/tinyset:0.2.1": *

#problem[
  Let $G = (V, E)$ be a bipartite graph with maximum degree $d$.
  Prove that $G$ has a matching of size at least $abs(E) \/ d$.
]

#proof[
  Each vertex in any vertex cover can cover at most $d$ edges due to the degree constraint, so we need at least $|E|\/d$ vertices to cover all the edges.

  Since $G$ is bipartite, then by Kőnig, the size of a maximum matching equals the size of a minimum vertex cover.

  Let $C$ be a minimum vertex cover.
  We will show that $|C| >= abs(E) \/ d$.

  Since $C$ is a cover, then every edge in $E$ is incident to some vertex in $C$.

  // We will assign edges of $E$ to vertices in $C$.
  For each vertex in $C$, we can assign up to $deg(v) <= d$ edges from $E$.

  So,
  $
    |E| <= sum_(v in C) deg(v) <= sum_(v in C) d = |C| d.
  $

  Therefore the size of the minimum vertex cover is at least $abs(E)\/d$.
  By Kőnig, this equals the size of the maximum matching in $G$.

  Thus, there exists a matching of size at least $abs(E)\/d$ in $G$.
]
