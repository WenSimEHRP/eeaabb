#import "@preview/eeaabb:0.1.0": ccaabb, eeaabb, debug-font
#set page(width: auto, height: auto, margin: 1cm)
#[
  #set text(top-edge: "bounds", size: 3em)
  #show: eeaabb
  #show: ccaabb
  #show: smallcaps
  #set align(center)
  #stack(spacing: .3em, text(font:"Sarasa Gothic SC", weight: 800)[EEAABB], line(length: 100%), [Extract Element AABBs])
]
