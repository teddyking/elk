# About
elk is a simple command-line app that automates the creation of ruby project 'skeletons'. It generates the following directory structure:
```bash
project/
├── Gemfile             # source 'https://rubygems.org'
├── lib
│   ├── project
│   └── project.rb
└── spec
    └── spec_helper.rb  # require_relative '../lib/project'

3 directories, 3 files
```
# Installation and Usage
```bash
git clone https://github.com/teddyking/elk.git
cd elk
gem build elk.gemspec
gem install elk-1.0.0.gem

elk <project name>
```
# FAQ
Q. Couldn't you just write this in like 4 lines of bash?
A. Yep.

Q. So why didn't you?
A. I wanted to BDD something and this project serves as an excuse to do that.

Q. Why 'elk'?
A. It's short and easy to type + elk are awesome.
