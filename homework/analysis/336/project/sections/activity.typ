#import "@local/tinyset:0.2.1": *
#import "@preview/cetz:0.3.4"

= Showcase Activity

We will present some problems for the reader to ponder and build some intuition behind recurrence relations.
These problems are intended to be accompanied by physical artifacts with the showcase.

We will also provide the solutions, but the reader in encouraged to first turn to the @discussion[#text("Discussion Section")] to obtain the tools necessary for tackling the problems.

== Domino Tiling

How many ways we can tile a $2 times n$ rectangular space with $1 times 2$ tiles?

*Materials & Setup:*
We can use dominoes as our tiles.

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
) <fib-tilings>

#heading(numbering: none, outlined: false, level: 3)[Guiding Questions]

- Sketch a table of the space size $n$ and the corresponding number of tilings which fill that space.
  Do we recognize this sequence? #footnote[
    If you are ever working with a sequence in the wild, try seeing if it is documented in The On-Line Encyclopedia of Integer Sequences (OEIS). https://oeis.org/
  ]
- Can we write down a relationship that describes how to get the next number of tilings in the sequence?
  Does this relationship match the possible cases in the above @fib-tilings?
- If we have a tiling of a $2 times (n-1)$ space, in how many ways can you extend it to tile a $2 times n$ space?
  What about starting from a $2 times (n-2)$ space?
  Could we have written down this relationship by building a recursive definition of the tilings?

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

- What are some other ways that we can build this sequence?
- If the dominoes come in $k$ different colors, how many ways can we tile a $2 times n$ space?
- What happens with a $3 times n$ space using the same $1 times 2$ dominoes? \
  (This is tricky; explore small cases.)
- More generally, what happens if we change the shape of our dominoes? \
  What about if we change the size of our tiling space?

#proposition[
  The number of tiles follows the Fibonacci sequence.
]

/*
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

How can we define a set of the tiles?

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

- How can we work with more complex shapes and arrangements?
  Perhaps natural curiosity might lead us to next explore the combinatorial possibilities of a Tetris game.
*/

== Parentheses Puzzle

How many ways are there to arrange sequences of nested and matched parentheses?

For any prefix of the string of parentheses, the number of left parentheses is at least the number of right parentheses.
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
Notecards with parentheses, colored with two colors, e.g. red and blue.
Set one color as the left parentheses, and one color as the right.
Arrange the cards to form Dyck words.

#heading(numbering: none, outlined: false, level: 3)[Guiding Questions]

- Let's start small: how many valid arrangements are there with 1, 2, or 3 pairs of parentheses?
  Create a systematic list for each case using your colored cards.
- Use the cards to build all possible arrangements for 3 pairs.
  Can we group them by some common structure?
- What makes a sequence "invalid"?
  Try to construct some invalid sequences and identify exactly where they break the rules.
- For any valid sequence, what happens if we remove the first left parenthesis and its matching right parenthesis?
- Can we find a pattern: if we know the number of valid sequences for smaller cases,
  how might we build up to larger cases? (This is tricky.)

#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

- *Mountain ranges*: Draw each parenthesis sequence as a path where "(" means "go up" and ")" means "go down."
  What do valid sequences look like as paths?
- *Ballot problem*: In an election, candidate A receives $n$ votes and candidate B receives $n$ votes.
  If votes are counted one by one, in how many ways can A always be ahead or tied throughout the counting?
- *Binary trees*: Can we connect Dyck words to binary trees?
  How might parentheses represent the structure of a tree?
- *Stack operations*: If "(" represents "push" and ")" represents "pop" on a stack,
  what do valid sequences represent in terms of stack behavior?
- *Generalizations*: What if we had more types of brackets, e.g. (), [], {}? \
  What if we required that () must be nested within [] which must be nested within {}?


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
    D -> {} union.sq {()} times D times D,
  $
  and we can conclude by the proof of Proposition 5.
  // NOTE: hard-coded environment reference number!
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

- How many triangles are in the triangulation of an polygon with $n$ sides ($n$-gon)?
// The triangulation of an $n$-gon has $n-2$ triangles.
- Pick one vertex of your polygon. In any triangulation, how many triangles must include this vertex?
  What does this tell us about the structure?
#heading(numbering: none, outlined: false, level: 3)[Extension Questions]

- What if we do not label the pegs, that is consider rotations to be indistinguishable?
- How many ways can we loop rubber bands around the pegs such that rubber bands do not cross over one another?
  Label the pegs so as to consider rotations to be distinct from one another. These are called non-crossing partitions.
- Can we connect these points to form a binary tree? \
  Hint: what happens if we draw points (vertices of a tree) on each of the triangles in the triangulation.
  Can we do this for any triangulation?
- *Associativity*: Can you connect polygon triangulations to different ways of associating the product $a_1 dot a_2 dot a_3 dots.c a_n$, that is placing parentheses around the terms?


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
    T -> emptyset union.sq {triangle} times T times T,
  $
  and we can conclude by the proof of Proposition 5.
  // NOTE: hard-coded environment reference number!
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
