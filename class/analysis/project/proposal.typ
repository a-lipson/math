#set page(
  header: [
    #grid(
      columns: (1fr, 1fr),
      align(left)[Math 336 Project Proposal],
      align(right)[lipson]
    )
    #line(length: 100%)
  ]
)

#set text(10.5pt)

= Math 336 Project Proposal

#grid(
  columns: (1fr, 1fr),
  align(left)[alexandre lipson],
  align(right)[2025-04-20],
)

#linebreak()

== I. Homotopy Type Theory

i think it would be really awesome to give an introduction to some of the cool ideas from HoTT, namely that we can have multiple different equalities between objects. i do also concede that a full rigorous exploration of these ideas is probably not only out of scope for the scale of this project, but also certainly out of scope for my own understanding of HoTT and topology. However, i would wish to inspire some curiosity and perhaps further study in the same way that watching an short form video on YouTube might, specifically with the question of how can two objects be equal in different ways. 

So, we would need a small background on type theory, simply just to say that there can be other foundations of maths aside from ZFC (that in of itself is an interesting idea) which use types and terms of these types. Then, connecting to HoTT, we would want to say that these types are spaces, and that terms are points on these spaces. 
This would then lead us to ask about topological spaces, and, in particular, homotopies.

==== Interactive Component

i think that an accessible exercise for understanding a homotopy would be very similar to some of the 334 exercises on deforming curves and interpolating between two functions. Once the students have built up a feeling for the mechanical nature of how we are able to manipulate curves, then we can move on to understanding what might prevent a curve from being deformed, i.e., a hole, and how that can lead to multiple distinct curves (not isomorphic up to homotopy), and therefore multiple equalities.

Specifically, i anticipate it will be fun to work with classical sets on a flat space, with one notion of equality, as well as types on a toroidal space, with two distinct curves.

==== Descriptive Component

As aforementioned, i think that this part of project would be more difficult as i do not yet have a firm grasp of the topology nor HoTT. However, this is precisely the content that i am working with in my WDRP group this quarter, so i am optimistic that i will have enough under my belt to talk about some of the concrete formalizations in addition to how, down the line, they will relate to the big ideas, such as defining types and terms to be topological spaces and the points on them.

#linebreak()

== II. Generating Functions

i want to take a closer look at the content i am learning in combinatorics. 
We are currently talking about generating functions, 
$ sum_(n=0)^(infinity) f(n) x^n $ where $f : NN -> RR$. 
We are looking at a number of problems which have recurrence relations that build the Fibonacci series as well as the Catalan numbers. 
i think it would be cool to provide an introduction to some of these combinatorics ideas, in particular, deriving closed forms from recurrence relations, such as with the Fibonacci numbers.
Furthermore, i would like to explore the ring of formal power series, and perhaps other types of formal series, such as formal Laurent series. Specifically, i am interested in learning how these series act as a completion of the polynomial ring in a topological space, however this might be out of scope.

==== Interactive Component

An introductory exercise to generating functions would be constructing the Fibonacci series from a recurrence relation through generating functions. This would require some familiarity with the calculus and geometric series as background. 

We can build up the intuition for finding recurrence relations from concrete examples, such as a tiling of a $2 times n$ space with $2 times 1$ dominoes. This kind of toy exercise should be no more than a page or two.

#v(5pt) 

#let box_rect(width, height, annotation: none) = {
  box(
    width: width * 1cm,
    height: height * 1cm,
    stroke: black + 1pt,
    inset: 5pt, 
    {
      if annotation != none {
        align(center + horizon)[#text(size: 10pt)[#annotation]] 
      }
    }
  )
}

#align(center)[
  #stack(
    dir: ltr,
    spacing: 2cm, 
    stack(
      dir: ltr,
      spacing: 0pt,
      box_rect(1, 2),
      box_rect(3.5,2, annotation: $2 times n-1$)
    )  ,
    stack(
      dir: ltr,
      spacing: 0pt,
      {
        stack(
          dir: ttb,
          spacing: 0pt,
          box_rect(2, 1),
          box_rect(2, 1)
        )
      },
      {
        stack(
          dir: ttb,
          spacing: 0pt,
          box_rect(3.5,         2, annotation: $2 times n-2$),
        )
      }
    )
  )
]

#v(5pt)

i think it would be fun to build some visualizations (perhaps using Desmos) about how our initial conditions change recurrence relations, just like how initial conditions affect constant in differential equations solutions.

==== Descriptive Component

Here, i would discuss the process for extracting a closed form of a homogeneous linear recurrence relation using generating functions, as well as consider other forms of recurrence relations that we might be able to work with. This will take less than 5 pages. 
i would also like to, if it is feasible, try to gain an understanding of the topological considerations of the formal power series ring in comparison to the finite polynomial ring. 

