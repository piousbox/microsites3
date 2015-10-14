# -*- encoding: utf-8 -*-
# stub: handlebars_assets 0.20.2 ruby lib

Gem::Specification.new do |s|
  s.name = "handlebars_assets"
  s.version = "0.20.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Les Hill"]
  s.date = "2015-05-08"
  s.description = "A Railities Gem to compile hbs assets"
  s.email = ["leshill@gmail.com"]
  s.homepage = "https://github.com/leshill/handlebars_assets"
  s.licenses = ["MIT"]
  s.post_install_message = "Remember to rake assets:clean or rake assets:purge on update!"
  s.rubyforge_project = "handlebars_assets"
  s.rubygems_version = "2.2.2"
  s.summary = "Compile Handlebars templates in the Rails asset pipeline."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<execjs>, ["~> 2.0"])
      s.add_runtime_dependency(%q<tilt>, ["~> 1.2"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<sprockets>, ["< 4.0", ">= 2.0.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.5"])
      s.add_development_dependency(%q<haml>, ["~> 4.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<slim>, ["~> 3.0"])
      s.add_development_dependency(%q<json>, ["~> 1.7"])
    else
      s.add_dependency(%q<execjs>, ["~> 2.0"])
      s.add_dependency(%q<tilt>, ["~> 1.2"])
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<sprockets>, ["< 4.0", ">= 2.0.0"])
      s.add_dependency(%q<minitest>, ["~> 5.5"])
      s.add_dependency(%q<haml>, ["~> 4.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<slim>, ["~> 3.0"])
      s.add_dependency(%q<json>, ["~> 1.7"])
    end
  else
    s.add_dependency(%q<execjs>, ["~> 2.0"])
    s.add_dependency(%q<tilt>, ["~> 1.2"])
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<sprockets>, ["< 4.0", ">= 2.0.0"])
    s.add_dependency(%q<minitest>, ["~> 5.5"])
    s.add_dependency(%q<haml>, ["~> 4.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<slim>, ["~> 3.0"])
    s.add_dependency(%q<json>, ["~> 1.7"])
  end
end
