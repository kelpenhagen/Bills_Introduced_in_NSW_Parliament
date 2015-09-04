# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'
#

# 
agent = Mechanize.new
#
# # Read in a page
page = agent.get("http://www.parliament.nsw.gov.au/prod/parlment/nswbills.nsf/V3BillsListAll")

page.at(:table).search(:tr)[1].search(:td)[0].text,
page.at(:table).search(:tr)[1].search(:td)[1].text,
page.at(:table).search(:tr)[1].search(:td)[0].at(:a)[:href]

# page.at(:table).search(:tr)[1].text.each do |row|
# 	bill_NSW = {
# 		date_scraped: Date.today,
# 		bill_name:search(:td)[0].text,
# 		bill_URL:search(:td)[0].at(:a)[:href].text,
# 		bill_house: search(:td)[1].text

# 		}

# t
# # Find somehing on the page using css selectors

p bill_NSW

# p page.at('div.content')
#
# # Write out to the sqlite database using scraperwiki library

# ScraperWiki.save_sqlite([:bill_name, :date_scraped], bill_NSW)

# end

# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".
