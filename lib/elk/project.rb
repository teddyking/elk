require 'fileutils'

module Elk
  class Project
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def create_top_level_dir
      fail Elk::ProjectDirExistsError if Dir.exist?(name)

      FileUtils.mkdir_p(name)
    end

    def create_gemfile
      File.open("#{name}/Gemfile", 'w') do |f|
        f.write("source 'https://rubygems.org'\n")
      end
    end
  end
end
