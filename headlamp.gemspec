require_relative 'lib/headlamp/version'

Gem::Specification.new do |s|

  s.name     = 'headlamp'
  s.summary  = 'Library for the Raspberry Pi Sense HAT led panel.'
  s.version  = Headlamp::VERSION

  s.homepage = 'https://github.com/lllisteu/headlamp'
  s.authors  = [ 'lllist.eu' ]
  s.license  = 'MIT'

  all_files  = `git ls-files -z`.split("\x0")
  s.files    = all_files.grep(%r{^lib/})

  s.required_ruby_version = '>=2.2.0'

  s.add_runtime_dependency 'redgreenblue', '~>0.10', '>=0.10.0'

end
