#lang racket/base

(provide
  render-footer)

(require
  racket/list
  racket/class
  (only-in web-galaxy/translate tr)
  rilouw-website/entities/blog)

(define (render-frequent-tags tags)
  `(div ([class "center"]) ,@(add-between (map render-element tags) " ")))

(define (render-footer db)
  `(footer
     (hr ([class "fancy"]))
     (h2 ([id "topics"]) ,(tr hot-topics-link))
     ,(render-frequent-tags (send db get-frequent-tags #:at-least 1))
     (h2 ([id "about"]) ,(tr about-title))
     (p ,(tr about-presentation-01))
     (p ,(tr about-presentation-02))
     (p ,(tr about-presentation-03))
     (p ,(tr about-comments))
     (hr)
     (p ([class "small center"])
        ,(tr copyright) (br)
        ,(tr license-font-fira) (br)
        ,(tr license-font-source))))