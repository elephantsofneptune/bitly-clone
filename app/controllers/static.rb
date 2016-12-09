get '/' do
  @urls = Url.last(5)
  erb :"static/index"
end

# ======== CREATE ===========
post '/urls' do
  x = Url.new(params[:url])
  x.save
  @urls = Url.last(5)
  # erb :'static/table', layout: false
  x.to_json
end

# ========= SHORT LINK ADDRESS ==========
get '/:short_url' do
  decode = params[:short_url].to_i(36)

  long = Url.find_by(id:decode).long_url
  count = Url.find_by(id:decode)

  if long
    count.count += 1
    redirect "https://www.#{long}"
  end
end
