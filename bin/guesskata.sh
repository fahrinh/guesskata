#!/usr/bin/env ruby
$:.unshift(File.expand_path(File.join("..", "lib"), __dir__))

require "main"

Main.new.run
