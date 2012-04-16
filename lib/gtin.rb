$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'gtin/core_ext/string'
require 'gtin/core_ext/integer'
require 'gtin/active_record/validator'

module GTIN
  VERSION = '0.1.2'
end
