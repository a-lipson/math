#import "@local/tinyset:0.2.1": *
#import "@preview/cetz:0.3.4"

= Explanation for Peers

We will build on material from previous section, so the reader is recommended to ensure familiarity with the ideas presented there.
We will begin with a brief exploration of a kind of problem which, at first glance, does not appear to be related to the complex analysis that we have been studying this quarter.
Then, we will draw a connection between Number Theory problems and analysis techniques, in particular by demonstrating the Circle Method.


== Additive Number Theory

Additive Number Theory is a branch concerned with the behavior of subsets of integers under addition.
We have already seen one such object of interest, integer partitions.

More generally, we consider $k$ subsets of the nonnegative integers ${A_i}_(i=1)^k$ where $A_i subset NN$.
We are interested in the number of solutions $r_(k)(n)$ to the following equation with $n in NN$:
$
  n = sum_(i=1)^(k) a_i, #h(1em) a_i in A_i.
$

We use $r_(k)(n)$ as a function between naturals to capture information about the solutions. Later, we will expand this function to a function on complex numbers using generating functions.
This is the key step which allows us to bring in tools from analysis.


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
  Expressing the number of solutions as a set, we have
  $
    r_(k)(n) = \# {(a_1,dots,a_k) in A^k | n = a_1+dots.c+a_k, #h(0.5em) a_i in A}.
    #footnote[The \# notation returns the size of the given set.]
  $

  When $A = NN_(<= n)$, using a "stars" and "bars" argument with $n$ stars and $k-1$ bars, we can show
  $
    r_(k)(n) = binom(n+k-1, k-1).
  $
  // Consider, for a concrete example, lending money to friends. Here, order matters, and we can give nothing, that is zero dollars. The total sum of the lending must be equal to the sum of all lent amounts.
]

#example[
  Goldbach's Conjecture, one of the oldest unsolved problems in number theory: any even natural number greater than 2 can be written as the sum of two primes.
  #footnote[The conjecture has been shown to hold for all integers less than $4 dot 10^18$ as of 2025 according to Wikipedia.]

  So, expressing this as a set in the above form, we write
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
  Waring's problem: Let $g(k)$ be the minimum number such that for all positive integers $n$, the equation
  $
    n = sum_(i=1)^(g(k)) a_i^k, #h(1em) a_i in NN
  $
  has at least one solution, i.e., $r_(g(k))(n) >= 1$.
  Here, we are considering both exponentiation and addition.
  #footnote[Waring's problem is related to Fermat's polygonal number theorem.]


  Consider $7 = 1^2+1^2+1^2+2^2$. So, we have have that $g(2) >= 4$.
  One can check that with 23 we have $g(3) >= 9$ and with 79 we have $g(4) >= 19$.

  #remark[
    Lagrange's four-square theorem proves that exactly $g(2)=4$.
  ]
]


== Circle Method

The Hardy-Ramanujan-Littlewood Circle Method is a technique in additive number theory.
Our goal is to transform additive and combinatorics problems into complex analysis problems to use the tools of analysis. @circle-method-video
Quoting Hardy and Ramanujan's original paper, "This idea [studying integrals from generating functions] has dominated nine-tenths of modern research in analytic theory of numbers." @hardy-ramanujan1918

// Generating functions pack information in their residues.

From a high level, the method uses the Residue Theorem#footnote[Particularly in the form of Theorem 4.4 in Stein & Shakarchi] to represent the coefficients of a generating function series as integrals around closed circular paths inside the unit circle.
So, given a generating function $f(z) = sum a_n (z-z_0)^n$, we have
$
  a_n = 1 / (2pi i) limits(integral.cont)_(partial D(z_0)) (f(z)) / ((z-z_0)^(n+1)) dd z.
$
where $f$ is holomorphic in an open set $Omega$ with a disk $D$ centered at $z_0$ such that $overline(D) subset Omega$.

