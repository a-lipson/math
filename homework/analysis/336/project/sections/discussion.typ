#import "@local/tinyset:0.2.1": *

#import "common.typ": *

= Discussion for Students <discussion>

// TODO: collect content from 462 notes to put here

recurrence relations

== Generating Functions

#definition[
  recurrence relation
]

#definition[
  generating function
  $
    sum_(n=0)^(infinity) f(n) x^n
  $

]

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


== Integer Partitions

#definition[
  partition
]

#definition[
  Young and Ferrers diagrams
]

