# encoding: UTF-8

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))

begin
  require "ruby-debug"
rescue LoadError
end

require "rubygems"
require "cutest"

def silence_warnings
  original_verbose, $VERBOSE = $VERBOSE, nil
  yield
ensure
  $VERBOSE = original_verbose
end

def assert_equal(a,b)
  assert a == b
end

$VERBOSE = true

require "ohm"

prepare do
  Ohm.redis.flushall
end
