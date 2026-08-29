;; extends

((text) @injection.content
        (#match? @injection.content "\\{\\{")
        (#set! injection.language "gotmpl")
        (#set! injection.combined))
