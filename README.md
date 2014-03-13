# ALACRITY

Alacrity is a simple Ruby Scraper, given a web page source url, alacrity finds all relevant information you want 
for the search elements. Alacrity depends on Nokogiri gem and uses css selector inbuilt in Nokogiri.

## Installation

    Add gem 'alacrity' to Gemfile
    Or
    gem install skrape

## How to use Alacrity

Lets say you have a source page url where-in a snippet is following:

    <html>
        <body>
            <h3>I want to be scraped!</h3>
            <h3>Dont forget to scrap me too!</h3>
        </body>
    </html>

Running Alacrity for searching elements 'h3' will return something like this:

    {all_h3_tags => {0=>"I want to be scraped!",1=>{Dont forget to scrap me too!}}

### Sample Run:

    get_me_info = Alacrity::Source.new("http://some_url.com") do
      fetch "all_h3_tags", :lookup=>'h3'
    end

## Custom procs and lambas!

Alacrity gets the text of all elements found by default, although you can run your own Procs with definition depending what you want your structured data to be, note the 'elem' inside your proc/lambda are Nokogiri::XML::Element, so read the documentation over at Nokogiri to see the methods and variables you have defined on Nokogiri::XML::Element
    
### Sample Run:

    get_me_info = Alacritys::Source.new("http://www.infibeam.com/") do
      fetch "all_anchor_tags", :lookup=>'a',:post_fetch=>proc {|elem| elem.attributes["href"].value rescue nil}
    end

    get_me_info.structured_data["all_anchor_tags"] should give you all anchor tags links!