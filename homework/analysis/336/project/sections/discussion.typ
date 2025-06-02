#import "@local/tinyset:0.2.1": *
#import "@preview/cetz:0.3.4"

= Discussion for Students <discussion>

We will take a first leap into the realm of enumerative combinatorics.
Enumeration means finding the size of finite sets.
In particular, we want to know how the size of sets change according to certain parameters.

Let $A_n$ be a set parametrized by some natural number $n$.
// We place $n$ in the subscript position because...
We will assign a function $f$ to capture the size of the set and write $f(n) = |A_n|$.
Now, we can understand how the size of the set changes by understanding the behavior of the function $f$.

Note that we have defined $f$ to agree with the size of $A_n$ only for integers $n$.
However, if $f$ is a nice function, we can ask the question: what values might $f$ take on for non-integer arguments?

There are several main cases for how we work with $f$:
- we have an explicit formula for $f(n)$,
// number of permutations of $[n] = n!$.
- we have an approximation or asymptotic estimate for $f(n)$ as $n->oo$,
- we compare $f$ to another function which we already understand well, or
- we build a recurrence relation on the output of $f$.

== Asymptotic Behavior & Approximation

Asymptotic analysis allows us to simplify complex problems by focusing on how functions behave for large inputs toward infinity.
This is a form of abstraction #footnote[Abstraction is one of our most powerful tools in mathematics.] where we strip away less significant terms to expose the dominant behavior of the function.
Oftentimes, we make comparisons with benchmarks, such as the logarithmic, linear, quadratic, and exponential functions.

We write $f ~ g$ for asymptotic equivalence, that is when
$
  lim_(x -> infinity) f(x) / g(x) = 1,
$
meaning the functions grow at the same rate.

A polynomial function is asymptotically equivalent to its highest degree term:
$
  a x^2 + b x + c ~ a x^2.
$

Exponential functions grow faster than linear functions:
$
  a^n + b^n + n^c ~ b^n " where " a < b " and " 1 < b,
$
which grow faster than logarithmic functions:
$
  a x^b + c log x ~ a x^b " with " c > 0.
$


=== Stirling's Formula

#theorem[Stirling's Formula][
  $
    n! ~ sqrt(2pi n)(n / e)^n.
  $
]

#proposition[
  Factorial grows faster than any exponential function.
]
#proof[Proposition][
  Let $a b^n$ be an exponential function.
  $
    lim_(n -> infinity) n! / (a b^n) =
    lim_(n -> infinity) (sqrt(2pi n)(n / e)^n) / (a b^n) =
    lim_(n -> infinity) sqrt(2pi n) / (a) (n / (b e))^n = oo.
  $
  Since this limit diverges, then $n!$ grows faster than any $a b^n$.
]

Note that asymptotic equivalence requires constant.
We can make cruder comparisons with benchmark functions.
We use big and little "O" notations to relate the behavior of a given function $f$ to known functions:
$$

[TODO: populate the definitions of the following sections.]


== Generating Functions

#definition[
  recurrence relations
]

[NOTE: it would be beneficial to cut down on extra topics, so maybe we won't retain the following definition.]
#definition[
  homogeneous linear recurrence
  characteristic polynomial
]

#definition[
  Suppose $f:NN -> CC$.
  The generating function of $f$ is defined as follows:
  $
    F(x) = sum_(n=0)^(infinity) f(n) x^n = underbrace(f(0) + f(1)x + f(2)x^2 + #sym.dots.h.c, "contains all information from" f)
  $
]

Generating functions are objects known as formal power series, they are a formal sum--which means we are not actually performing any addition--that does not have to converge for all $x$.
#footnote[Generating functions are neither generating, nor functions.]
// So, moving forward, we will not be concerned with convergence.
// Formal power series invertible iff its constant term is invertible.

We use generating functions to encode combinatorial rules as algebraic relations.

