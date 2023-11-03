/*
-----------------------------------------------------------------------------------------
     Toolbox for the writing of academic documents in ABNT fomat.

     Version: 20231103
     
     Author(s): Paulo Cunha (cunha.paulo.doc@gmail.com)
               
     Copyright: Copyright (c) 2023 Paulo Cunha

                Permission is hereby granted, free of charge, to any person obtaining a
                copy of this software and associated documentation files (the "Software"),
                to deal in the Software without restriction, including without limitation
                the rights to use, copy, modify, merge, publish, distribute, sublicense,
                and/or sell copies of the Software, and to permit persons to whom the
                Software is furnished to do so, subject to the following conditions:

                The above copyright notice and this permission notice shall be included 
                in all copies or substantial portions of the Software.

                THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
                THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
                FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
                DEALINGS IN THE SOFTWARE.

-----------------------------------------------------------------------------------------
*/

//------------------------------------------------------------------
//  highlightBox(title: "Box title", "text")
//------------------------------------------------------------------
//
//    Inserts a graphical text box with smaller font to convey 
//    text in focus. Title is optional and gray is the default color.
//
//------------------------------------------------------------------
#let highlightBox(title: none, fontsize: 10pt, leading: 6.75pt, color: "gray", stroke: 0pt, radius: 4pt, alignment: left, width: auto, body) = {
  
      let STROKE_COLOR = luma(70)
      let BACKGROUND_COLOR = white
      let TITLE_INSET_SPACE = 6pt
      let TEXT_INSET_SPACE = 25pt

      if color == "gray" {
        STROKE_COLOR = rgb(150, 150, 150)
        BACKGROUND_COLOR = rgb(240, 240, 240)
      } else if color == "green" {
        STROKE_COLOR = rgb(102, 174, 62)
        BACKGROUND_COLOR = rgb(235, 244, 222)
      } else if color == "blue" {
        STROKE_COLOR = rgb(29, 144, 208)
        BACKGROUND_COLOR = rgb(232, 246, 253)
      } else if color == "red" {
        STROKE_COLOR = rgb(237, 32, 84)
        BACKGROUND_COLOR = rgb(253, 228, 224)
      }
      
      return block(above: 18pt, below: 18pt)[
      #box(
        fill: BACKGROUND_COLOR,
        stroke: stroke + STROKE_COLOR,
        radius: radius,
        width: width
      )[
        #if title == none {
          TITLE_INSET_SPACE = 0pt
        }
        #set align(alignment)
        #block(
          fill: STROKE_COLOR, 
          inset: TITLE_INSET_SPACE,
          radius: (top-left: radius, bottom-right: radius),
        )[#text(fill: white, weight: "bold")[#title]]
        #block(
          breakable: true,
          spacing: TITLE_INSET_SPACE + 20pt,
          width: 100%,
          inset: (x: TEXT_INSET_SPACE, bottom: TEXT_INSET_SPACE)
        )[#par(leading: leading)[#text(size: fontsize)[#body]]]
      ]
    ]
}


//------------------------------------------------------------------
//  myfigure(body, width: 50%, caption: "", source: "")
//------------------------------------------------------------------
//
//    Inserts a graphical object in the text
//    respecting the ABNT standard, with caption and
//    the description o its source in order to respecting
//    eventual copyrights.
//
//------------------------------------------------------------------
#let myfigure(body, width: 50%, caption: "", source: "") = {

  return block(above: 25pt, below: 25pt, width: 100%)[
    #figure(
      image(body, width: width),
      gap: 10pt, 
      caption: caption
    )
    #set align(center)

    #if source != "" {
      "Fonte: " + source
    }
  ]  
}


//------------------------------------------------------------------
//  mytable(body, width: 50%, caption: "")
//------------------------------------------------------------------
//
//    Inserts a table within the ABNT standard.
//
//------------------------------------------------------------------
#let mytable(body, width: 50%, caption: "") = {

  return block(above: 25pt, below: 25pt, width: 100%)[
    #figure(
      image(body, width: width),
      gap: 10pt, 
      caption: caption
    )
  ]  
}


//------------------------------------------------------------------
//  citeonline(reference, supplement)
//------------------------------------------------------------------
//
//    Created to mimimc the exact behaviour of 
//    LaTeX citeonline refence command.
//  Produces:
//    a. citeonline(<Knuth1986>, supplement: "p. 123") 
//       => Knuth (1986, p. 123)
//    b. citeonline(<Knuth1986>) 
//       => Knuth (1986)
//------------------------------------------------------------------
#let citeonline(body, supplement: "") = {

  if supplement != "" {
    return cite(body, supplement: supplement, form: "prose");
  } else {
    return cite(body, form: "prose");
  }
  
}


//------------------------------------------------------------------
//  footciteref(reference)
//------------------------------------------------------------------
//
//    Created to mimic the exac behaviour of
//    LaTex homonimous reference command.
//  Produces:
//    a. #footnote[#footciteref(<reference>)]
//       produces a footnote where the complete reference
//       is put.
//------------------------------------------------------------------
#let footciteref(body) = {
   cite(body, form: "full")
} 