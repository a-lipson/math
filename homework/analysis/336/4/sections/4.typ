#import "@local/tinyset:0.2.1": *

#problem[
  Let $f$ be nonconstant and holomorphic on an open set $Omega$ containing the closed unit disk.
  + Show that if $|f(z)| = 1$ whenever $|z| = 1$, then the image of $f$ contains $DD$.
  + Show that if $|f(z)| <= 1$ whenever $|z| = 1$ and there exists $z_0 in DD$ such that $|f(z_0)|<1$, then the image of $f$ contains $D$.
]

#proof[(a)][
  By MMP, if $f$ is holomorphic on $DD$ with $|f| = 1$ on $diff DD$, then, for all $z$ in $DD$, $|f| < 1$.

  Suppose, for a contradiction, that $f$ has no zeros in $DD$, then $1\/f$ is holomorphic.

  So, applying MMP again, on $diff DD$, we have that $abs(1 \/ f) = 1$, so $abs(1\/f)<1 => abs(f) > 1$ on the interior of $D$, which is a contradiction.

  Therefore, $f$ must have at least one zero in $DD$.

  Then, for all $|w_0|<1$, we have that $|f(z)| = 1 > |w_0|$ on the unit circle $diff DD$.

  So, by Rouché, $f(z)$ and $f(z)-w_0$ both have the same number of zeros in $DD$.

  Therefore there exists a $z_0$ such that $f(z_0)=w_0$.

  Since $w_0$ was arbitrary inside $DD$, then we have that the image of $f$ contains $DD$.
]


#proof[(b)][
  Proceeding as in part (a), we will show that $f$ still has a zero in $DD$.
  // we will show that $f(z_0)=w_0$ for all $w_0 in DD$ and some $z_0$.

  Since $overline(DD)$ is compact, then $f$ attains a minimum there, say at $z_0$ as given above.

  If $|f(z_0)| = 0 <1$, then we have a zero.

  Otherwise, if $|f(z)| > 0$ for all $z in DD$, then $1\/f$ is holomorphic on $DD$, and attains a max at $z_0$ inside $DD$, which contradicts MMP.

  Hence, $f$ must have a zero inside $DD$, and we can finish the proof as in part (a) using Rouché with the fact that $|f(z)| >= 1 > |w_0|$ on $diff D$.
]
