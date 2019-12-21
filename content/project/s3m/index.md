---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Semistructured Merge Tools"
summary: "We investigate and develop semistructured merge tools that improve code integration accuracy without compromising performance."
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
  caption: "Spurious conflict reported by unstructured merge tools"
  focal_point: "Smart"
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: "https://github.com/guilhermejccavalcanti/jFSTMerge/"
url_pdf: ""
url_slides: ""
url_video: "https://www.youtube.com/watch?v=hhrg9qRwZL8"

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

#### Problem

Developers often waste time by manually resolving merge conflicts that could be automatically resolved, like when integrating independent import or method declarations that happened to be included by different developers in the same area of the code. 

Worse, current merge tools might integrate conflicting changes without warning developers, like when two people independently declare methods with the same signature in different parts of a class. 

These problems compromise development productivity and software quality.

#### Solution

To avoid such problems, we develop [s3m](https://github.com/guilhermejccavalcanti/jFSTMerge), a semistructured merge tool that partially explores programming language syntactic structure to provide more accurate code integration without compromising execution performance. 

#### Results

##### s3m has significant advantages over unstructured merge tools 
In our [OOPSLA 2017]({{< ref "/publication/2017evaluating_and_improving_semistructured_merge/index.md" >}}) paper we show that FSTMerge, the pioneering semistructured merge tool, reports much less false positives (incorrectly reported conflicts) than unstructured merge tools that are widely used in industry. 
We also find evidence that FSTMerge false positives are easier to analyze and resolve than those reported by unstructured merge.
However, we find no evidence that semistructured merge leads to fewer false negatives (conflicts correctly reported by one tool but missed by the other), and we argue that semistructured merge false negatives are harder to detect and resolve than unstructured merge false negatives. 
Driven by these findings, we implement s3m, an improved semistructured merge tool for Java that further combines both merge techniques to reduce the false positives and false negatives of semistructured merge. 
We find evidence that s3m, when compared to unstructured merge in our sample, reduces the number of reported conflicts by half, has no additional false positives, has at least 8% fewer false negatives, and is not prohibitively slower.

##### s3m benefits do not generalize to JavaScript
To understand whether semistructured merge and the just mentioned benefits generalize to other kinds of languages, in one of our [ASE 2019]({{< ref "/publication/2019semistructured_merge_in_javascript_systems/index.md" >}}) papers we implement two semistructured merge tools for JavaScript, and compare them to a widely used unstructured tool. 
We find that current semistructured merge algorithms and frameworks are not directly applicable for scripting languages like JavaScript. 
By adapting the merge algorithms, we find evidence that our JavaScript tools report fewer false positives than unstructured merge, without compromising the correctness of the merging process. 
The benefits, however, are much smaller than the ones observed for Java-like languages, suggesting that semistructured merge advantages might be limited for languages that allow both commutative elements (like function declarations) and non-commutative elements (like statements) at the same syntactic level.

##### More structure does not necessarily improve merge accuracy 
To better understand the impact of exploring additional language syntactic structure in software merging, in another [ASE 2019]({{< ref "/publication/2019the_impact_of_structure_on_software_merging__semistructured_versus_structured_merge/index.md" >}}) paper we compare semistructured merge with structured merge. 
In particular, we compare s3m with an structured tool we implemented and that behaves as s3m for merging declarations, but invokes JDime (an structured merge tool for Java) for merging the bodies of declarations. 
Our results show that semistructured and structured merge differ less often than we expected, in only 24% of the scenarios with conflicts. 
Semistructured merge reports more false positives, whereas structured merge has more false negatives. 
Finally, we found that adapting a semistructured merge tool to resolve a particular kind of conflict (caused by changes to consecutive lines) makes semistructured and structured merge even closer.
