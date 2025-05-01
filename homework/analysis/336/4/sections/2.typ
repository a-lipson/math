#import "@local/tinyset:0.2.1": *

#problem[
  Prove that all entire and injective functions are linear.
]

#proof[
  Let $f$ be an entire injective function.

  We will consider the behavior of $f$ at infinity using $g(z) = f(1\/z)$, which is holomorphic on the punctured plane $CC without {0}$ and has a singularity at $z=0$.

  The singularity of $g$ at $z=0$ must be one of three types: removable, a pole, or essential.

  If $z=0$ is an essential singularity, then by Casorati-Weierstrass, the image of $g$ is locally dense in $CC$ in a deleted neighborhood of zero.
  //i.e., we get arbitrarily close to any value.
  Consider a region $Omega subset D_r$ such that $0 in.not Omega$. Since the inversion map is holomorphic and nonconstant on $Omega$, then we have an open mapping from $Omega$ to $Omega'$ outside $DD$.

  But then $f(z) = g(1 \/ z)$ would be locally dense in $Omega'$, contradicting the injectivity of $f$.

  Hence $z=0$ is not an essential singularity of $g$.

  If $z=0$ is a removable singularity, then $g$ can be extended to a holomorphic entire function on $hat(CC)$ with no poles, which makes $g$ a constant function on $CC$, contradicting injectivity.

  So $z=0$ is not a removable singularity of $g$.

  Therefore, $z=0$ is a pole of $g$. //, say with degree $n$.
  // Since $f(1\/z)$ is entire, then it is a polynomial of degree $n$.

  Since $f$ is injective, then it can have at most one root with a multiplicity of one.
  So, by FTA, $f$ must be linear.

  Since $f(z)$ is linear and $g(z)=f(1\/z)$ has a pole at $z=0$, we must have that $f(z) = a z + b$, for some $a != 0$.
]
