module Elk
  class Project
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def create_gemfile
      Elk.create_file("#{name}/Gemfile", "source 'https://rubygems.org'\n")
    end

    def create_gitignore_file
      Elk.create_file("#{name}/.gitignore")
    end

    def create_lib_dir
      Elk.create_dir("#{name}/lib")
    end

    def create_lib_project_dir
      Elk.create_dir("#{name}/lib/#{name}")
    end

    def create_project_rb_file
      Elk.create_file("#{name}/lib/#{name}.rb")
    end

    def create_skeleton
      create_top_level_dir
      create_gemfile
      create_gitignore_file
      create_lib_dir
      create_lib_project_dir
      create_project_rb_file
      create_spec_dir
      create_spec_helper_file
    end

    def create_spec_dir
      Elk.create_dir("#{name}/spec")
    end

    def create_spec_helper_file
      Elk.create_file("#{name}/spec/spec_helper.rb",
                      "require_relative '../lib/#{name}'\n")
    end

    def create_top_level_dir
      Elk.create_dir(name)
    end
  end
end