If ${A_n}$ is a sequence of finite sets, then we can define a generating function on the size of these sets
$
  F_(A)(x) = sum_(n=0)^(infinity) |A_n|x^n.
$

We can view the size of a set as a function that takes a set and returns the number of elements inside of the set.
More generally, we can consider a weight function $w : A -> NN$ that takes a set and produces a given value $n$ for each element in $A$.

With a set $A$, possibly infinite, and a weight function $w$ on $A$, we can construct the generating function
$
  F_(A)(x) = sum_(a in A) x^(w(a)).
$

#example[
  Let $A_n$ be the set of all binary strings of length $n$ where $A_0$ is the empty string.
  Then $|A_n| = 2^n$ gives us that
  $
    F_(A)(x) = sum_(n=0)^(infinity) (2x)^n = 1 / (1-2x)
  $
  using the geometric series $sum x^n = 1 / (1-x)$.
]

[TODO: answer the following questions; they are prompts for writing.]

What are generating functions used for? What can we do with them?

How can we produce generating functions?


== Some Sequences

#definition[
  Fibonacci sequence $0, 1, 1, 2, 3, 5, 8, 13, dots$
  #footnote[https://oeis.org/A000045]
  The sequence is defined by the recurrence relation:
  $
    f(n+2) = f(n+1) + f(n)
  $
  with closed form:
  $ (phi^n - psi^n) / (phi - psi) ~ phi^n \/ sqrt(5) $, where $phi = (1+sqrt(5)) / 2$ is the golden ratio and $psi = (1-sqrt(5)) / 2$ is its conjugate.
  The above is produced by the generating function: $(1-x-x^2)^(-1)$.
]

#definition[
  Catalan sequence $1, 1, 2, 5, 14, 42, dots$
  #footnote[https://oeis.org/A000108]
  The sequence is defined by the recurrence relation:
  $
    c(0) = 1 " and " c(n) = (2(2n-1)) / (n+1) c(n-1) = sum_(i=1)^n c(i-1)c(n-i)
  $
  with closed form:
  $
    1 / (n+1)binom(2n, n) ~ 4^n / (n^(3\/2) sqrt(pi))
  $
  produced by the generating function;
  $
    (1-sqrt(1-4x)) / (2x).
  $
]

#proof[Catalan closed form][
  We will provide a combinatorial argument for $c_n = 1 / (n+1) binom(2n, n)$.

  We have that $c_n$ counts the number of lattice paths from $(0,0)$ to $(2n,0)$ where each step is of the form $(1,1)$ or $(1,-1)$, and the path never crosses the $y=0$ line.

  #figure(
    cetz.canvas(length: 0.5cm, {
      import cetz.draw: *

      set-style(stroke: (thickness: 0.05))

      let draw-dyck-path(steps) = {
        let points = ((0, 0),)
        let current = (0, 0)

        for step in steps {
          let next = if step == "U" {
            (current.at(0) + 1, current.at(1) + 1)
          } else { (current.at(0) + 1, current.at(1) - 1) }
          points.push(next)
          current = next
        }

        line(..points)

        for point in points { circle(point, radius: 0.05, fill: black) }

        line(
          (0, 0),
          (points.last().at(0), 0),
          stroke: (paint: gray, dash: "dotted"),
          name: "ground",
        )
      }

      draw-dyck-path(("U", "U", "U", "D", "D", "U", "D", "D", "U", "D"))
      content("ground.mid", [UUUDDUDDUD], anchor: "north", padding: .5)
      content("ground.start", [0], anchor: "north", padding: .2)
      content("ground.end", [$2n$], anchor: "north", padding: .2)
    }),
    caption: [Example lattice path.],
  )

  There are $binom(2n, n)$ lattice paths that never cross the $y=0$ line without any other restriction, that is $2n$ total steps, $n$ of which are up (or down).

  Let $b_n$ be the number of "bad" paths which cross $y=0$.
  Given a bad path, consider the first time it touches $y=-1$ and reflect all points to the right across $y=-1$.
  The resulting lattice line is a path from $(0,0)$ to $(2n,-2)$.

  Given a path from $(0,0)$ to $(2n,-2)$, we can go back to a bad path using the same process in reverse.
  Therefore, there exists a bijection between the set of bad paths to the set of paths from $(0,0)$ to $(2n,-2)$;
  there are $binom(2n, n-1)$ such paths, for all $2n$ steps, $n-1$ of these must be up steps.

  Therefore,
  $
    c_n & = binom(2n, n)- binom(2n, n-1)            \
        & = binom(2n, n)-(2n)! / ((n-1)!(n+1)!)     \
        & = binom(2n, n) - n / (n+1) (2n)! / (n!n!) \
        & = binom(2n, n)-n / (n+1)binom(2n, n)      \
        & = 1 / (n+1)binom(2n, n),                  \
  $
  #w5 to show.
]


