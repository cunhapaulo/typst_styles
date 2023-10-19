// ---------------------------------------------------------------
//  Useful Procedures.
// ---------------------------------------------------------------
  
#let highlightBox(title: none, fontsize: 10pt, leading: 6.75pt, color: "gray", stroke: 0pt, radius: 4pt, alignment: left, width: auto, body) = {
  
  let strokeColor = luma(70)
  let backgroundColor = white
  let inset_size = 8pt

  if color == "red" {
    strokeColor = rgb(237, 32, 84)
    backgroundColor = rgb(253, 228, 224)
  } else if color == "green" {
    strokeColor = rgb(102, 174, 62)
    backgroundColor = rgb(235, 244, 222)
  } else if color == "blue" {
    strokeColor = rgb(29, 144, 208)
    backgroundColor = rgb(232, 246, 253)
  } else if color == "gray" {
    strokeColor = rgb(150, 150, 150)
    backgroundColor = rgb(240, 240, 240)
  }
  
  return block(above: 18pt, below: 18pt)[
  #box(
    fill: backgroundColor,
    stroke: stroke + strokeColor,
    radius: radius,
    width: width
  )[
    #if title == none {
      inset_size = 0pt
    }
    #set align(alignment)
    #block(
      fill: strokeColor, 
      inset: inset_size,
      radius: (top-left: radius, bottom-right: radius),
    )[
      #text(fill: white, weight: "bold")[#title]
    ]
    #block(
      breakable: true,
      spacing: 20pt,
      width: 100%,
      inset: (x: 30pt, bottom: 20pt)
    )[
      #par(leading: leading)[
      #text(size: fontsize)[ #body ]
     ]
    ]
  ]
]
}
