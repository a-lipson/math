#import "@local/tinyset:0.2.1": *

#problem[
  Let $G$ be a simple graph, and let $v$ be a vertex of $G$.
  Let $G'$ be the graph obtained from $G$ by adding a new vertex $v'$ and drawing an edge from $v'$ to all the neighbors of $v$.
  Without using the strong perfect graph theorem, prove that $G$ is perfect iff $G'$ is perfect.
]

#proof[
  Recall that a graph $G$ is perfect iff for all induced subgraphs $H$ of $G$, $chi(H) = omega(H)$.

  ($==>$) Assume $G$ is perfect.
  Let $H'$ be any induced subgraph of $G'$.
  We will consider the following three cases for $H'$:
  #set enum(numbering: "1.", indent: 0em, spacing: 0.6em)
  1. $v' in.not H'$,
  2. $v' in H', v in.not H'$, and
  3. $v', v in H'$.

  First, if $H'$ does not contain $v'$, then $H'$ is also an induced subgraph of $G$ which is perfect, so $chi(H') = omega(H')$.

  Second, where $H'$ contains $v'$ but on $v$, let $H = H' - v' + v$. Since $v$ and $v'$ share the same neighborhood in $G'$ but are not adjacent, then any clique in $H'$ not containing $v$ corresponds to the same clique in $H$.
  Also, any clique in $H'$ containing $v'$ corresponds to a clique in $H$ where $v'$ is replaced by $v$.
  Therefore $omega(H') = omega(H)$.

  For coloring, any proper coloring of $H$ corresponds to a proper coloring of $H'$ by giving $v$ the same color as $v'$.
  Hence $chi(H') = chi(H)$.

  Since $G$ is perfect, then
  $
    chi(H') = chi(H) = omega(H) = omega(H'),
  $
  so $G'$ is perfect.

  Finally, where both $v'$ and $v$ are in $H$, we have that $v$ and $v'$ have an identical neighborhood $N(v)$ in $G'$.
  So, removing either $v$ or $v'$ gives the same clique number, that is
  $
    omega(H') = omega(H'-v') = omega(H'-v).
  $

  For coloring, we have that $chi(H')$ must be the maximum chromatic number of $H'-v$ and $H'-v'$, but since $v$ and $v'$ can take on the same color, then we have
  $
    chi(H') = chi(H'-v')=chi(H'-v).
  $

  Since both $H'-v'$ and $H'-v$ are induced subgraphs of $G$, then by the perfectness of $G$, we must have
  $
    chi(H'-v') = omega(H'-v') " and " chi(H'-v) = omega(H'-v).
  $

  Since the above two equalities are themselves equal, then we must have $chi(H') = omega(H')$, which implies that $G'$ is perfect.

  ($<==$) Assume $G'$ is perfect.
  Let $H$ be any induced subgraph of $G$.
  Since $G$ is a subgraph of $G'$, then $H$ is also an induced subgraph of $G'$.
  Since $G'$ is perfect, then $chi(H) = omega(H)$, so $G$ is perfect.
]
