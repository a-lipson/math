#import "@local/tinyset:0.2.1": *

#problem[
  Is there a surjective map from $DD -> CC$?
]

#proof[
  Yes.
  We already have the bijective inverse Cayley map $G : DD -> HH$, so we will construct a surjective map $HH -> CC$.

  Now, consider the map $H : HH -> CC$ defined by the squaring function $z |-> z^2$;
  where $z = r e^(i theta)$, we have $r^2 e^(2 i theta)$.

  For $z in HH$, $arg z in (0,pi)$.
  In order to cover the real axis, we shift the upper half-plane down to $-i$.
  Then, we have at least $arg z in [0,pi]$.

  So, for $w in H(HH)$, we have $arg w in [0,2pi]$, which covers the whole imaginary plane $CC$.
  Since $r$ covers $RR_(>= 0)$, then the squaring map $H$ will have $r^2$ covering $RR_(>= 0)$ as well.

  So, the map $H$ is surjective.
  Thus, the composition $H compose G : DD -> CC$ is surjective.
]
