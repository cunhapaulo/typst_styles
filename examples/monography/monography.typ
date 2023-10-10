//====================================================================
// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
//====================================================================

#let project(
  
  university:   "",   // University´s name
  sigla:        "",   // University´s sigla
  centre:       "",   // Center or Institute assotiation
  faculty:      "",   // Faculty´s name
  course:       "",   //Course name
  authors:      (),   // Informations about the authors  
  title:        "",   // Title of the academic essay, article, report ou paper
  subtitle:     "",   // Optional subtitle
  abstract:     [],   // Short abstract
  keywords:     [],   // Keywords
  citystate:    "",   // City and State
  date:         none, // Complete date of the academic work
  year:         "",   // Only the year of the wor
  discipline:   "",   // Name of the Discipline or Course
  professor:    "",   // Professor´s name
  body,
  
) = {


//==========================================================================
//                          GLOBAL DEFINITIONS
//==========================================================================

  let summary_fontsize = 12pt
  let body_fontsize = 12pt   
  let body_firstlineindent = 10mm
  let body_interlinespace = 10pt // 0.78em
  let body_paragraphspacing = body_interlinespace
  let text_language = "pt"         
  let heading_style = "1.1"
  let abstract_hyphenate = true
  let body_hyphenate = true
  
  let body_fonttype = "TeX Gyre Pagella"
  // "STIX Two Text", "TeX Gyre Pagella", "Liberation Serif", "Fira Sans", "Libre Baskerville", "New Computer Modern", "TeX Gyre Termes", "Atkinson Hyperlegible", "STIX Two Text", "Linux Libertine"

  let sumario = "Trabalho apresentado à disciplina " + discipline + ", ministrada pelo " + professor + ", pelo(s) aluno(s) " + for a in authors [ #a.name, matrícula #a.mat, ] + " como tarefa avaliativa do Curso de "+ course +"  da " + university +  " (" + upper(sigla) + ")."

  
  
// ---------------------------------------------------------------
//  Configure lists.
// ---------------------------------------------------------------
  
  set enum(indent: 20pt, body-indent: 6pt, numbering: "(a)")
  set list(indent: 20pt, body-indent: 6pt, marker: ">")

  
// ---------------------------------------------------------------
//  Set the document's basic properties.
// ---------------------------------------------------------------
 
  set document(
    author: authors.map(a => a.name), 
    title: title,
  )
  
  set page(
    paper: "a4",
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 30mm),
  )
  
  set text(
    lang: text_language,
    size: body_fontsize,
    font: body_fonttype, 
  )
  show par: set block(spacing: body_paragraphspacing)
// ---------------------------------------------------------------
// Configure headings
// ---------------------------------------------------------------
    
  // show heading: it => locate(loc => {
  //   // Find out the final number of the heading counter.
  //   let levels = counter(heading).at(loc)
  //   let deepest = if levels != () {
  //     levels.last()
  //   } else {
  //     1
  //   }  

  // if it.level == 1 [
  //     #v(12pt, weak: true)
  //     #numbering("1")
  //     #set par(first-line-indent: 0pt)
  //     #h(10pt, weak: true)
  //     #it.body
  //     #v(13.75pt, weak: true)
  //   ] 
  //   else if it.level == 2 [
  //     #v(18pt, weak: true)
  //     #set par(first-line-indent: 0pt)
  //     #numbering("1.1", deepest)
  //     #h(10pt, weak: true)
  //     #it.body
  //     #v(10pt, weak: true)
  //   ] else if it.level == 3 [
  //     // Third level headings are run-ins too, but different.
  //     #v(16pt, weak: true)
  //     #set par(first-line-indent: 0pt)
  //     #numbering("1.1.1", deepest)
  //     #h(10pt, weak: true)
  //     #it.body
  //     #v(10pt, weak: true)
  //   ]
  // })


show heading.where( level: 1 ): it => block(width: 100%)[
  
  #v(6pt) 
  
  #let c = counter(heading).display();

  #if ( c  != "0" ) [ #c ]
  #h(5pt) 
  #it.body 
  #v(6pt)
]
// show heading.where( level: 1 ): it => block(width: 100%)[
//   #v(6pt)
//   #counter(heading).display() 
//   #h(5pt) 
//   #it.body 
//   #v(6pt)
// ]

show heading.where( level: 2 ): it => block(width: 100%)[
  #v(3pt)
  #counter(heading).display() 
  #h(5pt)   
  #it.body
  #v(3pt)
]

show heading.where( level: 3 ): it => block(width: 100%)[
  #v(3pt)
  #counter(heading).display() 
  #h(5pt)   
  #it.body
  #v(3pt)
]
  
set heading(numbering: heading_style)
show outline: set heading(numbering: none)
show bibliography: set heading(numbering: none)


// ---------------------------------------------------------------
//  FRONT PAGE
// ---------------------------------------------------------------

block(height:100%, width: 100%)[  
  
 #align(center)[

  // LOGO
  #block()[
  #figure(image("ufpa.png", width: 20%),)
  #set text(size: body_fontsize)  
  #upper[
      #university\
      #centre\
      #faculty
    ]
  ]
        
  #v(10%, weak: true)

  // AUTHORS
  #grid(
      ..authors.map(a => 
          upper[
            #a.name
            #v(9pt)
        ]
      ),
  )

  #v(10%, weak: true)

    // TITLE
    #block(
      text(upper[#title], weight: 600, body_fontsize+2pt, hyphenate: false) + 
      text(upper[#subtitle], body_fontsize+2pt,hyphenate: false)
    )
        
    #v(55%, weak: true)
  
    #set text(size: body_fontsize - 2pt)
    #block(text(upper[#citystate]) + linebreak() + text(year))
  ]
]

pagebreak()


// ---------------------------------------------------------------
//  2nd FRONT PAGE
// ---------------------------------------------------------------

block(height:100%, width: 100%)[
  #align(center)[
  
    // AUTHORS
    #grid(
        ..authors.map(a => 
            upper[
              #a.name
              #v(9pt)
            ]
          ),
      )

      #v(15%)
      
      // TITLE
      #block(
        text(upper[#title], weight: 600, body_fontsize, hyphenate: false) +
        text(upper[#subtitle], body_fontsize, hyphenate: false)
      )
    ]
  
    #v(15%)

    // ABSTRACT
    #set par(justify: true,)
    #align(right)[ 
        #block(
          width: 75mm, 
          align(left)[
            #text(sumario, kerning: true, hyphenate: abstract_hyphenate, size: body_fontsize,)
          ]
        )
      ]
        
    #v(40%, weak: true)
  
    #align(center)[  
    #set text(size: body_fontsize - 2pt)
    #block(text(
      upper[#citystate]) + 
      linebreak() + 
      text(year))
  ]  
]

