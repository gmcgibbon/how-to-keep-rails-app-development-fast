ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.


if (mode = ENV["STACKPROF_MODE"])
  interval = ENV.fetch("STACKPROF_INTERVAL", 1000)
  require "stackprof"
  StackProf.start(mode: mode.to_sym, raw: true, interval: interval.to_i)

  at_exit do
    StackProf.stop
    data = StackProf.results
    File.write("tmp/stackprof-boot.json", JSON.generate(data))
    `npm install -g speedscope`
    `speedscope tmp/stackprof-boot.json`
  end
end
