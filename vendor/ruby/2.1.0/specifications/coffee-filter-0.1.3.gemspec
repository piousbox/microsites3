# -*- encoding: utf-8 -*-
# stub: coffee-filter 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "coffee-filter"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Paul Nicholson"]
  s.date = "2013-02-11"
  s.description = "CoffeeFilter is a custom haml filter for rendering coffeescript inside your haml templates. It was inspired by Ivan Nemytchenko's coffee-haml-filter but I wanted an installable gem and coffeescript as the filter name."
  s.email = ["paul@webpowerdesign.net"]
  s.homepage = "http://github.com/paulnicholson/coffee-filter"
  s.licenses = ["MIT"]
  s.rubyforge_project = "coffee-filter"
  s.rubygems_version = "2.2.2"
  s.summary = "CoffeeFilter is a custom haml filter for rendering coffeescript."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml>, ["< 4.0"])
      s.add_runtime_dependency(%q<coffee-script>, [">= 2.2.0"])
    else
      s.add_dependency(%q<haml>, ["< 4.0"])
      s.add_dependency(%q<coffee-script>, [">= 2.2.0"])
    end
  else
    s.add_dependency(%q<haml>, ["< 4.0"])
    s.add_dependency(%q<coffee-script>, [">= 2.2.0"])
  end
end