pagebreak()


// ---------------------------------------------------------------
//  SUMMARY
// ---------------------------------------------------------------

block()[
  #set text(size: summary_fontsize, kerning: true,);
  #par(
    leading: 10pt, 
    outline(indent: 8mm, depth: 2)
  )
]


// ---------------------------------------------------------------
//  BODYTEXT - BEGIN PAGE NUMBERING
// ---------------------------------------------------------------
  
  counter(page).update(0)   // Set summary page to zero so the next page will be 1

  set page(
    numbering: "1",
    number-align: right + top,
  )
  
  set par(
    justify: true, 
    first-line-indent: body_firstlineindent, 
    leading: body_interlinespace, 
    linebreaks: auto,
  )
  
  set text(size: body_fontsize, kerning: true, hyphenate: body_hyphenate)

  pagebreak()
  
  body
}  

// END OF PROJECT



// ---------------------------------------------------------------
//  Useful Procedures.
// ---------------------------------------------------------------
  
#let highlightBox(title: none, fontsize: 9pt, leading: 6.75pt, color: none, radius: 4pt, alignment: left, width: auto, body) = {
  
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
    backgroundColor = rgb(230, 230, 230)
  }
  
  return block(above: 17pt, below: 17pt)[
  #box(
    fill: backgroundColor,
    stroke: 0pt + strokeColor,
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
      spacing: 17pt,
      width: 100%,
      inset: (x: 20pt, bottom: 20pt)
    )[
      #par(leading: leading)[
      #text(size: fontsize)[#body]
    ]
    ]
  ]
]
}
