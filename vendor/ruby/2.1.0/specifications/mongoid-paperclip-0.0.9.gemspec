# -*- encoding: utf-8 -*-
# stub: mongoid-paperclip 0.0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid-paperclip"
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael van Rooijen"]
  s.date = "2014-03-13"
  s.description = "Enables you to use Paperclip with the Mongoid ODM for MongoDB."
  s.email = "michael@vanrooijen.io"
  s.homepage = "https://github.com/meskyanichi/mongoid-paperclip"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Paperclip compatibility for Mongoid ODM for MongoDB."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3.6"])
    else
      s.add_dependency(%q<paperclip>, [">= 2.3.6"])
    end
  else
    s.add_dependency(%q<paperclip>, [">= 2.3.6"])
  end
end
