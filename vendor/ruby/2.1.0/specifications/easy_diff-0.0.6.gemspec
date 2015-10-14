# -*- encoding: utf-8 -*-
# stub: easy_diff 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "easy_diff"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Abner Qian"]
  s.date = "2015-08-05"
  s.description = "Easy Diff enhances the functionality of Hash, allowing recursive diff, merge, and unmerge of arbitrarily constructed hashes.\n  This is perfect for people who need to do diffs on not only plain text files but also data as Hash or JSON objects. Unmerge\n  is included with diff and merge to more easily allow versioning of arbitrary data."
  s.email = "LargeBagel@gmail.com"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/Blargel/easy_diff"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Recursive diff, merge, and unmerge for hashes and arrays."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.4.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.4.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.4.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
