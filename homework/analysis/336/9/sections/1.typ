#import "@local/tinyset:0.2.1": *

#lemma[Schwarz-Pick][
  $f: DD -> DD$ holomorphic,
  $
    abs(f'(z)) / (1-abs(f(z))^2) <= 1 / (1-abs(z)^2), #h(0.5em) z in DD.
  $
]

#problem[
  The Schwarz-Pick lemma is the infinitesimal version of an important observation in complex analysis and geometry.
  For complex numbers $w in CC$ and $z in DD$ we define the _hyperbolic length_ of $w$ at $z$ by
  $
    ||w||_z = abs(w) / (1-abs(z)^2),
  $
  where $|w|$ and $|z|$ denote the usual absolute values.
  This length is sometimes referred to as the Poincaré metric, and as a Riemann metric it is written as
  $
    d s^2 = abs(d z)^2 / (1-abs(z)^2)^2
  $
  The idea is to think of $w$ as a vector lying in the tangent space at $z$.
  Observe that for a fixed $w$, its hyperbolic length grows to infinity as $z$ approaches the boundary of the disk.
  We pass from the infinitesimal hyperbolic length of tangent vectors to the global hyperbolic distance between two points by integration.

  + Given two complex numbers $z_1$ and $z_2$ in the disk, we define the _hyperbolic distance_ between them by
    $
      d(z_1,z_2) = inf_(gamma) integral_0^1 ||gamma'(t)||_(gamma(t)) dd t,
    $
    where the infimum is taken over all smooth curves $gamma : [0, 1] -> DD$ joining $z_1$ and $z_2$.
    Use the Schwarz-Pick lemma to prove that if $f : DD -> DD$ is holomorphic, then
    $
      d(f(z_1),f(z_2)) <= d(z_1,z_2), #h(0.5em) forall z_1,z_2 in DD.
    $
    In other words, holomorphic functions are distance-decreasing in the hyperbolic metric.

  + Prove that automorphisms of the unit disk preserve the hyperbolic distance, namely
    $
      d(phi(z_1),phi(z_2)) = d(z_1,z_2), #h(0.5em) forall z_1,z_2 in DD.
    $
    and any automorphism $phi$.
    Conversely, if $phi : DD -> DD$ preserves the hyperbolic distance, then either $phi$ or $overline(phi)$ is an automorphism of $DD$.

  + Given two points $z_1, z_2 in DD$, show that there exists an automorphism $phi$ such that $phi(z_1) = 0$ and $phi(z_2) = s$ for some $s$ on the segment $[0, 1) subset RR$.

  + Prove that the hyperbolic distance between 0 and $s in [0, 1)$ is
    $
      d(0,s) = 1 / 2 log (1+s) / (1-s)
    $

  + Find a formula for the hyperbolic distance between any two points in the unit disk.
]

#proof[(a)][
  Let $z_1,z_2 in DD$.
  Let $gamma : [0,1] -> DD$ be a smooth curve joining $z_1, z_2$.

  Since $f : DD -> DD$ is holomorphic and hence continuous, then $gamma_f = f compose gamma$ is smooth curve joining $f(z_1), f(z_2)$.

  By Schwarz-Pick, since $f : DD -> DD$ is holomorphic, then for all $z in DD$,
  $
    abs(f'(z)) / (1-abs(f(z))^2) <= 1 / (1-abs(z)^2).
  $
  In particular, for all $z in gamma subset DD$,
  $
    ||gamma_f'||_(gamma_f) = abs((f(gamma))') / (1-abs(f(gamma)^2))
    = (abs(gamma') abs(f'(gamma))) / (1-abs(f(gamma))^2)
    <= abs(gamma') / (1-abs(gamma)^2) = ||gamma'||_(gamma).
  $

  Thus, $||gamma_f'(t)||_(gamma_(f)(t)) <= ||gamma(t)||_(gamma(t))$,
  which implies $d(f(z_1),f(z_2)) <= d(z_1,z_2)$ for all $z_1,z_2 in DD$.
]

