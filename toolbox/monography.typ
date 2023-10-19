#import "toolbox.typ": *

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
//                             IMPORTANT!!!
//                          GLOBAL DEFINITIONS
//==========================================================================

  let doc_language         = "pt"
  let page_size             = "a4"

  let abstract_hyphenate    = true
  let logo                  = "ufpa.png"
  
  let summary_depth         = 2  
  let summary_fontsize      = 12pt

  let heading_style         = "1.1"
  let heading_spaceabove    = 1.4em
  let heading_spacebelow    = 0.8em 
  
  let body_fontsize         = 12pt   
  let body_firstlineindent  = 10mm
  let body_interlinespace   = 10pt // 0.78em
  let body_paragraphspacing = body_interlinespace
  let body_hyphenate        = true
  let body_fonttype         = "STIX Two Text"
                            // "STIX Two Text", "TeX Gyre Pagella", "Liberation Serif", "Fira Sans", "Libre Baskerville", "New Computer Modern", "TeX Gyre Termes", "Atkinson Hyperlegible", "STIX Two Text", "Linux Libertine", "Inria Serif", "Source Sans Pro"

  let sumario = "Trabalho apresentado à disciplina " + discipline + ", ministrada pelo " + professor + ", pelo(s) aluno(s) " + for a in authors [ #a.name, matrícula #a.mat, ] + " como tarefa avaliativa do Curso de "+ course +"  da " + university +  " (" + upper(sigla) + ")."

  
  
// ---------------------------------------------------------------
//  Lists Configurations
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
    paper: page_size,
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 30mm),
  )
  
  set text(
    lang: doc_language,
    size: body_fontsize,
    font: body_fonttype, 
  )
  show par: set block(spacing: body_paragraphspacing)

// ---------------------------------------------------------------
// Configure headings
// ---------------------------------------------------------------

show heading.where( level: 1): set block(above: heading_spaceabove, below: heading_spacebelow)

show heading.where( level: 2 ): it => block(above: heading_spaceabove, below: heading_spacebelow, width: 100%)[
  #v(3pt)
  #counter(heading).display() 
  #h(5pt)   
  #it.body
  #v(3pt)
]

show heading.where( level: 3 ): it => block(above: heading_spaceabove, below: heading_spacebelow, width: 100%)[
  #v(3pt)
  #counter(heading).display() 
  #h(5pt)   
  #it.body
  #v(3pt)
]

show heading.where( level: 4 ): it => block(above: heading_spaceabove, below: heading_spacebelow, width: 100%)[
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
  #figure(image(logo, width: 20%),)
  #set text(size: body_fontsize)  
  #upper[
      #university\
      #centre\
      #faculty
    ]
  ]
        
  // #v(10%, weak: true)
  #v(1fr)

  // AUTHORS
  #grid(
      ..authors.map(a => 
          upper[
            #a.name
            #v(9pt)
        ]
      ),
  )

  // #v(10%, weak: true)
  #v(1fr)

    // TITLE
    #block(
      text(upper[#title], weight: 600, body_fontsize+2pt, hyphenate: false) + 
      text(upper[#subtitle], body_fontsize+2pt,hyphenate: false)
    )
        
    // #v(55%, weak: true)
    #v(1fr)#v(1fr)#v(1fr)#v(1fr)#v(1fr)#v(1fr)
  
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

      // #v(15%)
      #v(1fr)
      
      // TITLE
      #block(
        text(upper[#title], weight: 600, body_fontsize, hyphenate: false) +
        text(upper[#subtitle], body_fontsize, hyphenate: false)
      )
    ]
  
    // #v(15%)
    #v(1fr)

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
        
    // #v(40%, weak: true)
    #v(1fr)#v(1fr)#v(1fr)
  
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
    outline(indent: 8mm, depth: summary_depth)
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