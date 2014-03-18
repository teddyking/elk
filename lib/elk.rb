require_relative 'elk/project'
require 'fileutils'

module Elk
  class DirAlreadyExistsError < StandardError; end

  def self.create_dir(path)
    fail Elk::DirAlreadyExistsError if Dir.exist?(path)

    FileUtils.mkdir_p(path)
  end
end
