class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    # binding.pry
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end


  patch '/figures/:id' do
    # if !params[:figure].keys.include?("landmark_ids")
    #   params[:owner]["landmark_ids"] = []
    # end
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.title << Title.create(name: params[:title])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
