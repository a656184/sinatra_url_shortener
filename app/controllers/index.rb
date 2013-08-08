get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  
  @long_url = params[:long_url]
  # @long_url = Url.prepend_http_if_missing(@long_url)
  @new_url = Url.add_url_to_database(@long_url)

  @short_url = @new_url.short_url
  
  erb :urls
  # create a new Url
end

# e.g., /q6bda
get '/:redirect_short_url' do
  
  returned_object = Url.find_by_short_url(params[:redirect_short_url])
  @long_url = returned_object.long_url
  returned_object.counter += 1
  returned_object.save
  redirect "#{@long_url}"
  # p params
  # Url.find_by('short_url = ?', params[:short_url])
  # redirect "http://#{params[:long_url]}"
  # redirect to appropriate "long" URL

  ## pseudo
  #find the record
  #increment number of times clicked
  #redirect to (long) url

end

