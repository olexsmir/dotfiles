function gotestcover -a path
  go test $path -coverprofile=cover
  go tool cover -html=cover
end
