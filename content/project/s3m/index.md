---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "s3m"
summary: "We investigate and develop a semistructured merge tool that improves code integration accuracy without compromising performance."
authors: []
tags: []
categories: []
date: 2019-11-09T17:30:09-03:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
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

Developers often waste time manually resolving merge conflicts that could be automatically solved, like integrating independent import or method declarations that happened to be included in the same area of the code. 
Worse, current merge tools might integrate conflicting changes without warning developers, like when two people independently declare methods with the same signature in different parts of the text. 

To avoid such negative impact on development productivity and software quality, we develop s3m, a semistructured merge tool that partially explores programming language syntactic structure to provide more accurate code integration without compromising execution performance. 

In our OOPSLA 2017 paper we show that s3m considerably improves textual (unstructured) merge tools and previous semistructured merge tools for Java. 
In an ASE 2019 paper, we show that semistructured merge benefits for Javascript can be much inferior than the results obtained for Java.
In another ASE 2019 paper, we show that semistructured and structured merge do not significant;y differ, suggesting that semistructured merge might be a better option for most contexts.