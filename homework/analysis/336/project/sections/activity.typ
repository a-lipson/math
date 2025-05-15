#import "@local/tinyset:0.2.1": *

= Showcase Activity

We will present some problems which the reader can begin to ponder.
The solutions will also be provided, but the reader is encouraged to first turn to the @discussion[#text("Discussion Section")] in order to obtain the tools necessary for talking the provided problems.

[#emph[note that some of these are intended to be presented as physical artifacts with the showcase]]

== Domino Tiling

We want to know how many ways we can tile a $2 times n$ space with $1 times 2$ tiles.
We can use dominoes as our tiles.

#align(center)[
  [insert diagrams of both cases]
]

We see that there are two cases:
-
-

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

Perhaps the next natural curiosity might be to explore the combinatorial possibilities of Tetris games.

