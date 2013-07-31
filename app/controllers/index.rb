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
    erb :_todo_li, layout: false, locals: {task: @task}
  else
    redirect to '/'
  end
end