=== Constructing Generating Functions from Recurrence Relations

==== Binary Trees

We can also acquire the Catalan numbers using binary trees and their generating function.

#definition[
  (Rooted) Binary trees are defined recursively as:
  - The empty set is a binary tree.
  - If $T_1$ and $T_2$ are binary trees, then $T_1 bullet T_2$ is binary tree.
  #figure(
    cetz.canvas(length: 0.5cm, {
      import cetz.draw: *

      let root = (0, 2)

      circle(root, radius: 0.15, fill: black)
      circle((-2, -1.5), radius: 1.5, name: "left")
      circle((2, -1.5), radius: 1.5, name: "right")
      line(root, "left.north")
      line(root, "right.north")
      content("left", [$T_1$])
      content("right", [$T_2$])
    }),
    caption: [Binary tree.],
  )
]
Each vertex of a binary tree can have a left child, a right child, neither, or both.

#proposition[
  The number of binary trees with $n$ vertices is $c_n$.
]

#proof[Proposition][
  Let $B$ be the set of all binary trees weighted by the number of vertices.

  Each binary tree is in exactly one of the following two cases:
  - it is empty, or
  - it has two children, $T_1,T_2 in B$.

  So, there exists a weight-preserving bijection:
  $
    B -> emptyset union.sq {bullet} times B times B.
  $

  Therefore,
  $
    F_(B)(x) & = x^0 + x^1 F_(B)(x)^2              \
           0 & = 1-F_(B)(x)+x F_(B)(x)^2           \
    F_(B)(x) & = (1 plus.minus sqrt(1-4x)) / (2x), \
  $
  where we use the Quadratic Formula to solve for $F_(B)(x)$.

  But, we need $F_(B)(x)$ to be a function with $F_(B)(0) = 1$ because there is one binary tree with zero vertices.

  So, we will take the following limit:
  $
    lim_(x -> 0) F_(B)(x) = 1 ==> cases(
      limits(lim)_(x -> 0) (1+sqrt(1-4x)) / (2x) & "DNE,",
      limits(lim)_(x -> 0) (1-sqrt(1-4x)) / (2x) &= lim_(x -> 0) ((-1 / 2)(-4)(1-4x)^(-1\/2)) / 2 = 1.
    )
  $

  Therefore $F_(B)(x) = (1 - sqrt(1-4x)) / (2x)$
  // = 1 + x + 2x^2 + 5x^3 + 14x^4 + dots.h.c $

  By the General Binomial Theorem, we have
  $
    (1-4x)^(1\/2) = sum_(n=0)^oo binom(1 \/ 2, n) (-4)^n x^n " where " binom(1 \/ 2, n) = cases(
      (-1)^(n-1) 2 / (4^n n)binom(2n-2, n-1) " , " & n>0,
      1 "," & n=0.
    )
  $

  Hence, initially extracting the $n=0$ term from the sum, we have
  $
    F_(B)(x) & = 1 / (2x)(1 - (1 + sum_(n=1)^oo (-1)^(n-1) 2 / (4^n n) binom(2n-2, n-1)(-4)^n x^n)) \
    &= 1 / (2x) sum_(n=1)^oo 2 / n binom(2(n-1), n-1) x^n \
    &= 1 / (x) sum_(n=0)^oo 1 / (n+1) binom(2n, n)x^(n+1) \
    &= sum_(n=0)^oo x^n / (n+1) binom(2n, n)
    ==> |B_n| = 1 / (n+1)binom(2n, n), \
  $
  #w5 to show.
]


