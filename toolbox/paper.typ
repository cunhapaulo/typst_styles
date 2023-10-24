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
  title:        [],   // Title of the academic essay, article, report ou paper
  subtitle:     [],   // Optional subtitle
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

  let heading_style         = "1.1"
  let title_fontsize         = 1.75em   
  let abstract_fontsize     = 9pt

  let body_fontsize         = 10pt   
  let body_firstlineindent  = 10mm
  let body_interlinespace   = 0.6em
  let body_paragraphspacing = body_interlinespace
  let body_hyphenate        = true
  let body_fonttype         = "Palatino Linotype"  // "TeX Gyre Pagella" //"Linux Libertine"
                            // "STIX Two Text", "TeX Gyre Pagella", "Liberation Serif", "Fira Sans", "Libre Baskerville", "New Computer Modern", "TeX Gyre Termes", "Atkinson Hyperlegible", "STIX Two Text", "Linux Libertine", "Inria Serif", "Source Sans Pro", "Palatino", "Palatino Linotype"
  
//==========================================================================
// Set the document's basic properties.
//==========================================================================

  set document(author: authors.map(a => a.name), title: title)

  set page(
    paper: page_size,
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 30mm),
    numbering: "1",
    number-align: center // top + right,
  )


  set heading(numbering: heading_style)
  set text(size: body_fontsize, font: body_fonttype, lang: doc_language)

  // Defines separation character to be used in the cation of all elements.
  show figure.where(
      // kind: image,
      ): set figure.caption(position: top, separator: [ -- ])

  //=======================
  // Title row.
  //=======================

  align(center)[
    #block(text(size: title_fontsize, weight: 600, title + subtitle))
    #v(2em, weak: true)
    #date
  ]

  //=======================
  // Author information.
  //=======================

  set par(justify: true, leading: 5.1pt)
  pad(
    top: 0.75em,
    bottom: 0.75em, 
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.affiliation\
        #text(size: body_fontsize - 1pt ,font: "Lucida Sans Typewriter", author.email)
      ]),      
    ),
  )
  
  //=======================
  // Abstract
  //=======================

  block[
    #set par(justify: true, leading: 4.0pt)
    #set text(size: abstract_fontsize)
    #text(weight: 900, "Resumo: ") #abstract
  ]


  //=======================
  // Keywords
  //=======================

  block[
    #set par(justify: false, leading: 3.26pt)
    #set text(size: abstract_fontsize)
    #text(weight: 900, "Palavras-chave: ") #keywords
  ]

  v(1%)
  
  //=======================
  // Main body. 
  //=======================
  set par(justify: true, first-line-indent: body_firstlineindent, leading: body_interlinespace, linebreaks: "simple")
  set text(size: body_fontsize)
  
  show heading: set block(above: 1.4em, below: 0.8em)
  
  body
}