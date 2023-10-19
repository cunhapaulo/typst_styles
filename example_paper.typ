#import "paper.typ": *


#show: project.with(
  
  title:            "Paper´s Title",
  subtitle:         ": "+"Optional Subtitle", 
  date:             "date of publishing",
  abstract:         "Resumed text to be used in the abstract.",
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

#show heading: set block(above: 1.4em, below: 0.8em)

= Introduction
#lorem(70)

= Modernism and Post-Modernism
#lorem(70)

#lorem(30)

== Modernism in Arts

#lorem(70)

#figure(
  image("ufpa.png", width: 20%),
  caption: [#lorem(6)],
)

== Modernism in Philosophy
#lorem(75) #footnote[#lorem(30)]


== Pós-modernism in Philosophy
#lorem(40) @Peters2000.

#bibliography("bib.bib")


