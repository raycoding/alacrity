require 'rubygems'
require 'nokogiri'
module Alacrity
  class HMTLDOMElementsNotFound < StandardError; end
  class Source
    attr_accessor :document,:structured_data,:errors
    def initialize source_url, &block
      @structured_data = {}
      @errors=[]
      @document = Nokogiri::HTML(open(source_url))
      (block.arity < 1 ?  (instance_eval &block) : block.call(self)) if block_given?
    end

    def fetch key_name, arguments
      begin
        page_elements = @document.css arguments[:lookup]
        raise HMTLDOMElementsNotFound, "While parsing the page to find ('#{key_name}') we couldn't find any elements" if page_elements.empty?
        @structured_data[key_name] = {}
        if arguments[:post_fetch]
          page_elements.each_with_index do |elem,index|
            @structured_data[key_name][index] = arguments[:post_fetch].call(elem)
          end
        else
          page_elements.each_with_index do |elem,index|
            @structured_data[key_name][index] = elem.text
          end
        end
      rescue HMTLDOMElementsNotFound => e
        @structured_data[key_name] = {}
        @errors << "#{e.to_s}"
      end
    end
  end
end