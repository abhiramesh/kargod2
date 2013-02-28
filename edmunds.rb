require 'open-uri'
require 'JSON'

makes_json = open('http://api.edmunds.com/v1/api/vehicle/makerepository/findall?api_key=gna5m54ezjshanbuy4gepzsw&fmt=json').read

parsed_makes = JSON.parse(makes_json)["makeHolder"]

parsed_makes.each do |p|
	Make.create(:name => p["models"][0]["id"].to_s.split('_')[0])
end


Make.all.each do |m|
	make_name = m.name
	models_for_make_url = open('http://api.edmunds.com/v1/api/vehicle/modelrepository/findmodelsbymake?make=' + make_name + '&api_key=gna5m54ezjshanbuy4gepzsw&fmt=json').read
	unless JSON.parse(models_for_make_url)["modelHolder"] == nil
		parsed_models = JSON.parse(models_for_make_url)["modelHolder"]
			parsed_models.each do |l|
				l['modelYears'].each do |y|
					Model.create(:make_id => m.id, :name => l["name"], :year => y["year"])
				end
			end
	end
end

# Do 555 565 597!!!!

Model.all.slice(2129..3000).each do |d|
	sleep(3)
	trims_json = open('http://api.edmunds.com/v1/api/vehicle/stylerepository/findstylesbymakemodelyear?make=' + URI::encode(d.make.name) + '&model=' + URI::encode(d.name) + '&year=' + URI::encode(d.year.to_s) + '&api_key=gna5m54ezjshanbuy4gepzsw&fmt=json').read
	unless JSON.parse(trims_json, :max_nesting => 150)["styleHolder"] == nil
		trims_parsed = JSON.parse(trims_json)["styleHolder"]
		trims_parsed.each do |t|
			unless t["price"] == nil
				Trim.create(:model_id => d.id, :name => t["trim"]["name"], :base_msrp => t["price"]["baseMSRP"], :base_invoice => t["price"]["baseInvoice"], :tmv => t["price"]["tmv"], :used_tmv_retail => t["price"]["usedTmvRetail"], :used_tmv_pp => t["price"]["usedPrivateParty"], :used_tmv_tradein => t["price"]["usedTradeIn"])
			end
		end
	end
end