For the Circle Method, we will consider generating functions centered at $z_0=0$ with $Omega = DD$.
We will split up the circular paths of integration into "major" and "minor" arcs, where we get the main, often integrable, terms from the major arcs, and bounded error terms arise from minor arcs.


=== Example Application to Weak Compositions

We will use the circle method to find the number of weak compositions of $n$ into $k$ parts.

#heading(numbering: none, outlined: false, level: 4)[Setup]

Begin with the case where we have $k=2$ parts,
$
  r_2(n) = \# {(a_1,a_2) | n=a_1+a_2, #h(0.5em) a_1,a_2 in A}.
$

For each $a_i in A$, we can construct the generating function $f$ using the indicator function for $A$:
$
  f(z) = sum_(n=0)^(infinity) bold(1)_A (n)z^n, #h(2em) "where" bold(1)_A (n) = cases(1 #h(1em) n in A",", 0 #h(1em) n in.not A.)
$

Now, for $k=2$, using the Cauchy series product, we have
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
  r_(k)(n) = \# {(a_1,dots,a_k) in A^k | n = a_1+dots.c+a_k, #h(0.5em) a_i in A}.
$

After repeated applications of Cauchy product, we arrive at the generating function
$
  f^k (z) = sum_(n=0)^(infinity) r_(k)(n) z^n.
$

Since $f^k$ is analytic, then with Residue Theorem applied to series coefficients, we have
#math.equation(block: true, numbering: "(1)")[
  $r_(k)(n) = 1 / (2 pi i) limits(integral.cont)_(C_rho) (f^(k)(z)) / (z^(n+1)) dd z$
]
for a circular closed loop $C_rho$ of radius $rho$ centered at the origin.

Now, we can express the number of solutions $r_(k)(n)$ in terms of the residues of this integral.

// NOTE: hard-coded environment reference number!
From Example 2 above with $A = NN$, we already know that $r_(k)(n) = binom(n+k-1, k-1)$.
We will verify this using the Circle method.

#heading(numbering: none, outlined: false, level: 4)[Method Application]

Since $A = NN$, We have
$
  f(z) = sum_(n=0)^(infinity) z^n = 1 / (1-z),
$
which converges for $|z|<1$.
So, by equation (1), we have
$
  r_(k)(n) = 1 / (2 pi i) limits(integral.cont)_(C_rho) (d z) / ((1-z)^k z^(n+1)),
$
where the integral converges on the closed circular loop $C_rho$ of radius $rho < 1$.
Since we can evaluate this integral directly, then we can consider the entirety of $C_rho$ as our major arc, and we do not need to estimate any minor arcs.

Now, we will extract the nonzero residues, which come from the simple poles of the integral.
Using the General Binomial Expansion, we have
$
  1 / (1-z)^k = sum_(m=0)^(infinity) binom(-k, m)(-z)^m.
$

Hence, the integral becomes
$
  limits(integral.cont)_(C_rho) sum_(m=0)^(infinity) binom(-k, m) (-z)^m z^(-(n+1)) dd z.
$

So, for the simple poles, we will take the terms for which $m-n-1 = -1 ==> m = n$.

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
  $ p(n) ~ (exp pi sqrt(2 n \/ 3)) / (4 sqrt(3) #h(0.25em) n). $
]


