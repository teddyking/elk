require_relative './spec_helper'

describe Elk do
  describe '#self.create_dir' do
    context "when the directory doesn't already exist" do
      it 'creates the directory' do
        Elk.create_dir('example_dir')

        expect(File.directory?('example_dir')).to eq true
      end
    end

    context 'when the directory already exists' do
      it 'raises an Error' do
        FileUtils.mkdir_p('example_dir')

        expect { Elk.create_dir('example_dir') }.to raise_error
        Elk::DirAlreadyExistsError
      end
    end
  end
end
