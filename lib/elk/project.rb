module Elk
  class Project
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def create_top_level_dir
      Elk.create_dir(name)
    end

    def create_lib_dir
      Elk.create_dir("#{name}/lib")
    end

    def create_gemfile
      File.open("#{name}/Gemfile", 'w') do |f|
        f.write("source 'https://rubygems.org'\n")
      end
    end

    def create_project_rb_file
      FileUtils.touch("#{name}/lib/#{name}.rb")
    end
  end
end
