# -*- encoding: utf-8 -*-
# stub: mongoid-history 0.4.7 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid-history"
  s.version = "0.4.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aaron Qian", "Justin Grimes", "Daniel Doubrovkine"]
  s.date = "2015-04-06"
  s.description = "This library tracks historical changes for any document, including embedded ones. It achieves this by storing all history tracks in a single collection that you define. Embedded documents are referenced by storing an association path, which is an array of document_name and document_id fields starting from the top most parent document and down to the embedded document that should track history. Mongoid-history implements multi-user undo, which allows users to undo any history change in any order. Undoing a document also creates a new history track. This is great for auditing and preventing vandalism, but it is probably not suitable for use cases such as a wiki."
  s.email = ["aq1018@gmail.com", "justin.mgrimes@gmail.com", "dblock@dblock.org"]
  s.homepage = "http://github.com/aq1018/mongoid-history"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Track and audit, undo and redo changes on Mongoid documents."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<easy_diff>, [">= 0"])
      s.add_runtime_dependency(%q<mongoid>, [">= 3.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, ["= 0.27.1"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<gem-release>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<easy_diff>, [">= 0"])
      s.add_dependency(%q<mongoid>, [">= 3.0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rubocop>, ["= 0.27.1"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<gem-release>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<easy_diff>, [">= 0"])
    s.add_dependency(%q<mongoid>, [">= 3.0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rubocop>, ["= 0.27.1"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<gem-release>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
