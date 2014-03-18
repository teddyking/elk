require_relative 'elk/project'
require 'fileutils'

module Elk
  class DirAlreadyExistsError < StandardError; end
  class ParentDirDoesntExistError < StandardError; end

  def self.create_dir(path)
    fail Elk::DirAlreadyExistsError if Dir.exist?(path)

    FileUtils.mkdir_p(path)
  end

  def self.create_file(path, content = nil)
    begin
      if content.nil?
        FileUtils.touch(path)
      else
        File.open(path, 'w') { |f| f.write(content) }
      end
    rescue Errno::ENOENT
      raise Elk::ParentDirDoesntExistError
    end
  end
end
