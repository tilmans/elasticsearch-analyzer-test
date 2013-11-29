require 'elasticsearch'

Given(/^the source text "(.*?)"$/) do |word|
  	@word = word
end

When(/^passing to the "(.*?)" analyzer$/) do |analyzer|
	client = Elasticsearch::Client.new	
	result = client.indices.analyze text: @word, index: 'test', analyzer: analyzer
	@analyzed = []
	result['tokens'].each do |token|
		@analyzed << token['token']
	end
end

Then(/^"(.*?)" should be returned$/) do |result|
	@analyzed.should include(result)
end