#import "@local/tinyset:0.2.1": *

#import "common.typ": *

= Project for Peers


== Additive Number Theory

Additive number theory is a branch concerned with the behavior of subsets of integers under addition.
We have already seen an object of interest, integer partitions.

Consider $k$ subsets of the nonnegative integers ${A_i}_(i=1)^k$ where $A_i subset NN$.
Then, we are interested in the number of solutions $r_(k)(n)$ to the following equation with $n in NN$:
$
  n = sum_(i=1)^(k) a_i, #h(1em) a_i in A_i.
$


=== Additive Problem Examples
Now, we will see a few examples of additive problems.

#example[
  Weak
  #footnote[
    Strong compositions have all parts positive integers.
  ]
  compositions of $n$ into $k$ parts with summands in $A$.
  #footnote[
    Compositions are not the same as integer partitions;
    $r_(k)(n)$ counts ordered tuples, while partitions count unordered multisets.
  ]

  Let $A subset NN$.
  Note that $forall a in A, #h(0.5em) 1 <= a <= n$, i.e., we cannot have a part of the partition greater than the sum.
  $
    r_(k)(n) = \# {(a_1,#sym.dots.h,a_k) in A^k | n = a_1+#sym.dots.h.c+a_k, #h(0.5em) a_i in A}.
  $

  When $A = NN$, using a "stars" and "bars" argument with $n$ stars and $k-1$ bars, we can show
  $
    r_(k)(n) = binom(n+k-1, k-1).
  $
]

#example[
  Goldbach's Conjecture, one of the oldest unsolved problems in number theory:
  #footnote[The conjecture has been shown to hold for all integers less than $4 dot 10^18$ as of 2025 according to Wikipedia.]
  any even natural number greater than 2 can be written as the sum of two primes.

  So, expressing this as in the above form, we write
  $
    r_2(n) = \# {(p,q) | n = p+q, #h(1em) p,q "prime"},
  $
  and the conjecture says that $forall n > 2, #h(0.5em) r_2(n) >= 1$.
  #footnote[
    The Weak Goldbach Conjecture posits that every odd number greater than 5 can be expressed as the sum of three primes, where a prime may be used more than once in the same sum.
    This conjecture was proven using the circle method by Harald Helfgott in 2013.
  ]
]

// #example[
//   Fermat's theorem on the sums of two squares: $p equiv 1 mod 4 iff p = x^2 + y^2$ where $x,y in NN$.
// ]

#example[
  Waring's problem: #footnote[Waring's problem is related to Fermat's polygonal number theorem.]
  Let $g(k)$ be the minimum number such that for all positive integers $n$, the equation
  $
    n = sum_(i=1)^(g(k)) a_i^k, #h(1em) a_i in NN
  $
  has at least one solution, i.e., $r_(g(k))(n) >= 1$.
  Here, we are considering both exponentiation and addition.


  Consider $7 = 1^2+1^2+1^2+2^2$. So, we have have that $g(2) >= 4$.
  One can check that with 23 we have $g(3) >= 9$ and with 79 we have $g(4) >= 19$.

  #remark[
    Lagrange's four-square theorem proves that exactly $g(2)=4$.
  ]
]


== Circle Method

Cited as the Hardy Ramanujan Littlewood Circle method technique in additive number theory
Our goal is to transform additive and combinatorics problems into complex analysis problems to use the tools of analysis. @circle-method-video
Indeed, quoting Hardy and Ramanujan's original paper, "This idea [studying integrals from generating functions] has dominated nine-tenths of modern research in analytic theory of numbers." @hardy-ramanujan1918

The circle method is aptly named by using Cauchy's theorem for series coefficients, Theorem 4.4 in Stein and Shakarchi, to represent the coefficients of generating function series as integrals around closed circular paths which package the information in their residues.


=== Example Application to Weak Compositions

We will use the circle method to find the number of weak compositions of $n$ into $k$ parts.

Begin with the case when $k=2$,
$
  r_2(n) = \# {(a_1,a_2) | n=a_1+a_2, #h(0.5em) a_1,a_2 in A}.
  #footnote[The \# notation returns the size of the given set.]
