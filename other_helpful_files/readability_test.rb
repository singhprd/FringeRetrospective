# frozen_string_literal: true

require "rubygems"
require "readability"
require "open-uri"
require "pry"

source = open("http://broadwaybaby.com/shows/red-bastard-lie-with-me/719991").read
doc = Readability::Document.new(source)
