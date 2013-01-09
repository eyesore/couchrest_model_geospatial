# File: couchrest_model_geospatial.gemspec

Gem::Specification.new do |s|
  s.name = %q{couchrest_model_geospatial}
  s.version = File.read "VERSION"

  s.authors = ["Trey Jones"]
  s.date = %q{2012-01-09}
  s.description = %q{Add geocouch support to CouchRest Model}
  s.email = %q{trey@eyesoreinc.com}

  s.homepage = %q{http://github.com/eyesore/couchrest_model_geospatial}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{Add geocouch support to CouchRest Model}

  s.add_dependency "couchrest_model", [">= 1.0.0"]
end
