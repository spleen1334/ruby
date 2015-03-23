require 'rubygems'

spec = Gem::Specification.new do |s|
	s.name = 'string_extend'
	s.version = '0.0.1'
	s.summary = "StringExtend adds useful feature to the String class"
	s.files = Dir.glob("**/**/**")
	s.test_files = Dir.glob("test/*_test.rb")
	s.author = "spleen"
	s.email = "some@email.com"
	s.has_rdoc = false
	s.required_ruby_version = '>=1.9.0'
end