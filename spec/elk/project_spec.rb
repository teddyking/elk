require_relative '../spec_helper'

describe Elk::Project do
  describe '#create_top_level_dir' do
    let!(:elk_project) { Elk::Project.new('project') }

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
end
