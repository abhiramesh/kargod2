require 'open-uri'
require 'JSON'



			trims_json = open('http://api.edmunds.com/v1/api/vehicle/stylerepository/findstylesbymakemodelyear?make=acura&model=rsx&year=2005&api_key=gna5m54ezjshanbuy4gepzsw&fmt=json').read
				trims_parsed = JSON.parse(trims_json, :max_nesting => 100)["styleHolder"]
				trims_parsed.each do |t|
					puts t["trim"]["name"], t["price"]["baseMSRP"], t["price"]["baseInvoice"], ["price"]["tmv"], ["price"]["usedTmvRetail"], ["price"]["usedPrivateParty"], ["price"]["usedTradeIn"]
				end