#proof[(b)][
  (i) Let $phi in "Aut"(DD)$.
  By Theorem 8.2.2, $phi$ must be a composition of a conformal translation $psi_(alpha)$ and a rotation.
  We will show that hyperbolic distance is preserved in each of these cases, and hence in their composition as well.

  If $phi$ is a rotation, then hyperbolic distance is preserved; we have $|phi(z)| = |z|$ and $|phi'(z)| = 1$ for all $z in DD$, which gives that the hyperbolic length of any curve joining $z_1$ and $z_2$ is equal to the length of its image under $phi$.

  If $phi$ is the conformal translation $psi_(alpha)$, then $phi$ preserves the Reimann metric.
  We have
  $
    psi'_(alpha)(z) = (|alpha|^2 -1) / (1-overline(alpha)z)^2.
  $

  Let $w = phi(z)$ so $d w = phi'(z) d z$.
  We will show
  $
    abs(d w)^2 / (1 - abs(w)^2)^2 = abs(d z)^2 / (1 - abs(z)^2)^2.
  $

  First,
  $
    abs(d w)^2 = abs(phi'(z))^2 abs(d w)^2 = abs(1 - |alpha|^2)^2 / abs(1 - overline(alpha)z)^4 abs(d z)^2.
  $
  Then,
  $
    1 - abs(w)^2 =
    1 - abs((alpha-z) / (1 - overline(alpha)z))^2 =
    ((1-|alpha|^2)(1-|z|^2)) / abs(1-overline(alpha)z)^2.
  $
  Substituting back,
  $
    abs(d w)^2 / (1 - abs(w)^2)^2 =
    abs(1-overline(alpha)z)^4 / ((1-|alpha|^2)(1-|z|^2))^2
    abs(1 - |alpha|^2)^2 / abs(1 - overline(alpha)z)^4 abs(d z)^2 =
    abs(d z)^2 / (1 - abs(z)^2)^2,
  $
  as desired.

  Since hyperbolic distance is preserved in both cases, then it is preserved for any composition, which are all automorphisms of the unit disk.

  // TODO: finish part (ii)!
  (ii) Let $phi : DD -> DD$ be a map that preserves hyperbolic distance.
]

#proof[(c)][
  Let $z_1, z_2 in DD$.

  We will use the conformal translation to map $z_1$ to the origin and then a rotation to rotate the image of $z_2$ under the first map to the positive real axis.

  Consider the conformal translation automorphism of the unit disk $psi_(z_1)$ which maps $z_1 |-> 0$.
  Let $psi_(z_1)(z_2) = w = R e^(i theta)$ with $R in [0,1)$ be the image of $z_2$ under this map.

  Then, consider the automorphism rotation map $r$ defined by $z |-> e^(-i theta)z$, which maps $R e^(i theta) |-> R$.
  Now, let $s = R$ lies on the positive real axis inside the unit disk.

  Since the map $phi = r compose phi_(z_1)$ is a composition of automorphisms, then it is also an automorphism.

  Thus, we have an automorphisms $phi$ which maps $z_1 |-> 0$ and $z_2 |-> s in [0,1)$, as desired.
]

#proof[(d)][
  Let $gamma$ be a path from 0 to $s$.
  We will consider the straight line path on the real axis because the geodesic paths include straight lines through the origin.
  Furthermore, any $gamma$ that deviates from the real axis can be reflected across the real axis to get another path of the same hyperbolic length.
  The "average" of these two paths lies closer to the real axis, suggesting the real axis path is optimal.

  Therefore, we have
  $
    d(0,s) & = inf_(gamma) integral_0^1 abs(gamma'(t)) / (1-abs(gamma(t))^2) dd t \
           & = integral_0^s (d t) / (1 - t^2).                                    \
           & = 1 / 2 integral_0^s (1 / (1-t) + 1 / (1+t)) dd t                    \
           & = 1 / 2 [log (1+t) / (1-t)]_0^s                                      \
           & = 1 / 2 log (1+s) / (1-s),                                           \
  $
  #w5 to show.
]

#proof[(e)][
  Let $phi$ be an automorphism as in part (c) which maps $(z_1,z_2) |-> (0,s)$,
  and by part (b), $phi$ preserves hyperbolic distance.

  Since $s = |phi(z_2)| = psi_(z_1)(z_2)$, then, by part (d), we have
  $
    d(z_1,z_2) = 1 / 2 log (1+psi_(z_1)(z_2)) / (1-psi_(z_1)(z_2)),
  $
  which provides the hyperbolic distance for any two points $z_1,z_2$ in the unit disk.
]
