#let widths = state("widths", ())
#let heights = state("heights", ())
#import "@preview/oxifmt:1.0.0": strfmt

#let _internal(unit, precision, c) = context {
  let size = measure(c)
  widths.update(it => it + (size.width,))
  heights.update(it => it + (size.height,))
  let hstuff = text(
    bottom-edge: "baseline",
    top-edge: "cap-height",
    fill: color.mix(red, green),
    raw(strfmt("{:." + str(precision) + "}", unit(size.width))),
  )
  let wstuff = text(
    bottom-edge: "baseline",
    top-edge: "cap-height",
    fill: color.mix(green, blue),
    raw(strfmt("{:." + str(precision) + "}", unit(size.width))),
  )
  let hstuffs = measure(hstuff)
  let wstuffs = measure(wstuff)
  box(..size, stroke: .2pt + gray, {
    c
    place(top + left, dy: -.1pt, place(bottom + left, box(
      stroke: (left: .2pt + gray),
      fill: white.transparentize(60%),
      scale(
        reflow: true,
        x: calc.min(size.width / wstuffs.width * 100%, 20%),
        y: 20%,
        wstuff,
      ),
    )))
    place(top + left, dx: .1pt, dy: .1pt, rotate(-90deg, reflow: true, box(
      fill: white.transparentize(60%),
      scale(
        x: calc.min(size.height / hstuffs.width * 100%, 20%),
        y: 20%,
        reflow: true,
        hstuff,
      ),
    )))
  })
}

#let ccaabb(c, unit: length.pt, precision: 3) = {
  show regex(".+"): it => context {
    for c in it.text {
      _internal(unit, precision, c)
    }
  }
  c
}

#let eeaabb(c, unit: length.pt, precision: 3) = {
  show: _internal.with(unit, precision)
  c
}
