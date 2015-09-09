# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'
#

# 
agent = Mechanize.new
#
# # Read in a page

('A'...'Z').each do |letter|
	root = "http://www.parliament.nsw.gov.au"
	url = root + "/prod/parlment/nswbills.nsf/V3BillsListAll?open&vwCurr=V3AllByTitle&vwCat=#{letter}"
	page = agent.get(url)


if !page.at('.bodyText').at(:table).nil?
page.at('.bodyText').at(:table).search(:tr)[1..-1].each do |row|

	bill = {

		# date_scraped: Date.today,
		name:row.search(:td)[0].text,
		url:root + row.search (:td) [0]. at (:a) [:href],
		house: row.search(:td)[1].text

		
		}

# 
# # Find somehing on the page using css selectors

p bill



# p page.at('div.content')
#
# # Write out to the sqlite database using scraperwiki library

ScraperWiki.save_sqlite([:url], bill_NSW)

end

# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".
