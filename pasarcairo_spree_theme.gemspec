Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'pasarcairo_spree_theme'
  s.version     = '0.1.0'
  s.summary     = 'A Spree Commerce Theme modified'

  s.author        = 'Brian D. Quinn'
  s.email         = 'brian@railsdog.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false
end
