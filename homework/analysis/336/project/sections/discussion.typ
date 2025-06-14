#import "@local/tinyset:0.2.1": *
#import "@preview/cetz:0.3.4"
#import "@preview/commute:0.3.0": *

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
Note that asymptotic equivalence requires constant.
// We can make cruder comparisons with benchmark functions.
// We use big and little "O" notations to relate the behavior of a given function $f$ to known functions:

=== Stirling's Formula

In fact, we have the following proposition that factorials grow faster than any of the above functions.

#proposition[
  Factorial grows faster than any exponential function.
]

We will need the following Theorem to prove the result.

#theorem[Stirling's Formula][
  $
    n! ~ sqrt(2pi n)(n / e)^n.
  $
]

#proof[Proposition][
  Let $a b^n$ be an exponential function. With Stirling's Formula, we have:
  $
    lim_(n -> infinity) n! / (a b^n) =
    lim_(n -> infinity) (sqrt(2pi n)(n / e)^n) / (a b^n) =
    lim_(n -> infinity) sqrt(2pi n) / (a) (n / (b e))^n = oo.
  $
  Since this limit diverges, then $n!$ grows faster than any $a b^n$.
]


== Generating Functions

Generating functions are objects known as formal power series, they are a formal sum--which means we are not actually performing any addition--that does not have to converge for all $x$.
#footnote[Generating functions are neither generating, nor functions.]
// So, moving forward, we will not be concerned with convergence.
// Formal power series invertible iff its constant term is invertible.

We have already seen how to capture combinatorial information using functions; now we will extend these functions to build generating functions.
We use generating functions to encode combinatorial rules as algebraic relations.

=== Uses for Generating Functions

Generating functions serve as a "mathematical machine" that transforms counting problems into algebraic problems.
Instead of working directly with sequences like $1, 1, 2, 5, 14, 42, ...$, we encode them as coefficients in a power series and use algebra to find patterns.

Some key uses are as follows:
- *Finding closed forms*: Turn recurrence relations into algebraic equations we can solve.
- *Proving identities*: Show that two different counting problems give the same answer.
- *Asymptotic analysis*: Extract growth rates of sequences.
- *Solving complex recurrences*: Handle cases where direct methods fail.

=== How weights become coefficients

This is the core idea: if an object has weight $w$, it contributes $x^w$ to the generating function.

Method:
#set enum(numbering: "1.", indent: 0em, spacing: 1em)
1. Each object gets a numerical weight (often size, but could be any property)
2. An object of weight $w$ becomes the monomial $x^w$
3. Objects with the same weight are collected; if there are $k$ objects of weight $n$, they contribute $k dot x^n$ total
4. The generating function is then
$
  sum_("all objects") x^("weight of object") = sum_(n=0)^oo "count of weight-"n "objecst" dot x^n
$

=== Producing Generating Functions

- *Direct counting*: Count objects by weight and write down the series.
- *Combinatorial constructions*: Use union and product rules (like the $S -> emptyset union.sq {star} times S times S$ pattern).
- *Recurrence relations*: Transform recursive formulas into generating function equations.
- *Known series*: Recognize patterns that match geometric series, binomial series, etc.

We will now transition into the technical construction of generation functions.

#definition[
  A recurrence relation is an equation that expresses each element of a sequence as a function of the preceding ones.
  For our purposes, a function $f$ satisfies a recurrence relation if we can expression $f$ on some input $n$ in terms of the value of $f$ on "previous" inputs.
  For example,
  $
    forall n, f(n+2) = f(n+1) + f(n)
  $
  is the recurrence relation for the Fibonacci sequence.
]

// #definition[
//   homogeneous linear recurrence
//   characteristic polynomial
// ]

#definition[
  Suppose $f$ is a function on the natural numbers.
  The generating function of $f$ is defined as follows:
  $
    F(x) = sum_(n=0)^(infinity) f(n) x^n = underbrace(f(0) + f(1)x + f(2)x^2 + dots.c, "contains all information from" f)
  $
  where the values of $f$ at $n$ are paired with the coefficients of $x^n$.
]


