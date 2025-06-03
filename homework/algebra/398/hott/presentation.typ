#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.3.4" as cetz: *
// #import "@preview/fletcher:0.5.8": diagram, edge, node
// #import "@preview/commute:0.3.0": arr, commutative-diagram, node
#import "diagram.typ": *

#import themes.simple: *

#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas,
  cover: cetz.draw.hide.with(bounds: true),
)
// #let fletcher-diagram = touying-reducer.with(reduce: (
//   arr,
//   ..args,
// ) => fletcher.diagram(..args, ..arr))

#show: simple-theme.with(aspect-ratio: "16-9")

= Some Visualizations

Homotopy Type Theory

// TODO: improve thesis statement.
_pictures are good_

== Types vs. Sets

#grid(
  columns: 2,
  column-gutter: 1em,
  [
    #align(center, [Sets])
    Sets contain elements.
    // caveat: empty set

    Elements belong to sets via membership ($in$).

    Sets may mix different kinds of elements.
    // ${1, (0,1), RR}$

    Sets are built from other sets.

    // Set membership is a proposition.
  ],
  pause,

  [
    #align(center, [Types])
    Types contain terms.
    // caveat: empty type

    Terms inhabit types via typing (:).
    #v(1.35em)
    Terms have exactly one type.
    #v(1.35em)
    Terms are built with constructors.

    // Type inhabitation is a computation.
  ],
)

== Common Types

#align(center, table(
  columns: 3,
  stroke: 0pt,
  row-gutter: 0.2em,
  column-gutter: 1em,
  [*Name*], [*Symbol*], [*Terms*],
  [empty], [$bb(0)$], [],
  [unit], [$bb(1)$], [$star$],
  [naturals], [$NN$], [$0, 1, 2, dots$],
  // familiar with the above up to this point.
  pause,
  [identity], [$x =_A y$], [depends],
  // for some type A.
))

#pause
#align(center, [
  Identity types may have no terms, one term, or even many!
])
// the identity function may have many terms.

== Curry Howard

//
#text(
  size: 32pt,
  $
    "Types" & <--> "Propositions" \
    "Terms" & <--> "Proofs"       \
  $,
)
#pause
#align(
  center,
  [
    #sym.therefore Constructing a term of a type is the same as proving a proposition.
  ],
)

== Homotopy

#align(center, cetz-canvas({
  import draw: *
  circle((0, 0), radius: 4, name: "circle")
  content("circle.north", [$A$], anchor: "south", padding: 0.5)
  let a = (-1.5, -1)
  let b = (1.5, 1)
  point(a, name: "a")
  // content("a", [$a$], anchor: "north-east", padding: .1)
  point(b, name: "b")
  line(a, b)
  for value in (-2, -1, 0, 1, 2) {
    curved-line(a, b, curve: value, stroke: (dash: "dotted"))
  }

  // bezier(a, b, (-2, 7), (4, 2), stroke: (dash: "dotted"))
  // bezier(a, b, (-1, 5), (3, 2), stroke: (dash: "dotted"))
  // bezier(a, b, (-1, 3), (2, 2), stroke: (dash: "dotted"))
}))

== Homotopy Type Theory

$
  "Types" & ~ "Spaces"          \
  "Terms" & ~ "Points in space" \
$

#align(center, cetz-canvas(length: 0.8cm, {
  import draw: *
  circle((0, 0), radius: (3.5, 2), name: "circle")
  content("circle.north", [$A$], anchor: "south", padding: 0.5)
  point((-1, 0), name: "x")
  content("x", [$x$], anchor: "east", padding: 0.4)
  point((1, 0), name: "y")
  content("y", [$y$], anchor: "west", padding: 0.4)
  (pause,)
  bezier("x", "y", (-0.25, -0.5), (0.25, 0.5), mark: (end: ">"), name: "id")
  // line("x", "y", mark: (end: "straight"), name: "id")
  content("id.mid", [#text(size: 16pt, $x = y$)], anchor: "south", padding: 0.3)
}))

Terms of the identity type $x = y$ are paths from $x$ to $y$.
// notice directionality!

== Concatenate Paths

// path concatenation is transitivity of equality.

