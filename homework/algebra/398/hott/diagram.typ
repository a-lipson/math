#import "@preview/cetz:0.3.4": *

// cetz utility functions
// TODO: move to tinyset



#let point(location, radius: 0.1, name: none) = {
  import draw: *
  circle(location, radius: radius, fill: black, name: name)
}

// #let place-arrow(position, rotation: 0deg, scale: 1, ..style) = {
//   import draw: *
//
//   group({
//     rotate(rotation)
//     scale(scale)
//
//     line((0, 0), (0, 0.2), (0.3, 0.1), close: true, ..style)
//   })
// }

#let equals-line(start, end, gap: 0.1, coverage: 0.6, name: none) = {
  import draw: *
  // calculate direction and distance
  let dir = vector.sub(end, start)
  let full-len = vector.len(dir)
  let unit = vector.scale(dir, 1 / full-len)
  // calculate actual length based on coverage percentage
  let actual-len = full-len * coverage
  let half-len = actual-len / 2
  // calculate midpoint
  let mid = vector.add(start, vector.scale(vector.sub(end, start), 0.5))
  // get perpendicular vector (rotate 90 degrees)
  let perp = (-unit.at(1), unit.at(0))
  // calculate line endpoints for both bars of equals sign
  let line-start = vector.add(mid, vector.scale(unit, -half-len))
  let line-end = vector.add(mid, vector.scale(unit, half-len))
  // create a group for the equals sign
  group(name: name, {
    // draw upper line
    let upper-start = vector.add(line-start, vector.scale(perp, gap / 2))
    let upper-end = vector.add(line-end, vector.scale(perp, gap / 2))
    line(upper-start, upper-end)
    // draw lower line
    let lower-start = vector.add(line-start, vector.scale(perp, -gap / 2))
    let lower-end = vector.add(line-end, vector.scale(perp, -gap / 2))
    line(lower-start, lower-end)
    // add invisible anchor point at the center for easy referencing
    circle(mid, radius: 0, name: "center")
  })
}

// #let arc-between(start, end, ..style) = {
//   import draw: *
//
//   let dir = vector.sub(end, start)
//   point(dir)
//   let t = calc.atan2(dir.at(1), dir.at(0))
//
//   arc(
//     start,
//     start: 180deg,
//     stop: t + 90deg,
//     radius: vector.dist(start, end) / 2,
//     ..style,
//   )
// }


#let curved-line(start, end, curve: 0.5, ..style) = {
  import draw: *

  let mid = vector.add(start, vector.scale(vector.sub(end, start), 0.5))
  let dir = vector.sub(end, start)
  let perp = vector.scale((-dir.at(1), dir.at(0)), curve / vector.len(dir))
  let control = vector.add(mid, perp)

  bezier(start, end, control, ..style)
}

