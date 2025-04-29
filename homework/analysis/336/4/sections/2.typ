#import "@local/tinyset:0.2.1": *

#problem[
  Prove that all entire and entire functions are linear.
]

#proof[
  First, consider the case where $f$ is a polynomial.
  By FTA, $f$ must have $deg f$ roots in $CC$.

  If $f$ is injective, then $f$ must have at most one root, hence $f$ must be linear;
  i.e., $f$ has a simple pole at $oo$.

  Now, for the case when $f$ is not a polynomial, we have that $f(z)$ holomorphic on $CC$ implies that $f(1 / z)$ is holomorphic on the punctured plane $CC without {0}$.

  // If $z=0$ is not an essential singularity, then we must have a meromorphic function.

  If $z=0$ is an essential singularity, then by Casorati-Weierstrass, in a deleted neighborhood of zero, the image of $g$ is locally dense in $CC$, i.e., we get arbitrarily close to any value.
]
