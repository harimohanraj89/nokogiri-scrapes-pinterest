require 'bundler/setup'
Bundler.require()

require 'open-uri'

get '/' do 
	erb:index
end

get '/search' do
	## I MADE SOME AWESOME CHANGES!
	if params[:q] == ''
		redirect '/'
	else
		query = params[:q]
		url = "http://pinterest.com/search/pins/?q=#{params[:q]}"
	end
	@images = []
	doc = Nokogiri::HTML(open(url))
	@images = doc.css('img.pinImg')
	@urls = @images.map {|i| i.get_attribute('src')}	



	erb :results
end