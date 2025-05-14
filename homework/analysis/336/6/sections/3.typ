#import "@local/tinyset:0.2.1": *

#problem[
  Let $Q$ be a polynomial of degree at least 2 with distinct roots, not of which on the real axis.
  Calculate
  $
    limits(integral)_RR e^(-2 pi i x xi) / Q(x) dd x, #h(1em) xi in RR
  $
  in terms of the roots of $Q$.
  What happens when several roots coincide?
]

#proof[
  Let $z_i$ be the roots of $Q$.
  For now, assume that these are only simple zeros.

  We will consider the cases when $xi > 0$, $xi < 0$, and $xi = 0$.

  First, for $xi > 0$, the exponential term $|e^(-2 pi z i xi)| = e^(2 pi (im z) xi)$ decays in the lower half-plane, so we can close a semicircular contour there.

  Since a positively oriented semicircular contour traverses the real axis in the negative direction, which is backwards of our integral, then, by the Residue theorem, we have
  $
    I = limits(integral)_(RR) (e^(-2 pi i x xi)) / (Q(x)) dd x = - 2 pi i sum_(z_i : im z_i < 0) res(z_i, (e^(-2 pi i z xi)) / (Q(z))).
  $

  Since $z_i$ are all simple roots, then
  $
    res(z_i, (e^(-2 pi i z xi)) / (Q(z))) = (e^(-2 pi i z_i xi)) / (Q(z_i)).
  $

  Thus,
  $
    I = - 2 pi i sum_(z_i : im z_i < 0) (e^(-2 pi i z_i xi)) / (Q(z_i)).
  $

  Second, for $xi < 0$, the exponential term decays in the upper half-plane.
  The corresponding contour traverses in the real line in the same direction as our integral.
  Hence, by the Residue theorem and as is the first case, we have
  $
    I = 2 pi i sum_(z_i : im z_i > 0) (e^(-2 pi i z_i xi)) / (Q(z_i)).
  $

  Third, when $xi = 0$, the integral becomes $limits(integral)_(RR) (d x) / (Q(x))$, which vanishes at a sufficient distance from the origin for all complex arguments.

  We will choose the semicircular contour contour in the upper half-plane.
  Since $deg Q >= 2$, then $1\/Q(z) = O(z^(-2))$, which will vanish for $abs(z)$ sufficiently large.
  For $abs(z) = R$,
  $
    abs(limits(integral)_(C_R^+) (d z) / Q(z)) <= pi R 1 / (R^2) -> 0 " as " R -> oo.
  $

  Thus, as before,
  $
    limits(integral)_RR (d x) / Q(x) = 2 pi i sum_(z_i : im z_i > 0) 1 / Q(z_i).
  $

  Now, when roots of $Q$ coincide, we have for a root $z_j$ with multiplicity $m_j>1$,
  $
    Q(z) = (z-z_j)^(m_j) attach(limits(Q), t: display(tilde.op))(z)(z) " where " attach(limits(Q), t: display(tilde.op))(z)(z_j) != 0.
  $


  The residue at $z_j$ is given by
  $
    res(z_j, e^(-2 pi i z xi) / Q(z))
    = 1 / (m_j-1)! lim_(z -> z_j) (d / (d z))^(m_j-1) e^(-2 pi i z xi) / (attach(limits(Q), t: display(tilde.op))(z)).
  $
]
