get '/' do
  @tasks = Task.all
  erb :index
end

get '/tasks/new' do
  erb :new, layout: !request.xhr?
end

post '/tasks' do
  @task = Task.create(params[:task])
  if request.xhr?
    content_type :json
    @task.to_json
  else
    redirect to '/'
  end
end
