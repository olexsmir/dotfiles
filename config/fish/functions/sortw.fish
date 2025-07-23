function sortw -d "Wrapper around sort to save file after sorting"
 if test (count $argv) -eq 0
    echo "No file provided"
    return 1
  else
    command sort $argv[1] -o $argv[1]
  end
end
