#import "@local/tinyset:0.2.1": *

#problem[
  $f$ is holomorphic on the disk $D_(R_0)$ centered at the origin with radius $R_0$.

  + Prove, for $0<R<R_0$, $|z|<R$,
    #grid(
      // why does this center everything?
      columns: 1fr,
      $
        f(z) = (1) / (2 pi) integral_(0)^(2 pi) f(R e^(i phi)) "Re" lr([ (R e^(i phi) + z) / (R e^(i phi) - z) ]) d phi
      $
    )

  + Show $ "Re" lr([ (R e^(i gamma) + r) / (R e^(i gamma) - r) ]) = (R^2 - r^2) / (R^2 - 2 R r cos gamma + r^2) $
]

// TODO: refactor these with new definition of proof!

#proof(of: "(a)")[

  By CIF, we have that for all $|z| < R$, $ f(z) = 1 / (2 pi i) limits(integral)_(|w|=R) (f(w)) / (w-z) dd z. $

  Let $zeta = R^2 / overline(z)$. Then $|z| < R$, we have $|zeta| > R$.
  Since $f$ is holomorphic, then $ limits(integral)_(|w|= R) (f(w)) / (w-zeta) dd w = 0. $

  So, we will consider sum of the above with this vanishing integral,
  $
    f(z) = 1 / (2 pi i) limits(integral)_(|w|=R) f(w) lr(( 1 / (w-z) - 1 / (w - zeta) )) dd w.
  $

  With $w = R e^(i phi)$ and $d w = i R e^(i phi) dd phi = i w dd phi$ we have
  $
    f(z) = 1 / (2 pi) integral_(0)^(2 pi) f(R e^(i phi)) w lr(( 1 / (w-z) - 1 / (w - zeta) )) dd phi.
  $

  But, we have that
  $
    "Re"lr([ (R e^(i phi) + z) / (R e^(i phi) - z) ]) &= "Re"lr([ (w+z) / (w-z)]) \
    &= 1 / 2 lr(( (w+z) / (w-z) + (overline(w)+overline(z)) / (overline(w)-overline(z)) )) \
    &= 1 / 2 lr(( (w+z) / (w-z) + ((R^2) / overline(w) + overline(z)) / ((R^2) / overline(w) - overline(z)) )) \
    &= 1 / 2 lr(( (w+z) / (w-z) - ( (R^2) / (overline(z)) + w ) / (w - R^2 / overline(z) ) )) \
    &= 1 / 2 lr(( lr(( -1 + (2w) / (w-z) )) - lr(( -1 + (2w) / (w - R^2 / overline(z)) )) )) \
    &= w lr(( 1 / (w-z) - 1 / (w - zeta) )).
  $

  Thus,
  $ f(z) = 1 / (2 pi) integral_(0)^(2 pi) f(R e^(i phi)) "Re"lr([ (R e^(i phi) + z) / (R e^(i phi) - z) ]) dd phi, $ which is what we wanted to show.
]

#proof(of: "(b)")[
  We have, for $r in RR$,
  $
    (R e^(i gamma) + r) / (R e^(i gamma ) - r) = ((R e^(i gamma) + r)overline((R e^(i gamma) - r))) / (|r e^(i gamma) -r |^2).
  $

  For the numerator,
  $
    (R e^(i gamma) + r)(R e^(-i gamma) - r)
    &= R^2 r R e^(i gamma) + r R e^(- i gamma) - r^2 \
    &= R^2 - r^2 - r R (e^(i gamma) - e^(- i gamma) ) \
    &= R^2 - r^2 - r R (2 i sin gamma).
  $

  For the denominator,
  $
    (R e^(i gamma) - r)(R e^(-i gamma) - r)
    &= R^2 - r R (e^(i gamma) - e^(- i gamma)) + r^2 \
    &= R^2 - r R 2 cos gamma + r^2.
  $

  Thus,
  $ "Re" lr([ (R e^(i gamma) + r) / (R e^(i gamma ) - r) ]) = (R^2 - r^2) / (R^2 - 2 R r cos gamma + r^2) $ as desired.
]
