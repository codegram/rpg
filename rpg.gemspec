# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rpg/version"

Gem::Specification.new do |s|
  s.name        = "rpg"
  s.version     = Rpg::VERSION
  s.authors     = ["Marc Divins", "Josep M. Bach"]
  s.email       = ["marcdivc@gmail.com", "josep.m.bach@gmail.com"]
  s.homepage    = "http://github.com/codegram/rpg"
  s.summary     = %q{An RPG game to learn Ruby.}
  s.description = %q{An RPG game to learn Ruby.}

  s.rubyforge_project = "rpg"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "ray"
end
