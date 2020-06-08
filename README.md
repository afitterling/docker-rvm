# build
docker image build -t sp33c/rvm:ruby . --build-arg RUBY=ruby --build-arg VERSION=2.7
docker image build -t sp33c/rvm:jruby . --build-arg RUBY=jruby

# run a project
docker run -it -v $(pwd):/app sp33c/middleman "bash --login"

