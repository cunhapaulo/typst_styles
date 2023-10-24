#import "./toolbox/monography.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  
  university: "Universidade Federal do Pará",
  sigla:      "UFPA",  
  centre:     "Instituto de Filosofia e Ciências Humanas",
  faculty:    "Faculdade de Filosofia",  
  course:     "Bacharelado em Filosofia",  
  title:      "Modernismo e Pós-Modernismo",
  subtitle:   ": "+"Comentários sobre os Dois Tópicos segundo Michael Peters",
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
#lorem(100) #footnote(lorem(30)) @Peters2000


= Modernismo e Pós-modernismo na Filosofia
#lorem(100)

== Modernismo nas artes

#lorem(130)

#lorem(30)

#myfigure("../img/finishline.jpg", 
  width: 55%, 
  caption: [Linha de chegada] 
)

#lorem(30)

#myfigure("../img/ufpa.png",  
  width: 25%, 
  caption: [University´s logo], 
  source: "Institutional website of UFPa "
)

== Modernismo na filosofia
#lorem(140)

#highlightBox(color: "gray", lorem(40))

== Pós-modernismo na filosofia
#lorem(103)

=== O Pós-modernismo e outros movimentos 
#lorem(80)

#bibliography("./bib/refs.bib")


