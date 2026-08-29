;; extends

;; MiniTest
((function_call
   name: (_) @_vimcmd_identifier
   arguments: (arguments
                (string
                  content: _ @injection.content)))
 (#set! injection.language "lua")
 (#any-of? @_vimcmd_identifier "child.lua" "c.lua"))

((function_call
   name: (_) @_vimcmd_identifier
   arguments: (arguments (string content: _ @injection.content)))
 (#set! injection.language "vim")
 (#any-of? @_vimcmd_identifier "child.cmd" "c.cmd"))
