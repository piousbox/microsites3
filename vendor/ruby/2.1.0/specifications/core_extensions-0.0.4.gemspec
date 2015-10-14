# -*- encoding: utf-8 -*-
# stub: core_extensions 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "core_extensions"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sarkis Karayan"]
  s.date = "2012-09-13"
  s.description = "Ruby Core Object Extensions"
  s.email = ["skarayan@gmail.com"]
  s.homepage = "https://github.com/skarayan/core_extensions"
  s.rubygems_version = "2.2.2"
  s.summary = "Ruby Core Object Extensions"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
