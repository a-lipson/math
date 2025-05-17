#import "@local/tinyset:0.2.1": *

= Discussion for Students <discussion>

We will take a first leap into the realm of enumerative combinatorics.
Enumeration means finding the size of finite sets.
In particular, we want to know how the size of sets change according to certain parameters.

Let $A_n$ be a set parametrized by some natural number $n$.
// We place $n$ in the subscript position because...
We write $f(n) = |A_n|$, assigning some function $f$ which capture the size of the set.

Now, we can understand how the size of the set changes by understanding the behavior of the function $f$.

Note we have defined $f$ to agree with the size of $A_n$ only for integer values of $n$.
What values might $f$ take on for non-integer arguments?

There are several main cases for how we work with $f$:
- We have an explicit formula for $f(n)$.
// number of permutations of $[n] = n!$.
- We have an approximation or asymptotic estimate for $f(n)$ as $n->oo$.
- We compare $f$ to another function which we understand.
- We build a recurrence relation on the output of $f$.

[TODO: ensure intro covers all topics which we decide to retain.]

== Asymptotic Behavior & Approximation

Asymptotic analysis allows us to simplify complex problems by focusing on how functions behave toward infinity.

This is a form of abstraction #footnote[Abstraction is one of our most powerful tools in mathematics.] where we strip away less significant terms to reveal the behavior of the function.

Oftentimes, we make comparisons with benchmark functions, such as logarithmic, linear, quadratic, and exponential.

We write $f ~ g$ when $lim_(x -> infinity) f(x) \/ g(x) = 1$.

We use big and little "O" notations to relate the behavior of a given function $f$ to these known functions.


=== Stirling's Formula

#theorem[Stirling's Formula][
  $
    n! ~ sqrt(2pi n)(n / e)^n.
  $
]

#proposition[
  Factorial grows faster than any exponential function.
]
#proof[Proposition 2][
  Let $a b^n$ be an exponential function.
  $
    lim_(n -> infinity) n! / (a b^n) =
    lim_(n -> infinity) (sqrt(2pi n)(n / e)^n) / (a b^n) =
    lim_(n -> infinity) sqrt(2pi n) / (a) (n / (b e))^n = oo.
  $
  Since this limit diverges, then $n!$ grows faster than any $a b^n$.
]


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

=== Constructing Generating Functions from Recurrence Relations

[NOTE: do we wish to remain this level of detail? i think it might be excessive; the sequence rule is put in place for the color block tiling problem.]

#theorem[Sequence Rule][
  Let $A$ be a set with a weight function and no elements of weight 0.
  Let $A^*$ be the set of all finite sequences of elements of $A$, including the empty sequence, where the weight of a sequence is given by the sum of the weights of its elements.
  $
    F_(A^*)(x) = 1 / (1 - F_A (x)).
  $
]

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


== Some Sequences

#definition[
  Fibonacci sequence
  - recurrence relation $f(n+2) = f(n+1) + f(n)$.
  - generating function $1 / (1-x-x^2)$.
  - closed form
  - asymptotics
]

[TODO: expand upon the Catalan numbers.]

#definition[
  Catalan sequence,
  - recurrence relation
  - generating function
  - closed form $1 / (n+1)binom(2n, n)$.
  - asymptotics
]


== Integer Partitions

[TODO: expand the section on integer partitions, and perhaps give some applications of the object.]

#definition[
  For $n in NN$, a partition of $n$ is a way to write $n$ as the sum of positive integers where the order of summation does not matter.
  #footnote[If the order of summation matters, then we have a strong composition.]
]

#definition[
  We can represent partitions with Young and Ferrers diagrams.
]

#theorem[
  Let $P_(<= k)$ be the set of all partitions with all parts at most $k$, weighted by sum.
  $
    F_(P_(<= k))(x) = product_(j=1)^(k) 1 / (1-x^j).
  $
]

#proposition[
  The number of partitions of $n$ with at most $k$ parts equals the number of partitions with largest part at most $k$.
]

#proof[Proposition 1][
  Consider the Ferrers diagram of the partition.

  If a partition has $k$ parts, then there are $k$ rows in its diagram.

  If the largest part of a partitions is $k$, then there are $k$ columns in its partition.

  Transpose the Ferrers diagram by flipping it across its central diagonal, swapping the number of rows and columns while maintaining the number of dots.

  This flipped partition is known as the conjugate partition.

  Thus, we have a bijection between the set of partitions with $k$ parts and the set of partitions with largest part $k$.
]

If we let the maximum size of each part $k$ exceed any number, i.e., $k -> oo$, then we obtain the following theorem.
#theorem[
  Let $P$ be the set of all partitions weighted by sum.
  $
    F_(P)(x) = product_(k=1)^(infinity) 1 / (1-x^k).
    #footnote[Be careful with infinite products; these objects can be very unwieldy.]
  $
]


