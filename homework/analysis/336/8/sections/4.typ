#import "@local/tinyset:0.2.1": *

#import "@preview/commute:0.3.0": arr, commutative-diagram, node

#problem[
  + Prove if $f:DD -> DD$ is analytic with two fixed points, then $f$ is the identity function.
  + Must every holomorphic map $f:DD -> DD$ have a fixed point?
]

#proof[(a)][
  Consider the biholomorphic automorphism $psi_alpha : DD -> DD$/* defined by $z |-> (alpha - z) / (1 - overline(alpha) z)$ */, which maps $0 |-> alpha$ and $alpha |-> 0$.

  Let $z$ and $omega$ be fixed points of $f$.

  Consider the map $phi = psi_(z) compose f compose psi_(z)$, which fixes the origin because $0 limits(|->)^(psi_z) z limits(|->)^(f) z limits(|->)^(psi_z) 0$.

  Let $tilde(omega)$ be the preimage of $omega$ under $psi_z$, that is $psi_z (tilde(omega)) = omega$.
  Since we have $tilde(omega) limits(|->)^(psi_z) omega limits(|->)^(f) omega limits(|->)^(psi_z) tilde(omega)$, then $tilde(omega)$ is another fixed point of $phi$.

  Note that $tilde(omega) != 0$, otherwise $tilde(omega)$ would map to $z$ under $psi_z$, which is a contradiction with the assumption that $f$ had two distinct fixed points.


  Since $phi(0) = 0$ and $phi(tilde(omega)) = tilde(omega) ==> abs(phi(tilde(omega))) = abs(tilde(omega))$, then by Schwarz, $phi$ is a rotation.
  But, the second fixed point $tilde(omega)$ means that we must have a rotation by zero, otherwise there would only be one fixed point.
  Hence, $phi$ must be the identity function.

  But, $psi_z$ is an involution, so with left and right composition, we have that
  $
    psi_z compose phi compose psi_z = f = psi_z compose id compose psi_z = psi_z compose phi_z = id,
  $
  #w5 to show.
]

#proof[(b)][
  Consider a translation map $H : HH -> HH$ which has no fixed points and the Cayley maps between $DD$ and $HH$, $F : DD -> HH$ and $G : HH -> DD$.
  // #commutative-diagram(
  //   node((0, 0), $DD$),
  //   node((0, 1), $HH$),
  //   arr($DD$, $HH$, $F$, curve: 20deg),
  //   arr($HH$, $DD$, $G$, curve: 20deg),
  // )

  Assume for a contradiction that $G compose H compose F : DD -> DD$ has a fixed point $z$.

  Then, $H(z) = (F compose G)(z) = z$, a contradiction with the fact that $H$ has no fixed points.
]
