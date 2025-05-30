#import "@local/tinyset:0.2.1": *

= Showcase Activity

We will present some problems with which the reader can begin to ponder.
The solutions will also be provided, but the reader is encouraged to first turn to the @discussion[#text("Discussion Section")] in order to obtain the tools necessary for tackling the provided problems.

[NOTE: these are intended to be presented as physical artifacts with the showcase; we wish to help students build some intuition behind recurrence relations and recursion. ]

== Domino Tiling

How many ways we can tile a $2 times n$ space with $1 times 2$ tiles.

*Materials & Setup:*
We can use dominoes as our tiles.

#align(center)[
  [insert diagrams of both cases]
]

We see that there are two cases:
-
-

#heading(numbering: none, outlined: false, level: 3)[Guiding Questions]

Sketch a table of the space size $n$ and the corresponding number of tilings which fill that space.
Do you recognize this sequence?
#footnote[
  If you are ever working with a sequence in the wild, try seeing if it is documented in The On-Line Encyclopedia of Integer Sequences (OEIS). https://oeis.org/
]

Can you write down a relationship that describes how to get the next number of tilings in the sequence?

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

What are some other ways that we can build this sequence?

#proposition[
  The number of tiles follows the Fibonacci sequence.
]

[NOTE: we might want to remove this example because that will allow us to get rid of the sequence rule part; i think this example was mostly fun because we would get to play with colored tiles. ]

== Color Block Tiling

Let $h(n)$ be the number of ways to tile a $1 times n$ space with
- $1 times 1$ red and blue tiles; and
- $1 times 2$ green, yellow, and black tiles.

Find the number of ways to tile the space with the given tiles.

#proof[
  We will use the sequence rule to find the generating function for $h(n)$.

  Note that the empty space when $n=0$ has one tiling where we use no tiles, i.e., $h(0)=1$.

  We can establish the following recurrence relation for $n >= 2$,
  $
    h(n) = 2h(n-1) + 3h(n-2).
  $
]

Perhaps natural curiosity might lead us to next explore the combinatorial possibilities of a Tetris game.

How can we work with more complex shapes and arrangements?

[NOTE: the next examples are exploring the Catalan sequence]

== Parenthesis Puzzle

How many ways are there to arrange sequences of nested and matched parentheses?
#footnote[These are known as Dyck words.]

*Materials & Setup:*
Note cards with left and right parenthesis.
Or, some 3D-printed plastic parentheses that clip together.

[TODO: expand + provide examples]


== Binary Trees

How many binary trees are there with $n$ vertices?

*Materials & Setup:*


[TODO: define rooted binary trees]


== Polygon Triangulation

How many ways are there to cut a polygon along its diagonals into triangles.

*Materials & Setup:*
Wooden block some with pegs as polygon vertices.
Stretch rubber bands between pegs to create triangulations.

#heading(numbering: none, outlined: false, level: 3)[Guiding Questions]

How many triangles are in the triangulation of an polygon with $n$ sides ($n$-gon)?
// The triangulation of an $n$-gon has $n-2$ triangles.

#proposition[
  The number of ways to triangulate an $(n+2)$-sided polygon is the $n$-th Catalan number.
]

#proof[
  Let $T_n$ be the number of triangulations of an $n+2$-gon.

  Each triangulation is in exactly one of the following cases:
  - It is empty.
  - The triangulation contains an outside edge of the polygon, and has two triangulations to the left and right.

  Hence, there exists a weight-preserving bijection:
  $
    T -> {emptyset} union.sq {triangle} times T times T.
  $

  Therefore
  $
    F_(T)(x) = sum_(n=0)^(infinity) 1 / (n+1)binom(2n, n) x^n.
  $

  Thus, $|T_n| = c_n$, the $n$-th Catalan number.
]

#remark[
  We can also construct a proof with a bijection to binary trees.
]

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

Can you connect this problem to the previous one?
Hint: what happens if we draw points (vertices of a tree) on each of the triangles in the triangulation.
Can we connect these points to form a binary tree?
Can we do this for any triangulation?

