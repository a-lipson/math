#import "@local/tinyset:0.2.1": *

#problem[
  Prove the converse to Runge's Theorem.
  If $K$ compact, and $K^c$ not connected, then there exists $f$ holomorphic in a neighborhood of $K$ which cannot be approximated uniformly by a polynomial on $K$. 
]

#proof[
Since $K^c$ is not connected, then there must be an open component of $K^c$ $K$, call it $Omega$.      

For a contradiction, assume that $f$ can be uniformly approximated by a polynomial on $K$. Then, there exists a polynomial $p$ such that 
$
|p(z)-f(z)|&<epsilon\
|(z-z_0)p(z)-1|&<epsilon (z-z_0)
$ where $z_0 in Omega$.  

Let $g(z)=(z-z_0)p(z)-1$.     

Choose $epsilon = limits(max)_K 1/(z-z_0)$ such that we have $|g|<1$.

But, by MMP, since $Omega$ open, then $g$ cannot achieve a maximum in $Omega$ unless $g$ is constant.   

Notice that $g(z_0)=1$, which is a contradiction unless $g$ is constant. 
But $g$ cannot be constant because it has a linear term. 

So, $f$ cannot be uniformly approximated where $K^c$ is not connected.   
]
