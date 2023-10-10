#import "monography.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  
  university: "Universidade Federal do Pará",
  sigla:      "UFPA",  
  centre:     "Instituto de Filosofia e Ciências Humanas",
  faculty:    "Faculdade de Filosofia",  
  course:     "Bacharelado em Filosofia",  
  title:      "Modernismo e Pós-Modernismo",
  subtitle:   ": Comentários sobre os Dois Tópicos segundo Michael Peters",
  discipline: "Tópicos de Filosofia Contemporânea",
  professor:  "Prof. Dr. Roberto de Almeida Pereira de Barros",
  citystate:  "Belém - PA",
  year:       "2023",    
  date:       "15 de setembro de 2023",
  keywords:   [Modernismo; Pós-modernismo; Filosofia contemporânea; Filosofia ocidental.],  
  
  authors: (
    ( name:         "Paulo Roberto Martins  Cunha", 
      affiliation:  "Curso de Bacharelado em Filosofia - UFPA",
      email:        "cunha.paulo@gmail.com",
      mat:          "202208040033",
    ),
    // ( name: "", affiliation: "", mat: "", ),
  ),

)

  
#set cite(style: "chicago-author-date")


= Introdução
#lorem(100)

= Modernismo e Pós-modernismo na Filosofia
#lorem(100)


== Modernismo nas artes

#lorem(160)

#figure(
  image("ufpa.png", width: 25%),
  caption: [Logotipo.],
)

== Modernismo na filosofia
#lorem(140) #footnote(lorem(30)) @Peters2000

#highlightBox(color: "gray", lorem(40))


== Pós-modernismo na filosofia
#lorem(103) #footnote(lorem(40))

=== O Pós-modernismo e outros movimentos 
#lorem(80)

#bibliography("bib.bib")


