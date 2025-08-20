#import "@preview/eeaabb:0.1.0": ccaabb, debug-font, eeaabb

// Explicit calls
#eeaabb(block[Hello World])\
#ccaabb(text(size: 2em)[Kerning?])

// Calling via a show rule
#[
  #set text(top-edge: "bounds")
  #show: eeaabb
  #show: ccaabb
  Asogi Genshin\
  亜双義\u{3000}玄真
]

// Calling via a show rule, this time with some extra touches
#[
  #set text(top-edge: "bounds")
  #show: eeaabb.with(unit: length.mm, precision: 4)
  #show: ccaabb.with(unit: length.mm, precision: 4)
  Asogi Kazuma\
  亜双義\u{3000}一真
]
