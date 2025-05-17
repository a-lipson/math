#import "@local/tinyset:0.2.1": *

#let author = "a lipson"

#show: style(author)

#title("336 Final Project Draft", author)

#let todo-style(content) = {
  show regex("^\[TODO:.*$"): txt => (
    text(fill: green, txt)
  )
  show regex("^\[NOTE:.*$"): txt => (
    text(fill: blue, txt)
  )
  content
}

// Apply the styling to your document content
#show: todo-style

[TODO: make small subsections not appear in TOC]

#outline()

#include "sections/abstract.typ"
#include "sections/activity.typ"
#include "sections/discussion.typ"
#include "sections/project.typ"

#bibliography(full: true, "sources.bib")

/*
Grading Rubric:

1. Showcase
engagement + feasible design

2. Accessible description
suitability for audience + extent of research

3. Detailed paper (< 10 pages, single sided)
depth + quality of analysis

*/
