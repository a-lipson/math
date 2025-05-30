#import "@local/tinyset:0.2.1": *

#definition[
  $f : U -> V$ is a local bijection on $U$ for all $z in U$ if there exists an open disk $D subset U$ centered at $z$ such that $f : D -> f(D)$ is a bijection.
]

#problem[
  Prove $f: U -> V$ is a holomorphic local bijection on $U$ iff $forall z in U, #h(0.5em) f'(z) != 0$.
]

#proof[
  ($==>$)
  Since $f$ is a local bijection on $D -> f(D)$, then $f$ must be injective there as well.
  As seen in lecture#footnote[Proposition 8.1.1 in Stein & Shakarchi], if $f : U -> V$ is holomorphic and injective, then $forall z in U, f'(z) != 0$.

  Reconstructing the argument, suppose for a contradiction that $exists z_0 in U : f'(z_0) = 0$.

  For $z$ near $z_0$, since $f$ is analytic, we have
  $
    f(z) = f(z_0) + a(z-z_0)^k + G(z)
  $
  where $a != 0$, $k >= 2$, and $G = o(z^(k+1))$ near $z_0$.

  For small $w > 0$,
  $
    f(z)-f(z_0)-w = underbrace(a(z-z_0)^k - w, F(z)) + G(z).
  $

  Since $G = o(z^(k+1))$ near $z_0$, then for small $r$, $|G| < |F|$ on $partial D_r (z_0)$.

  So, by Rouché, $F$ and $G$ have the same number of zeros inside $D_r (z_0)$.

  But, $F$ has a $k$ zeros, so $f(z)-f(z_0)-w$ must have $k$ zeros in $D_r (z_0)$ as well, i.e., $f(z) = f(z_0) + w$ has multiple solutions there, contradicting the injectivity of $f$.

  ($<==$)
  // Assume $forall z_0 in U, f'(z_0) != 0$.
  Since $f$ is holomorphic at $z_0$ with $f'(z_0)!= 0$, then its analytic expansion contains a linear term,
  $
    f(z) = f(z_0) + a(z-z_0) + o((z-z_0)^k)
  $
  for $a != 0$, $k >= 1$.

  We can factor the above as
  $
    f(z)-f(z_0) = (z-z_0)h(z)
  $
  where $h$ is holomorphic with $h(z_0) = a$.

  Because $h$ is continuous and nonvanishing at $z_0$, then we can find a small disk $D subset U$ centered at $z_0$ where $h$ is nonvanishing in $U$.

  Hence, in $D$, $f(z) = f(z_0)$ only at $z_0$, so $f$ is injective there.
  By the Open Mapping Theorem, the image $f(D)$ is open because $f$ is nonconstant and holomorphic.

  So $f : D -> f(D)$ is a bijection on open sets.

  Since $z_0$ was arbitrary, we can perform this procedure for each $z_0 in U$ to see that $f$ is a local bijection.
]
