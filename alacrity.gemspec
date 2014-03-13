Gem::Specification.new do |f|
  f.name          = 'alacrity'
  f.version       = '1.0.0'
  f.date          = %q{2014-03-13}
  f.summary       = %q{Web Page Scraper written in Ruby}
  f.description   = %q{Web Page Scraper written in Ruby - Extracts any viable HTML DOM elements specified using CSS selectors into structured scraped data}
  f.authors       = %q{Shuddhashil Ray}
  f.email         = %q{rayshuddhashil@gmail.com}
  f.files         = ["README.md","LICENSE.txt","alacrity.gemspec","lib/alacrity.rb"]
  f.require_paths = ["lib"]
  f.homepage      = %q{https://github.com/raycoding/alacrity}
  f.license       = "MIT"
  f.add_dependency "nokogiri", "~> 1.5.11"
end