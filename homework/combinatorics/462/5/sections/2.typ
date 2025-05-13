#import "@local/tinyset:0.2.1": *

#problem[
  Let $T$ be a tree with $t >= 2$ vertices.
  + Prove that if $G$ is a simple graph with all vertices of degree at least $t-1$, then $G$ is not $T$-free.
  + Prove that if $G=(V,E)$ is simple, with $|V| = n$ and $|E| >= (t-2)n + 1$, then $G$ is not $T$-free.
  + Conclude that $ "ex"(n,T) <= (t-2)n. $
]

#proof[(a)][
  We will embed $T$ into $G$ using induction on $t$, the number of vertices of $T$.

  For the base case $t=2$, $T$ is a single edge.
  Since all vertices in $G$ have degree at least $t-1=1$, then $G$ contain at least one edge, so $G$ contains as subgraph isomorphic to $T$.

  Assume the statement holds for $t>2$, and consider a tree $T$ with $t+1$ vertices.

  Choose any leaf $ell$ in $T$ and let $p$ be its parent vertex.
  Such a leaf always exists any any tree with more than two vertices.

  Let $T'=T-ell$. Note that $T'$ has $t$ vertices.

  By the inductive hypothesis, $G$ contains a subgraph $G'$ which is isomorphic to $T'$.

  Let the vertex $v$ in $G'$ correspond to the vertex $p$ in $T$.

  Since $v$ is in $G$, then it has degree at least $(t+1)-1=t$.

  Since $T'$ is a tree with $t$ vertices, then it has $t-1$ edges.

  So, $v$ has at most $t-1$ incident edges in $G'$.

  Therefore, $v$ must have at least one neighbor $w$ in $G$ that is not in $G'$.

  Now, map $ell$ in $T$ to $w$ in $G$, which gives us an embedded a subgraph of $G$ isomorphic to $T'$.

  Thus, by induction, if every vertex in $G$ has degree at least $t-1$, then $G$ contains a subgraph isomorphic to $T$.
]
#proof[(b)][
  By part (a), if every vertex of $G$ has degree at least $t-1$, then $G$ contains a subgraph isomorphic to $T$.

  So, assume $G$ contains a vertex $v$ of degree less than $t-1$.

  Consider $G' = G - v$.
  Then, $G'$ has $n-1$ vertices and at least $ (t-2)n+1-(t-2)=(t-2)(n-1)+1 $ edges because $v$ was incident to at most $t-2$ edges.

  If we have removed all vertices of degree less than $t-1$, then we have achieved a subgraph isomorphic to $T$ by part (a).

  Otherwise, we can repeat this process up to $n-t$ times to a graph with only $t$ vertices remaining.

  After removing $n-t$ vertices, each with degree at most $t-2$, then we have at least $ (t-2)n + 1 - (n-t)(t-2) = (t-2)t + 1 $ edges remaining.

  But, a simple graph of $t$ vertices can have at most $t(t-1) / 2$ edges.

  However,
  $
    (t-2)t + 1 - t(t-1) / 2
    = t^2 - 2t + 1 - t^2 / 2 + t / 2
    = (t^2 - 3t + 2) / 2,
  $
  which is indeed positive for all $t>2$, so such a graph would have more than the maximum possible number of edges, which is a contradiction.

  Hence $G$ must not have had any vertices with degree less than $t-1$, which again by part (a), means that $G$ is not $T$-free.

  For $t=2$, we have a single edge, so $G$ is directly isomorphic to $T$.

  Thus, for a graph $G$ with $n$ vertices and at least $(t-2)n + 1$ edges, $G$ must have a subgraph isomorphic to $T$.
]
#proof[(c)][
  Recall that $"ex"(n, T)$ is the maximum number of edges in a $T$-free $n$-vertex graph.

  From part (b), we have that any such graph with $n$ vertices and at least $(t-2)n+1$ edges contains a subgraph isomorphic to $T$.

  Therefore, a $T$-free graph with $n$ vertices can have at most $(t-2)n$ edges.
  Thus, $ "ex"(n, T) <= (t-2)n. $
]
