#import "@local/tinyset:0.2.1": *

#problem[
  The _distance_ $d(x, y)$ between two vertices $x, y$ of a graph is the number of edges in the shortest path between the two vertices.

  The _diameter_ of a graph is the maximum of $d(x, y)$ over all pairs of vertices $x, y$.

  Let $G = (V, E)$ be a graph with $kappa(G) = k > 0$ and diameter $D$.

  + Prove that $|V| ≥ k(D − 1) + 2$.

  + Prove that the largest independent set of G has size at least $ceil((D+1)\/2)$.

  + For each $k ≥ 1$ and $D ≥ 2$, construct a graph with connectivity $k$ and diameter $D$ for which equality holds simultaneously in (a) and (b).
]

#proof[(a)][
  Since the diameter of $G$ is $D$, then the distance between any two vertices is at most $D$.
  A path of distance $D$ contains $D-1$ internal vertices.

  Since $G$ is $k$-connected, then by Menger, there exists a $k$-connector between any two vertices of $G$.

  Since a $k$-connector in $G$ consists of $k$ pairwise internally disjoint paths of distance at most $D$, then it contains $k(D-1)$ internal vertices.

  Now, adding the two endpoints of this $k$-connector, we must have $|V| >= k(D+1) + 2$, as desired.
]

#proof[(b)][
  Since the diameter is $D$, then there exists a path connecting $D+1$ vertices.

  We can construct an independent set by taking every other vertex of this path.

  If these vertices were adjacent, then we could have constructed a path between the endpoints of distance less than $D$, a contradiction.
  So, these vertices form an independent set.
  // These vertices form an independent set because the vertices in the selection are separated by at least one vertex in the original path.

  If $D$ is even, then we have $D / 2 + 1$ independent vertices. \
  If $D$ is odd, then we have $(D+1) / 2$ independent vertices.

  In both cases, we have $ceil((D+1) / 2)$ vertices in the independent set.
]

#proof[(c)][
  To start, consider a graph constructed by $k$ parallel internally disjoint paths:
  $
    v_(i,1), v_(i,2), #sym.dots.h, v_(i,D-1) "where" i in [1,k],
  $
  of length $D-1$ each joined at both ends by two vertices.

  This graph has exactly $k(D-1) + 2$ vertices.

  However, for $k$ connectivity, each vertex must have degree at least $k$.

  So, for each $j$ in $v_(i,j)$, we can connect the vertices across all $i in [1,k]$ to construct a copies of the complete graph $K_k$.

  Since we still have $k$ pairwise internally disjoint paths, then by Menger, this graph is $k$-connected.

  As before, we can take alternating vertices in any of the $k$-connector paths to construct an independent set of size $ceil((D+1)\/2)$.
  Each vertex $v_(i,j)$ is connected to all other vertices $v_(tilde(i),j)$ at the same $j$ level $forall i,tilde(i) in [1,k]$, so we cannot obtain a larger independent set.

  Therefore, a graph with $D-1$ copies of $K_k$ all vertices connected in a line to their corresponding vertex in the adjacent copy with two additional vertices connected to the complete graph copies on ends will satisfy the requirements.
]
