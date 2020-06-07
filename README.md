# create new project
docker run -it -v $(pwd):/app -p4567:4567 sp33c/middleman "middleman init"

# run a project
docker run -it -v $(pwd):/app -p4567:4567 sp33c/middleman "bundle install && middleman"

