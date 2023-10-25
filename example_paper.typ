#import "./toolbox/paper.typ": *

#show: project.with(
  
  title:            "Paper´s Main Title",
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
#lorem(30)

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

#lorem(70)


#lorem(30)
 
#myfigure("../img/ufpa.png",  
  width: 25%, 
  caption: [University´s logo], 
  source: "Institutional website of UFPa "
) 

#lorem(75) #footnote[#lorem(30)] 
 
== Modernism in Philosophy
#lorem(75) 

 
== Pós-modernism in Philosophy
#lorem(40) @Peters2000.

#bibliography("./bib/refs.bib")
 