$

Construct the generating function using the indicator function for $A$:
$
  f(z) = sum_(n=0)^(infinity) bold(1)_A (n)z^n, #h(2em) "where" bold(1)_A (n) = cases(1 #h(1em) n in A",", 0 #h(1em) n in.not A.)
$
Now, using the Cauchy series product, we have
$
  f^2(z)
  = (sum_(n=0)^(infinity) bold(1)_A (n) z^n) (sum_(m=0)^(infinity) bold(1)_A (m) z^m)
  = sum_(n=0)^(infinity) c(n) z^n
$
where $c(n) = sum_(k = 0)^n bold(1)_A (k) bold(1)_A (n-k)$, which we can rewrite as $sum_(h+k = n) bold(1)_A (h) bold(1)_A (k)$.

Since $bold(1)_A (h) bold(1)_A (k) = 1$ iff both $h,k in A$, then this expression of $c(n)$ is exactly the number of pairs of $(h,k) in A^2$ which satisfy $h+k = n$.

Therefore, we have $f^2(x) = sum_(n=0)^(infinity) r_2(n) z^n$.

Now, consider a composition of $n$ into $k$ parts with summands in $A$,
$
  r_(k)(n) = \# {(a_1,#sym.dots.h,a_k) in A^k | n = a_1+#sym.dots.h.c+a_k, #h(0.5em) a_i in A}.
$

After repeated applications of Cauchy product, we can arrive at
$
  f^k (z) = sum_(n=0)^(infinity) r_(k)(n) z^n.
$

Since $f^k$ is holomorphic in $z$, then, with Cauchy's theorem for series coefficients, we have
#math.equation(block: true, numbering: "(1)")[
  $r_(k)(n) = 1 / (2 pi i) limits(integral.cont)_(C_rho) (f^(k)(z)) / (z^(n+1)) dd z$
]
for a circular closed loop $C_rho$ centered at the origin of radius $rho$.

Now, we can express the number of solutions $r_(k)(n)$ in terms of the residues of this integral.

From Example 1 above with $A = NN$, we already know that $r_(k)(n) = binom(n+k-1, k-1)$.

Since $A = NN$, We have
$
  f(z) = sum_(n=0)^(infinity) z^n = 1 / (1-z),
$
which converges for $|z|<1$.
So, by equation (1), we have $ r_(k)(n) = 1 / (2 pi i) limits(integral.cont)_(C_rho) (d z) / ((1-z)^k z^(n+1)), $
where the integral converges on the closed circular loop $C_rho$ of radius $rho < 1$.

We will extract the simple poles of the integral.

Using the general binomial expansion, we have
$
  1 / (1-z)^k = sum_(m=0)^(infinity) binom(-k, m)(-z)^m.
$

Hence, the integral becomes
$
  limits(integral.cont)_(C_rho) sum_(m=0)^(infinity) binom(-k, m) (-z)^m z^(-(n+1)) dd z.
$

So, we will take the terms for which $m-n-1 = -1 ==> m = n$.

Thus,
$
  r_(k)(n) = 1 / (2 pi i) limits(integral.cont)_(C_rho) binom(-k, n) (-1)^n z^(-1) dd z
  = (-1)^n binom(-k, n)
  = binom(n+k-1, k-1),
$
where the last equality is given by a combinatorial identity.
#footnote[This identity can be quickly shown by expressing both binomial coefficients in terms of falling factorials (Pochhammer symbols) and counting the appearances of -1.]





== Hardy-Ramanujan Estimation Formula

#theorem[Hardy-Ramanujan][
  Let $p(n)$ be the number of partitions of $n$.
  $ p(n) ~ exp(pi sqrt(2 n \/ 3)) / (4 sqrt(3) #h(0.25em) n). $
]

#proof[Hardy-Ramanujan][
  We have adapted a simplified version of the proof. @newman1962
  $
    f(z) = sum_(n=0)^(infinity) p(n) z^n = product_(m=1)^(infinity) 1 / (1-z^m), #h(1em) |z| < 1.
  $
]

#proposition[

]


