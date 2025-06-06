#import "@local/tinyset:0.2.1": *

#problem[
  Let $Omega subset CC$ be a region and suppose that ${f_n}_(n in NN)$ is a sequence of holomorphic functions that is uniformly bounded on compact subsets of $Omega$.

  Let $f$ be a holomorphic function on $Omega$, and let $S := {z in Omega | limits(lim)_(n -> oo) f_n (z) = f(z)}$.

  Prove that if $S$ has a limit point in $Omega$, then $f_n → f$ uniformly on compact subsets of $Omega$.
]

#proof[
  By Montel, ${f_n}$ is a normal family $cal(F)$, so every sequence in $cal(F)$ has a subsequence that converges uniformly on compact subsets of $Omega$ to a holomorphic function.

  Suppose for a contradiction that $f_n$ does not converge uniformly on compact subsets of $Omega$.
  So, there exists a $K subset subset Omega$ and $epsilon > 0$ such that for all $n in NN$,
  $
    sup_(z in K) |f_n(z)-f(z)| >= epsilon.
  $

  We will consider a subsequence ${f_n_k}_(k in NN)$. By the normality of $cal(F)$, this subsequence $f_n_k$ must converge uniformly on compact subsets of $Omega$ to a holomorphic function $g : Omega -> CC$.

  Now, for all $z in S$, we have that $lim_(n -> oo) f_n (z) = f(z)$.
  In particular, since $f_n_k$ is a subsequence, then $lim_(k -> oo) f_n_k (z) = f(z)$ for all $z in S$.

  But, we have that $lim_(k -> oo) f_n_k (z) = g(z)$ for all $z in Omega$.

  Consider the holomorphic difference function $h=g-f$ which has zeros in $S$ because, for all $z in S$, $g(z) = lim_(k -> oo) f_n_k (z) = f(z)$.

  Since $S$ has a limit point in $Omega$, which is open and connected, and $h$ is holomorphic, then by Theorem 2.4.8, we must have that $h$ accumulates zeros and is identically zero, which means that $f = g$ in $Omega$.

  Since $f=g$, then $f_n_k -> f$ uniformly on compact subsets of $Omega$.
  In particular, we have on $K$,
  $
    lim_(k -> oo) sup_(z in K) abs(f_n_k (z) - f(z)) = 0,
  $
  which is a contradiction with the assumption that $f_n$ did not converge uniformly on compact subsets of $Omega$.

  Thus, $f_n -> f$ uniformly on compact subsets of $Omega$.
]
