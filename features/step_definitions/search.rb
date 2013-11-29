require 'elasticsearch'

class ES
	def initialize(analyzer)
		@client = Elasticsearch::Client.new log: true	
		@analyzer = analyzer
	end

	def analyze(word)
		result = @client.indices.analyze text: word
		result['tokens'][0]['token']
	end
end