#align(center, canvas(length: 0.8cm, {
  import draw: *

  circle((0, 0), radius: (5, 3.5), name: "circle")
  content("circle.north", [$A$], anchor: "south", padding: 0.5)

  point((-3, -0.5), name: "x")
  point((-1, 1.5), name: "y")
  point((1, -1.5), name: "z")
  point((3, 0.5), name: "w")

  content("x", [$x$], anchor: "east", padding: 0.4)
  content("y", [$y$], anchor: "south", padding: 0.4)
  content("z", [$z$], anchor: "north", padding: 0.4)
  content("w", [$w$], anchor: "west", padding: 0.4)

  line("x", "y", mark: (end: "straight"), name: "p")
  line("y", "z", mark: (end: "straight"), name: "q")
  line("z", "w", mark: (end: "straight"), name: "r")

  content("p.mid", [#text(size: 18pt, $p$)], anchor: "south-east", padding: .1)
  content("q.mid", [#text(size: 18pt, $q$)], anchor: "south-west", padding: .1)
  content("r.mid", [#text(size: 18pt, $r$)], anchor: "north-west", padding: 0)
}))

#align(center, canvas(length: 2cm, {
  import draw: *

  let positions = (
    w: (4.5, 0),
    x: (0, 0),
    y: (1.5, 0),
    z: (3, 0),
  )

  content(positions.x, [$x$])
  content(positions.y, [$y$])
  content(positions.z, [$z$])
  content(positions.w, [$w$])

  equals-line(positions.x, positions.y, name: "p")
  equals-line(positions.y, positions.z, name: "q")
  equals-line(positions.z, positions.w, name: "r")

  content("p.center", [$p$], anchor: "south", padding: 0.15)
  content("q.center", [$q$], anchor: "south", padding: 0.15)
  content("r.center", [$r$], anchor: "south", padding: 0.15)
}))

// homotopies between paths?


== Identity Type

The identity type has one constructor:
$
  "refl"_a : a =_A a " where " a : A.
$
#align(center, cetz-canvas(length: 0.8cm, {
  import draw: *
  circle((0, 0), radius: (3, 2.5), name: "circle")
  content("circle.north", [$A$], anchor: "south", padding: 0.5)
  point((-0.4, 0), name: "a")
  content("a", [$a$], anchor: "east", padding: 0.4)
  arc(
    "a",
    start: 180deg,
    stop: -180deg,
    radius: 0.5,
    mark: (end: ">"),
    name: "refl",
  )
  content(
    "refl.east",
    [#text(size: 16pt, $"refl"_a$)],
    anchor: "west",
    padding: 0.2,
  )
}))

== Path Induction

#align(center, cetz-canvas({
  import draw: *

  circle((0, 0), radius: (4, 3.5), name: "circle")
  content("circle.north", [$A$], anchor: "south", padding: 0.5)

  let center = (-2, 0)
  point(center, name: "a")
  content("a", [$a$], anchor: "east", padding: .3)

  arc("a", start: 180deg, stop: -180deg, radius: 0.3)
  for value in (0.5, 1, 1.6, 2.4) {
    arc(
      "a",
      start: 180deg,
      stop: -180deg,
      radius: value,
      stroke: (
        dash: "dotted",
      ),
      name: "arc" + str(calc.ceil(value)),
    )
  }

  point((name: "arc3", anchor: 35%), radius: 0.1, name: "x")
  content("x", [$x$], anchor: "north-east", padding: .1)
  (pause,)
  arc(
    "a",
    start: 180deg,
    // why isn't this quite 35%?
    stop: 180deg * .3,
    radius: 2.4,
    mark: (end: ">"),
  )
}))

== Simply Connectedness

#align(center, cetz-canvas({
  import draw: *

  circle((0, 0), radius: (4, 3.5), fill: gray.lighten(70%), name: "circle")
  content("circle.north", [$A$], anchor: "south", padding: 0.5)

  circle((0, 0), radius: 1.5, fill: white)

  let x = (-2.5, 0)
  let y = (2.5, 0)

  point(x)
  point(y)
  line(x, y, stroke: (paint: red), mark: (end: ">"))
  arc(x, start: 180deg, stop: 0deg, radius: vector.dist(x, y) / 2, mark: (
    end: ">",
  ))
}))


== Action on Paths

// #align(center, cetz-canvas({ }))

// == Commuting Diagrams

== Sections & Retractions


#align(center, cetz-canvas({
  import draw: *
  circle((0, 0))
}))

== Fibers

== Transports

// == Pairs

== Truncation Levels

Separate types by their equalities.

-2. Contractible $tilde.equiv bb(1)$ \
-1. Propositions $tilde.equiv "Eq"_NN$ \
#h(0.5em)\0. Sets $tilde.equiv NN$ \
#h(0.6em)$dots.v$

