require_relative './spec_helper'

describe Elk do
  let(:dir) { 'example_dir' }
  let(:file) { 'file.txt' }

  describe '#self.create_dir' do
    context "when the directory doesn't already exist" do
      it 'creates the directory' do
        Elk.create_dir(dir)

        expect(File.directory?(dir)).to eq true
      end
    end

    context 'when the directory already exists' do
      it 'raises an Error' do
        FileUtils.mkdir_p(dir)

        expect { Elk.create_dir(dir) }.to raise_error \
        Elk::DirAlreadyExistsError
      end
    end
  end

  describe '#self.create_file' do
    context "when the file doesn't already exist" do
      it 'creates the file' do
        Elk.create_file(file)

        expect(File.exist?(file)).to eq true
      end

      context 'when the file content is empty' do
        it "doesn't add any content to the file" do
          Elk.create_file(file)

          File.read(file).should eq ''
        end
      end

      context "when the file content isn't empty" do
        it 'adds the content to the file' do
          Elk.create_file(file, 'the cake is a lie')

          File.read(file).should eq 'the cake is a lie'
        end
      end
    end

    context "when the file path contains a directory that doesn't exist" do
      it 'raises an Error' do
        files  = %w(dir/file.txt dir/dir/file.txt)
        files.each do |file|
          expect { Elk.create_file(file) }.to raise_error \
          Elk::ParentDirDoesntExistError
        end
      end
    end
  end
end
