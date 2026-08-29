;; extends

;; sql
((call_expression
   (selector_expression
     field: (field_identifier) @_field
     (#any-of? @_field "Exec" "ExecContext" "Query" "QueryContext" "QueryRow" "QueryRowContext"))
   (argument_list [(interpreted_string_literal)
                   (raw_string_literal)] @injection.content))
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.include-children)
 (#set! injection.language sql))

([(raw_string_literal)
  (interpreted_string_literal)] @injection.content
 (#match? @injection.content "--sql" "-- sql" "--SQL" "-- SQL")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.include-children)
 (#set! injection.language sql))
