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
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 30mm),
    numbering: "1/1",
    number-align: center,
  )
  // set text(size: 11pt,font: "Liberation Serif", lang: "pt")
  // set text(size: 11pt,font: "Fira Sans", lang: "pt")
  // set text(size: 11pt,font: "Libre Baskerville", lang: "pt")
  // set text(size: 10pt,font: "New Computer Modern", lang: "pt")
  // set text(size: 11pt,font: "TeX Gyre Termes", lang: "pt")
  set text(size: 11pt,font: "TeX Gyre Pagella", lang: "en")
  set heading(numbering: "1.1")

  //=======================
  // Title row.
  //=======================
  align(center)[

    #block(text(weight: 600, 1.75em, title + subtitle))
    #v(2em, weak: true)
    #date

  ]

  //=======================
  // Author information.
  //=======================
  set par(justify: true, leading: 5.0pt)
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
        #text(font: "New Computer Modern Mono" ,author.email)
      ]),      
    ),
  )
  
  //=======================
  // Abstract
  //=======================
  heading(outlined: false, numbering: none, text(10pt, "Resumo:"))
  set par(justify: true, leading: 4.0pt)
  set text(size: 9pt)
  abstract
  
  //=======================
  // Keywords
  //=======================
  set text(size: 10pt)
  heading(outlined: false, numbering: none, text(10pt, "Palavras-chave:"))
  set text(size: 9pt) 
  keywords
  v(1%)
  
  //=======================
  // Main body. 
  //=======================
  set par(justify: true, first-line-indent: 1.0cm, leading: 7.8pt, linebreaks: "simple")
  set text(size: 12pt)
  body
}