If ${A_n}$ is a sequence of finite sets, then we can define a generating function on the size of these sets
$
  F_(A)(x) = sum_(n=0)^(infinity) |A_n|x^n.
$

We can view the size of a set as a function that takes a set and returns the number of elements inside of the set.
More generally, we can consider a weight function $w : A -> NN$ that takes a set $A$ and produces a given natural value for each element in $A$.

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


== Some Sequences

We will now define in detail the sequences we have previously seen in @activity[Activity Section].

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

Given a functional recurrence relation on some function $f(n)$, we can perform the generating function transform to collapse the recursive equation into a direct relationship for a generating function $F(x)$. If we are lucky, we can then invert the transform to acquire a closed form for $f(n)$.

#figure(
  commutative-diagram(
    node((0, 0), $f(n)$),
    node((0, 1), $F(x)$),
    arr($f(n)$, $F(x)$, $cal(G)$, curve: 20deg),
    arr($F(x)$, $f(n)$, $cal(G)^(-1)$, curve: 20deg),
  ),
  caption: [Generation function transform ($cal(G)$) diagram.],
)

#align(center)[]

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

#remark[
  This proof uses several techniques. The key ideas are:
  #set enum(numbering: "1.", indent: 0em, spacing: 1em)
  1. Every binary tree is either empty or has exactly two subtrees.
  2. This recursive structure translates to the equation $F(x) = 1 + x F(x)^2$.
  3. Solving this quadratic gives us the Catalan numbers.

  Don't worry if the algebraic details are challenging; focus on understanding the recursive structure!
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

We will now turn to another

#definition[
  For $n in NN$, a partition of $n$ is a way to write $n$ as the sum of positive integers where the order of summation does not matter.
  #footnote[If the order of summation matters, then we have a strong composition.]
  As seen in @activity[Activity Section], partitions can be represented using Young diagrams.
]

#proposition[
  The number of partitions of $n$ with at most $k$ parts equals the number of partitions with largest part at most $k$.
]

#proof[Proposition][
  Consider the Young diagram of the partition.
  If a partition has $k$ parts, then there are $k$ rows in its diagram.
  If the largest part of a partitions is $k$, then there are $k$ columns in its partition.

  Transpose the Young diagram by flipping it across its central diagonal, swapping the number of rows and columns while maintaining the number of dots.
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
  We can specify any partition in $P_(<= k)$ uniquely by the number of $k$'s, $k-1$'s, ... , and 1's.

  Therefore, we have a weight-preserving bijection:
  $
    P_(<= k) -> underbrace(NN times NN times dots.c times NN, k "times"),
  $
  where the weight of each partition $(a_1,dots,a_k) = sum_(n=1)^k n a_n$ with the $a_n$ representing the number of $n$'s in the partition.

  Equivalently, we have a weight-preserving bijection:
  $
    P_(<= k) -> NN times 2NN times 3NN times dots.c times k NN
  $
  where $i NN = {0, i, 2i, 3i, dots}$ and the weight of $x in i NN$ is itself.

  So,
  $
    F_(P_(<= k))(x) = F_(NN)(x) F_(2NN)(x) dots.c F_(k NN)(x).
  $

  Then, we can obtain the generating function for each $F_(i NN)(x)$ using the geometric series:
  $
          F_(NN)(x) = sum_0^oo x^n & = 1 / (1-x)    \
      F_(2NN)(x) = sum_0^oo x^(2n) & = 1 / (1-x^2)  \
                                   & dots.v         \
    F_(k NN)(x) = sum_0^oo x^(k n) & = 1 / (1-x^k). \
  $

  Thus,
  $
    F_(P_(<= k))(x) = product_(j=1)^k 1 / (1-x^j),
  $
  #w5 to show.
]

If we let the maximum size of each part $k$ exceed any number, i.e., $k -> oo$, then we obtain the following theorem.
#theorem[Partitions Generating Function][
  Let $P$ be the set of all partitions weighted by sum.
  $
    F_(P)(x) = product_(k=1)^(infinity) 1 / (1-x^k).
    // #footnote[Be careful with infinite products; these objects can be very unwieldy.]
  $
]


