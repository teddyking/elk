require_relative '../spec_helper'

describe Elk::Project do
  let!(:elk_project) { Elk::Project.new('project') }

  describe '#create_top_level_dir' do
    context "when the required directory doesn't already exist" do
      it 'creates the top-level directory' do
        elk_project.create_top_level_dir

        expect(File.directory?('project')).to eq true
      end
    end

    context 'when the required directory already exists' do
      it 'raises an Error' do
        FileUtils.mkdir_p('project')

        expect { elk_project.create_top_level_dir }.to raise_error
        Elk::ProjectDirExistsError
      end
    end
  end

  describe '#create_gemfile' do
    before(:each) do
      elk_project.create_top_level_dir
      elk_project.create_gemfile
    end

    it 'creates a Gemfile in the project directory' do
      expect(File.exist?('project/Gemfile')).to eq true
    end

    it 'sets the Gemfile source to https://rubygems.org' do
      content = File.read('project/Gemfile')
      content.should =~ %r{^source\s'https://rubygems.org'}
    end
  end
end
