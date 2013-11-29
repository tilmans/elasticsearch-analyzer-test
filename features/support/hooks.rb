require 'elasticsearch'
require 'yaml'
require 'json'

Before do 
	if !$dunit 
	    $dunit = true 
		analyzers = YAML.load_file("analyzers.yaml")
		mapping = 
		{
			settings: analyzers,
			mappings: {
			}
		}.to_json
		mapping = JSON.parse mapping
		# puts JSON.pretty_generate mapping

		client = Elasticsearch::Client.new # log: true
		response = client.perform_request 'GET', '_mapping'
		if response.body['test'] != nil
			response = client.perform_request 'DELETE', 'test'
		end

		response = client.perform_request 'PUT', 'test', {}, mapping

		begin
			response = client.perform_request 'GET', 'test/_status'
		end while response.body['_shards']['successful'] < 5
  	end 
end

