#import "./toolbox/paper.typ": *

#show: project.with(
  
  title:            "Main Title of this Paper",
  subtitle:         ": "+"Optional Paper´s Subtitle", 
  date:             "Date of publishing",
  abstract:         lorem(70),
  keywords:         [Keyword1; keyword2; keyword3.],
  authors: 
  (
    ( name:         "Author #1 Name", 
      affiliation:  "Course Name\n University Name",
      email:        "email@organization"
    ),  
    ( name:         "Author #2 Name", 
      affiliation:  "Course Name\n University Name",
      email:        "email@organization"
    ),
  ),
)
 
#set cite(style: "chicago-author-date")

= Introduction 
#lorem(30) #footnote[#footciteref(<Peters2000>)]

#lorem(30)

= Modernism and Post-Modernism 
#lorem(40)  

#myfigure("../img/finishline.jpg", 
  width: 45%, 
  caption: [Linha de chegada] ,
  source: "Free pics website."
)

#lorem(30)

== Modernism in Arts

#lorem(30)

#lorem(30)
 
#myfigure("../img/ufpa.png",  
  width: 25%, 
  caption: [University´s logo], 
  source: "Institutional website of UFPa "
) 

#lorem(45) #footnote[#lorem(30)] 
 
== Modernism in Philosophy
#lorem(25) Citation #citeonline(<Lyotard2009>) 

#lorem(125) 
 
== Pós-modernism in Philosophy
#lorem(40) @Peters2000[p.10] @Lyotard2009

Eaxample uses of citation:  

1. #citeonline(<Lyotard2009>, supplement: "p. 97")
2. #citeonline(<Lyotard2009>)
3. #cite(<Peters2000>, supplement: "p. 245")
4. @Peters2000[p. 45]
 
// Bibliography section
#set par(first-line-indent: 0mm, hanging-indent: 8mm) // format tweak
#bibliography("./references/refs.bib", style: "./references/abnt.csl")