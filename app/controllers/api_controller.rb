class ApiController < ApplicationController

 protect_from_forgery except: :search

  def search

  	@recipes = api_call(1).concat(api_call(2))

  	render "api/search.js.erb"
  end

  private 

  def api_call(page)
  	param = params["q"]
  	recipes_call = HTTParty.get('http://www.recipepuppy.com/api/?q='+ param + '&p=' + page.to_s)
	recipes_json = JSON.parse(CGI::unescapeHTML(recipes_call.body))

	recipes_json["results"]
  end
end
