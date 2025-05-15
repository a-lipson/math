// #import "@preview/ctheorems:1.1.3": *
// // #show: thmrules.with(qed-symbol: $square$)
//
// // #set page(width: 16cm, height: auto, margin: 1.5cm)
// // #set text(font: "Libertinus Serif", lang: "en")
// // #set heading(numbering: "1.1.")
//
// #let theorem = thmplain("theorem", "Theorem", titlefmt: strong, inset: (
//   top: 1em,
// ))
//
// #let corollary = thmplain("corollary", "Corollary", titlefmt: strong)
//
//
// #let definition = thmbox("definition", "Definition", inset: (
//   x: 1.2em,
//   top: 1em,
// ))
//
// #let example = thmplain("example", "Example")//.with(numbering: none)
//
// #let proof = thmproof("proof", "Proof", bodyfmt: body => [
//   #body #h(1fr) $square$
// ])

#let HRT = "Hardy-Ramanujan Theorem"
