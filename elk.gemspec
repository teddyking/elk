Gem::Specification.new do |s|
  s.name        = 'elk'
  s.version     = '1.0.0'
  s.date        = '2014-03-18'
  s.summary     = 'Generates ruby project skeletons.'
  s.description = 'A command-line app to automate the generation of ruby project skeletons.'
  s.authors     = ['Ed King']
  s.email       = 'ed@teddyking.co.uk'
  s.homepage    = 'http://teddyking.co.uk'

  s.executables << 'elk'

  s.require_paths = ["lib"]
  s.files         = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.test_files    = Dir.glob("spec/**/*")

  %w(aruba cucumber fakefs rspec rubocop).each do |dep|
    s.add_development_dependency dep
  end
end
