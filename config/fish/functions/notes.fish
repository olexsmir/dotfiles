function notes
  set pattern $argv[1]

  rg -C 3 $pattern $HOME/org/notes
end
