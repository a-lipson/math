#import "@local/tinyset:0.2.1": *

#problem[
  // Applying ideas of Carathéodory, Koebe gave a proof of the Riemann mapping theorem by constructing (more explicitly) a sequence of functions that converges to the desired conformal map.
  // Starting with a Koebe domain, that is, a simply connected domain $cal(K) subset D$ that is not all of $D$, and which contains the origin, the strategy is to find an injective function $f_0$ such that $f_0(cal(K)_0) = cal(K)_1$ is a Koebe domain "larger" than $cal(K)_0$.
  // Then, one iterates this process, finally obtaining functions $F_n = f_n compose dots.c compose f_0 : cal(K)_0 → DD$ such that $F_n(cal(K)_0) = K_n+1$ and $lim F_n = F$ is a conformal map from $cal(K)_0$ to $DD$.
  // The _inner radius_ of a region $cal(K) subset DD$ that contains the origin is defined by $r_(cal(K) = sup{rho >= 0 : D(0, rho) subset cal(K)}$.
  // Also, a holomorphic injection $f : cal(K) → DD$ is said to be an expansion if $f(0) = 0$ and $|f(z)| > |z|$ for all $z in cal(K)−{0}$.
  //
  // (a) Prove that if f is an expansion, then rf(K) ≥ rK and |f
  //
  // (0)| > 1. [Hint:
  // Write f(z) = zg(z) and use the maximum principle to prove that |f
  // (0)| =
  //
  // |g(0)| > 1.]
  // Suppose we begin with a Koebe domain K0 and a sequence of expansions
  // {f0, f1,...,fn,...}, so that Kn+1 = fn(Kn) are also Koebe domains. We then
  // define holomorphic maps Fn : K0 → D by Fn = fn ◦···◦ f0.
  // (b) Prove that for each n, the function Fn is an expansion. Moreover,
  // F
  // n(0) = n
  // k=0 f
  // k(0), and conclude that limn→∞ |f
  //
  // n(0)| = 1. [Hint: Prove
  //
  // that the sequence {|F
  //
  // n(0)|} has a limit by showing that it is bounded above
  //
  // and monotone increasing. Use the Schwarz lemma.]
  // (c) Show that if the sequence is osculating, that is, rKn → 1 as n → ∞, then
  // {Fn} converges uniformly on compact subsets of K0 to a conformal map
  // F : K0 → D. [Hint: If rF (K0) ≥ 1 then F is surjective.]
  // To construct the desired osculating sequence we shall use the automorphisms
  // ψα = (α − z)/(1 − αz).
  // (d) Given a Koebe domain K, choose a point α ∈ D on the boundary of K such
  // that |α| = rK, and also choose β ∈ D such that β2 = α. Let S denote the
  // square root of ψα on K such that S(0) = 0. Why is such a function well
  // defined? Prove that the function f : K → D defined by f(z) = ψβ ◦ S ◦ ψα
  //
  // 6. Problems 259
  // is an expansion. Moreover, show that |f
  //
  // (0)| = (1 + rK)/2
  //
  // √rK. [Hint: To
  // prove that |f(z)| > |z| on K−{0} apply the Schwarz lemma to the inverse
  // function, namely ψα ◦ g ◦ ψβ where g(z) = z2.]
  // (e) Use part (d) to construct the desired sequence.
]

#proof[

]
