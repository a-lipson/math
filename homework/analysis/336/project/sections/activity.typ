#import "@local/tinyset:0.2.1": *
#import "@preview/cetz:0.3.4"

= Showcase Activity

We will present some problems for the reader can begin to ponder to build some intuition behind recurrence relations.
These problems are intended to be accompanied by physical artifacts with the showcase.

We will also provide the solutions, but we encouraged the reader to first turn to the @discussion[#text("Discussion Section")] to obtain the tools necessary for tackling the problems.

== Domino Tiling

How many ways we can tile a $2 times n$ space with $1 times 2$ tiles?

*Materials & Setup:*
We can use dominoes as our tiles and a narrow box for our space.

#figure(
  grid(
    columns: 2,
    column-gutter: 4em,
    cetz.canvas({
      import cetz.draw: *
      // line((0, 1), (1, 1), stroke: (paint: gray, thickness: 0.01))
      line((1, 0), (1, 2))
      line((0, 0), (0, 2))
      line((0, 2), (3, 2))
      line((0, 0), (3, 0))
      line((3, 0), (3.5, 0), stroke: (dash: "dotted"))
      line((3, 2), (3.5, 2), stroke: (dash: "dotted"))
      content((2.2, 1), [$2 times n - 1$])
    }),
    cetz.canvas({
      import cetz.draw: *
      // line((1, 0), (1, 2), stroke: (paint: gray, thickness: 0.01))
      line((2, 0), (2, 2))
      line((0, 1), (2, 1))
      line((0, 0), (0, 2))
      line((0, 2), (4, 2))
      line((0, 0), (4, 0))
      line((4, 0), (4.5, 0), stroke: (dash: "dotted"))
      line((4, 2), (4.5, 2), stroke: (dash: "dotted"))
      content((3.2, 1), [$2 times n - 2$])
    }),
  ),
  caption: [Domino tiling cases.],
)

We see that there are two cases:
-
-

#heading(numbering: none, outlined: false, level: 3)[Guiding Questions]

- Sketch a table of the space size $n$ and the corresponding number of tilings which fill that space.
  Do you recognize this sequence? #footnote[
    If you are ever working with a sequence in the wild, try seeing if it is documented in The On-Line Encyclopedia of Integer Sequences (OEIS). https://oeis.org/
  ]

- Can you write down a relationship that describes how to get the next number of tilings in the sequence?

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

- What are some other ways that we can build this sequence?

#proposition[
  The number of tiles follows the Fibonacci sequence.
]


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

#heading(numbering: none, outlined: false, level: 3)[Guiding Questions]

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

- How can we work with more complex shapes and arrangements?
  Perhaps natural curiosity might lead us to next explore the combinatorial possibilities of a Tetris game.

== Parentheses Puzzle

How many ways are there to arrange sequences of nested and matched parentheses?

For any prefix of the string of parentheses, the number of left opening parentheses is at least the number of closing right parentheses.
In the entire string, the number of left parentheses must be equal to the number of right parentheses.
These are sequences are known as Dyck words.

#let color-parens(content) = {
  show "(": txt => text(fill: blue, txt)
  show ")": txt => text(fill: red, txt)
  content
}
#figure(
  color-parens[ #text(size: 18pt)[((()))(()())] ],
  caption: [Example Dyck word.],
)

*Materials & Setup:*
Note cards with parentheses, colored red and blue.
Set one color as the left parentheses, and one color as the right.
Arrange the cards to form Dyck words.

#proposition[
  The number of Dyck words is the $n$-th Catalan number.
]

#proof[Proposition][
  Each Dyck word belongs to exactly one of the two following cases:
  - it is empty, or
  - it contains a matched pair of parentheses enclosing one Dyck word, and is followed by another, that is $(D_1) D_2$.

  Let $D$ be the set of all Dyck words, weighted by half the length of the string.
  Then, we have have weight-preserving bijection
  $
    D -> {} union.sq {()} times D times D.
  $

  So,
  $
    F_D (x) = 1 + x F_D (x)^2 ==> F_D (x) = (1-sqrt(1-4x)) / (2x) = sum_0^oo c_n x^n,
  $
  where $c_n$ is the $n$-th Catalan number.
]


== Polygon Triangulation

How many ways are there to cut a polygon along its diagonals into triangles where rotations are distinct?

*Materials & Setup:*
Wooden block with labeled pegs stuck in to represent polygon vertices.
Stretch rubber bands around the pegs to create triangulations.

#figure(
  cetz.canvas(length: 0.5cm, {
    import cetz.draw: *

    set-style(stroke: (thickness: 0.05))

    let draw-polygonal-triangluation(n, radius, diagonals) = {
      let vertices = ()

      for i in range(n) {
        let angle = i * 360deg / n + 90deg
        let x = radius * calc.cos(angle)
        let y = radius * calc.sin(angle)
        vertices.push((x, y))
      }

      for v in vertices { circle(v, radius: 0.1, fill: black) }

      line(..(vertices + (vertices.at(0),)))

      for (i, j) in diagonals { line(vertices.at(i), vertices.at(j)) }
    }


    group({
      translate((-5, 0))
      draw-polygonal-triangluation(5, 2, ((0, 2), (0, 3)))
    })

    group({
      draw-polygonal-triangluation(6, 2, ((1, 4), (2, 4), (0, 4)))
    })

    group({
      translate((5, 0))
      draw-polygonal-triangluation(7, 2, ((0, 2), (0, 3), (0, 4), (6, 4)))
    })
  }),
  caption: [Example polygonal triangulations.],
)

#heading(numbering: none, outlined: false, level: 3)[Guiding Questions]

How many triangles are in the triangulation of an polygon with $n$ sides ($n$-gon)?
// The triangulation of an $n$-gon has $n-2$ triangles.

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

- What if we do not label the pegs, that is consider rotations to be indistinguishable?
- How many ways can we loop rubber bands around the pegs such that rubber bands do not cross over one another?
  Label the pegs so as to consider rotations to be distinct from one another. These are called non-crossing partitions.
- Can we connect these points to form a binary tree? \
  Hint: what happens if we draw points (vertices of a tree) on each of the triangles in the triangulation.
- Can we do this for any triangulation?


#proposition[
  The number of ways to triangulate an $(n+2)$-sided polygon is the $n$-th Catalan number.
]

#proof[Proposition][
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

/*
== Polygonal Numbers

*Materials & Setup*

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

Can you find a formula for the $n$-th polygonal number of for a polygon of $s$ sides?
$
  P(s, n) = 1 / 2 ((s-2)n^2 - (s-4)n).
$
*/
