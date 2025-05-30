#import "@local/tinyset:0.2.1": *

#problem[
  For each of the following graphs, determine the vertex-connectivity and
  edge-connectivity of the graph.

  + Let $n$ be an odd positive integer.
    The directed graph with vertices ${0, 1, #sym.dots.h , n − 1}$, with a directed edge $i j$ if $j − i mod n in {1, 2,dots,(n−1) \/ 2}$.

  + Let $n$ be an odd positive integer.
    The directed graph with vertices ${0, 1, dots, n − 1}$, with
    - a directed edge $i j$ if $1 <= i < j <= n − 1$,
    - a directed edge $0 i$ if $i$ is odd, and
    - a directed edge $i 0$ if $i$ is even.
]

#proof[(a)][
  We will first determine the vertex connectivity $kappa$ and edge connectivity $kappa'$ of the underlying graph $G$.

  We have edges between vertices if there is a directed edge $i j$ or $j i$ in the digraph, described by the following two cases:
  - $i j$ exists if $j - i equiv k #h(0.25em) (mod n)$ where $k in {1,2,dots, (n-1)\/2}$, and
  - $j i$ exists if $i - j equiv ell #h(0.25em) (mod n)$ where $ell in {1,2,dots, (n-1)\/2}$.

  Note that the second condition in equivalent to $-(j - i) equiv -k equiv n - k #h(0.25em) (mod n)$.

  Since $k in {1,2,dots, (n-1)\/2}$, then $n - k in {n-1,n-2,dots, (n-1)\/2}$.

  Since $n$ is odd, then ${1,2, dots, (n-1)\/2} union {n-1,n-2,dots , (n-1)\/2} = {1,2,dots,n-1}$.

  Therefore, vertices $i$ and $j$ are connected iff $j - i equiv.not 0 #h(0.25em) (mod n) implies i != j$, which means that the underlying graph is the complete graph $K_n = G$.

  Thus, we have $kappa(G) = kappa'(G) = n-1$.

  Now, we will find the strong vertex and edge connectivity of the digraph.
  Since each vertex has an in-degree and an out-degree of exactly $(n-1) \/ 2$, then we can disconnect a vertex by removing $(n-1)\/2$ incident edges or adjacent vertices.

  // We will establish $(n-1)\/2$ as an upper bound for both connectivities.
  So, we must have that $kappa(G) <= (n-1)\/2$ and $kappa'(G) <= (n-1)\/2$.

  From the directed version of Menger's theorems, we have that
  strong connectivity equals the maximum $k$ such that every ordered pair of vertices $(x,y)$ has an $x y$-connector of size $k$, and similarly for strong edge connectivity with an $x y$-edge-connector of size $k$.

  So, it suffices to show that there are $x y$ vertex and edge connectors each of size $k$.

  We will construct connectors which are simultaneously edge and vertex connectors of size $(n-1)\/2$.

  Since the digraph has rotational symmetry, we will fix the first vertex at $0$ and consider the pair $(0,v)$ for some vertex $v in {1,2,dots, n-1}$.

  We will construct paths to any vertex $v$ backwards to $0$.

  From $0$, we have directed edges to all vertices in $S = {1,2, dots ,(n-1) / 2}$.

  Begin with the $(n-1) / 2$ inward edges to $v$, which are incident to the $(n-1) / 2$ vertices $v - 1, v - 2, dots, v - (n-1) / 2$ all $mod n$.
  If any of these vertices are in $S$, we have a unique path to zero, and hence we are done.

  Otherwise, we can connect the vertices adjacent to $0$, $v - i$ for $i in [1,(n-1) / 2]$,
  to the next unconnected vertex $u = v-(n-1) / 2 - i mod n$ through an inward edge.
  Since $v <= n-1$, then $u$ must belong to $S$ because $u <= n-1 - (n-1) / 2 - i <= (n-3) / 2 in S$.

  Since each of these $(n-1) / 2$ paths go through unique edges and vertices, then they are $(n-1) / 2$ strong edge and vertex connectors.

  Thus the digraph is $(n-1) / 2$ strong vertex and edge connected.
]

#proof[(b)][
  Let $G$ be the underlying graph of the digraph.
  We will first determine $kappa(G)$ and $kappa'(G)$.

  As in part $(a)$, the underlying graph is the complete graph $K_n$, so $kappa(G) = kappa'(G) = n-1$.

  Now, we will determine the strong vertex and edge connectivity of the graph.

  For strong vertex connectivity,
  If we delete vertex $1$, then vertex $0$ cannot reach vertex $2$, so the digraph is 1 strong vertex connected.

  For strong edge connectivity, if we delete the directed edge $01$, then the vertex $1$ becomes disconnected because $01$ is the only the inward directed edge to $1$.
  So the digraph is 1 strongly edge connected.
]
