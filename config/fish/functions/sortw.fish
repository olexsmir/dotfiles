function sortw -d "Wrapper around sort that saves file after sorting"
 if test (count $argv) -eq 0
    sort
  else if test (count $argv) -eq 1
    command sort $argv[1] -o $argv[1]
  else
    echo "I don't know what to do, too many arguments"
    return 2
  end
end
