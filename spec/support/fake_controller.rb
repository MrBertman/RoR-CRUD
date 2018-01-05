class FakeController < Sinatra::Base
  put '/tasks/task/:id' do |id|
    #puts(id)
    status 200
    content_type :json
    body ''
  end

  get '/tasks/task/:id' do |id|
    #puts(id)
    status 200
    content_type :json
    body '[{}]'
  end

  post '/tasks/task/:id/_update' do
    status 200
    body ''
  end

  delete '/tasks/task/:id' do
    status 200
    body ''
  end
end