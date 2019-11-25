---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Semantic Merge Tools"
summary: "We investigate static and dynamic analysis techniques to develop semantic merge tools that detect conflicts missed by current tools."
authors: []
tags: []
categories: []
date: 2019-11-09T17:52:13-03:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Using static analyses and tests to detect interference among changes to be integrated"
  focal_point: ""
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

#### Problem

Current merge tools are oblivious to the semantic of the code changes that they integrate. As a consequence, they might integrate conflicting changes without warning developers, like when two people independently change the behavior of dependent parts of the code. 

Such missed conflicts are hardly detected by project tests or code reviews, and end up escaping to system users, with potentially severe negative consequences. When users report such defects, developers might have a hard time to understand the underlying causes and fix the code.

These problems compromise development productivity and software quality.

#### Solution

To detect such conflicts at integration time, we are studying two techniques for building semantic merge tools. First, we are developing static analyses to detect interference among the changes to be integrated. Second, we are using  test generation tools for generating tests that reveal such interference.



