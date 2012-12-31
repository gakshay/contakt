# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails-backbone"
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Fitzgerald", "Code Brew Studios"]
  s.date = "2012-12-17"
  s.description = "Quickly setup backbone.js for use with rails 3.1. Generators are provided to quickly get started."
  s.email = ["ryan@codebrewstudios.com"]
  s.homepage = "http://github.com/codebrew/backbone-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Use backbone.js with rails 3.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
      s.add_runtime_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_runtime_dependency(%q<jquery-rails>, ["~> 2.1.3"])
      s.add_runtime_dependency(%q<ejs>, ["~> 1.1.1"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<sass>, [">= 0"])
      s.add_development_dependency(%q<uglifier>, [">= 0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.10.3"])
      s.add_development_dependency(%q<turn>, ["~> 0.8.3"])
      s.add_development_dependency(%q<minitest>, ["~> 2.10.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0"])
      s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_dependency(%q<jquery-rails>, ["~> 2.1.3"])
      s.add_dependency(%q<ejs>, ["~> 1.1.1"])
      s.add_dependency(%q<rails>, ["~> 3.2.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<sass>, [">= 0"])
      s.add_dependency(%q<uglifier>, [">= 0"])
      s.add_dependency(%q<mocha>, ["~> 0.10.3"])
      s.add_dependency(%q<turn>, ["~> 0.8.3"])
      s.add_dependency(%q<minitest>, ["~> 2.10.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0"])
    s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
    s.add_dependency(%q<jquery-rails>, ["~> 2.1.3"])
    s.add_dependency(%q<ejs>, ["~> 1.1.1"])
    s.add_dependency(%q<rails>, ["~> 3.2.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<sass>, [">= 0"])
    s.add_dependency(%q<uglifier>, [">= 0"])
    s.add_dependency(%q<mocha>, ["~> 0.10.3"])
    s.add_dependency(%q<turn>, ["~> 0.8.3"])
    s.add_dependency(%q<minitest>, ["~> 2.10.1"])
  end
end
