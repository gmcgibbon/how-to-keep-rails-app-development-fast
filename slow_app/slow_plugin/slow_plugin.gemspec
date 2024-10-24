require_relative "lib/slow_plugin/version"

Gem::Specification.new do |spec|
  spec.name        = "slow_plugin"
  spec.version     = SlowPlugin::VERSION
  spec.authors     = [ "Gannon McGibbon" ]
  spec.email       = [ "gannon.mcgibbon@gmail.com" ]
  spec.summary     = "Slow gem"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.0.beta1"
end