#sketch[Hardy-Ramanujan][
  We will follow a simplified version of the original proof which performs analysis on an asymptotically similar function which is analytic inside the unit circle. @newman1962
  The simplified proof uses merely one major arc and more elementary estimates as opposed to modular forms and theta functions.

  The proof follows by careful analysis of the generating function given by the Partitions Generation Function Theorem,
  $
    f(z) = sum_(n=0)^(infinity) p(n) z^n = product_(m=1)^(infinity) 1 / (1-z^m), #h(1em) "for" |z| < 1 "where" p(0) = 1,
  $
  around the singularity $z=1$.
  Note that $f$ has poles at the roots of unity $z^n = 1$.

  The lower order roots will correspond to the more dominant poles, that is the pole at $z=1$ as the solution to $z-1$, followed by the pole at $z=-1$ for the additional solution to $z^2-1$, and then the two additional cube roots of unity from $z^3-1$, and so on.
  These poles correspond to black regions inside the unit circle in the following figure.
  Note that while the figure is colored for the reciprocal of $f$, we can still observe the relative impact of the poles.

  #figure(
    image(
      "figures/euler-q-series-integer-partition-complex-modulus-graph.jpeg",
      width: 50%,
    ),
    caption: [
      Modulus of Euler's $q$-series for integer partitions $product_(k=1)^oo (1-q^k)$ on the unit disk in the complex plane.
      #footnote[https://commons.wikimedia.org/wiki/File:Q-Eulero.jpeg]
    ],
  )


  We define a simpler auxiliary function which captures the asymptotic behavior of $f$:
  $
    phi(z) = sum q(n) z^n = ((1-z) / (2pi))^(1\/2) exp pi^2 / 12 (2 / (1+z) - 1).
  $

  We will show $p(n) approx q(n)$ and compute the latter directly.
  We approximate $f$ by $phi$ with
  $
    f(z) = phi(z)(1 + O(1-z))
  $
  for $|z|<1$ near 1, in particular $|1-z| <= 2(1 - |z|)$.
  This is proven using variation.

  We can show the bound
  #math.equation(block: true, numbering: "(1)")[
    $|f(z)| < exp (1 / (1 - |z|) + 1 / (|1-z|))$,
  ]
  using the logarithm on the product definition of $f$.

  We will then employ the Circle Method on the following integral:
  $
    p(n) - q(n) = 1 / (2pi i) limits(integral.cont)_C (f(z)-phi(z)) / (z^(n+1)) dd z.
  $

  We choose the circular path of integration $C$ with radius $1 - pi\/sqrt(6n)$, which approaches 1 as $n -> oo$.
  Since this path lies inside the unit circle, then $|z| < 1$ and the generating function $f$ will converge.
  // This region is positioned to balance accuracy of the estimate with converge of the integral.

  We split the circle into two parts:
  - the major arc $A = {z in C | |1-z| < pi sqrt(2\/3n)}$, which is the part of the circle $C$ near the dominant singularity of $f$ at $z=1$, and
  - the minor arc $B = C - A$, which is the rest of circle away form $z=1$.

  Asymptotically, the contribution of the minor arc will vanish exponentially fast, so we will be left with an approximation given by the integral around just the major arc.

  #figure(
    cetz.canvas({
      import cetz.draw: *
      let center = (0, 0)
      let radius = 2

      let arc_start = -15deg
      let arc_end = 15deg

      arc(
        center,
        radius: radius,
        start: arc_start,
        stop: (360deg + arc_end),
        stroke: blue,
        stroke-width: 0.02,
        name: "marc",
      )

      arc(
        center,
        radius: radius,
        start: arc_start,
        stop: arc_end,
        stroke: red,
        name: "arc",
      )

      circle("arc.mid", radius: 0.5, stroke: (dash: "dashed"))
      circle("arc.mid", radius: 0.025, name: "pole")

      // content("pole", [#text($z=1$, size: 8pt)], anchor: "west", padding: .2)

      content(
        "arc.end",
        [#text($A$, fill: red)],
        anchor: "south-west",
        padding: .2,
      )
      content(
        (name: "marc", anchor: 25%),
        [#text($B$, fill: blue)],
        padding: .2,
        anchor: "south-west",
      )
    }),
    caption: [
      Major $A$ and minor $B$ arcs of $C$.
    ],
  )

  For the minor arc $B$, using the exponential bound on $f$ from equation 2, we have the following estimate of asymptotic equivalence:
  $
    limits(integral)_B (f(z)-phi(z)) / (z^(n+1)) dd z
    &~ limits(integral)_B |z|^(-n) (exp pi^2 / (6|1-z|) + exp (1 / (1 - |z|) + 1 / (|1-z|))) dd z \
    &~ limits(integral)_B exp pi sqrt(n \/ 6) (exp pi / 6 sqrt(3n \/ 2) + exp 1 / pi (sqrt(3n \/ 2) + sqrt(6n) )) dd z\
    &= O(exp a sqrt(n) ) "where" a < pi sqrt(2 \/ 3).
  $

  For the major arc, with the length of $A$ as $O(n^(-1\/2))$,
  $
    limits(integral)_A (f(z)-phi(z)) / (z^(n+1)) dd z
    &~ limits(integral)_A |z|^(-n) |1-z|^(3\/2) exp pi / (6(1 - |z|)) dd z\
    &~ n^(-3\/4) exp (pi sqrt(n\/6) + pi sqrt(n\/6)) n^(-1\/2) \
    &= O(n^(-5\/4) exp pi sqrt(2n\/3) ). \
  $

  Therefore
  $
    p(n) = q(n) + O(n^(-5\/4) exp pi sqrt(2n\/3)).
  $
  Since this error is much smaller than the main asymptotic term of $q$, then we have $p ~ q$.

  Using the method of steepest descent, we have
  $
    pi sqrt(2) exp pi^2 / 12 phi(z) = (1-z) limits(integral)_RR exp (pi t sqrt(2 \/ 3) - (1-z)t^2) dd t
  $

  // We convert the right-hand term to a power series in $z$, exchanging series and integral,
  // $
  //   & (1-z) limits(integral)_RR exp (pi t sqrt(2 \/3) - t^2) sum_(k=0)^oo z^k t^(2k) / k! dd t \
  //   =& (1-z) sum_(k=0)^oo z^k limits(integral)_RR t^(2k) / k! exp (pi t sqrt(2 \/3) - t^2) dd t \
  // $

  The remainder of the proof is (even more so) heavily abridged.
  Comparing the power series in $z$ on both sides, we obtain
  $
    pi sqrt(2) exp (pi^2 \/ 12) q(n) &=limits(integral)_RR exp (pi t sqrt(2\/3) - t^2) (t^(2n) / n! - t^(2n-2) / (n-1)!) dd t \
    &~ (exp pi sqrt(2\/3 n)) / (sqrt(2 pi) n) limits(integral)_RR s exp (pi sqrt(2\/3) s - s^2 - 2sqrt(n) s ) (1 + s / sqrt(n))^(2n-2) (2 + s / sqrt(n) ) dd s
  $
  using the substitution $t = s + sqrt(n)$ and Stirling's formula for $n!$.

  Then,
  $
    lim_(n -> oo) e^(-2 sqrt(n) s) (1 + s / sqrt(n))^(2n-2) (2 + s / sqrt(n) ) = 2e^(-s^2).
  $

  The integral is dominated by a function $F$ whose integral converges over the reals, which enables the use of the Dominated Converge Theorem to take the above limit under the integral,
  $
    pi sqrt(2) exp (pi^2 \/ 12) q(n) &~ (exp pi sqrt(2\/3 n)) / (sqrt(2 pi) n) limits(integral)_RR 2 s exp (pi sqrt(2\/3) s - s^2 ) dd s.\
    &= (pi) / (2sqrt(6) n) exp (pi^2 \/ 12 + pi sqrt(2n\/3) ) \
    q(n) &~ (exp pi sqrt(2n \/ 3) ) / (4 sqrt(3) n),
  $
  which in turn yields the desired result for $p$.
]

#remark[
  The full proof relies on several more advanced analysis concepts:
  - Lebesgue's Dominated Convergence Theorem, which allows for the interchange of limits and integrals;
  - the method of steepest descent, which enables us to analyze complex functions by evaluating integrals instead;
  - as well as total variation of functions, which is useful in bounding terms.
]