#example[
  There are 14 binary trees with 4 vertices: $B_4 = 1 / 5 binom(8, 4) = 14$, find them all.
]

#remark[
  Once we recognize the recurrence relationship $S -> emptyset union.sq {star} times S times S$, then we can immediately conclude that we have the Catalan numbers.
  This fact is used to condense the proofs in the first section.
]

/*
#lemma[Sequence Rule][
  Let $A$ be a set with a weight function and no elements of weight 0.
  Let $A^*$ be the set of all finite sequences of elements of $A$, including the empty sequence, where the weight of a sequence is given by the sum of the weights of its elements.
  $
    F_(A^*)(x) = 1 / (1 - F_A (x)).
  $
]
// #footnote[A lemma is a proven result typically used to prove a theorem.]

#proof[
  Every set in $A^*$ belongs to exactly one of the following cases:
  - it is empty, or
  - its first element is in $A$, followed by an elements of $A^*$.

  So, we can construct a weight-preserving bijection,
  $
    A^* -> {(#h(0.25em))} union.sq A times A^*.
  $

  Hence, we have
  $
                 F_(A^*) (x) & = 1 + F_A (x) F_(A^*) (x) \
    (1- F_A (x)) F_(A^*) (x) & = 1                       \
                 F_(A^*) (x) & = 1 / (1 - F_A (x)).      \
  $
  Note that we can only divide formal power series with no constant term.
  Since we had that $A$ had no elements with weight 0, then its power series
]

#remark[
  If there were elements with weight zero, then we could create sequences with infinitely many zero-weighted elements.
]
*/

== Integer Partitions

[TODO: expand the section on integer partitions, and perhaps give some applications of the object.]

#definition[
  For $n in NN$, a partition of $n$ is a way to write $n$ as the sum of positive integers where the order of summation does not matter.
  #footnote[If the order of summation matters, then we have a strong composition.]
]

#definition[
  We can represent partitions with Young and Ferrers diagrams.
]

#proposition[
  The number of partitions of $n$ with at most $k$ parts equals the number of partitions with largest part at most $k$.
]

#proof[Proposition][
  Consider the Ferrers diagram of the partition.

  If a partition has $k$ parts, then there are $k$ rows in its diagram.

  If the largest part of a partitions is $k$, then there are $k$ columns in its partition.

  Transpose the Ferrers diagram by flipping it across its central diagonal, swapping the number of rows and columns while maintaining the number of dots.

  This flipped partition is known as the conjugate partition.

  Thus, we have a bijection between the set of partitions with $k$ parts and the set of partitions with largest part $k$.
]

#theorem[
  Let $P_(<= k)$ be the set of all partitions with all parts at most $k$, weighted by sum.
  $
    F_(P_(<= k))(x) = product_(j=1)^(k) 1 / (1-x^j).
  $
]

#proof[Theorem][

]


If we let the maximum size of each part $k$ exceed any number, i.e., $k -> oo$, then we obtain the following theorem.
#theorem[Partitions Generating Function][
  Let $P$ be the set of all partitions weighted by sum.
  $
    F_(P)(x) = product_(k=1)^(infinity) 1 / (1-x^k).
    // #footnote[Be careful with infinite products; these objects can be very unwieldy.]
  $
]


