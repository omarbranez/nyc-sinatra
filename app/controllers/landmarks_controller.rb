class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    # binding.pry
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figure << Figure.create(params[:figure])
    end
    # if !params[:title][:name].empty?
    #   @landmark.titles << Title.create(params[:title])
    # end
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    # binding.pry
    erb :'landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end


  patch '/landmarks/:id' do
    # if !params[:figure].keys.include?("landmark_ids")
    #   params[:owner]["landmark_ids"] = []
    # end
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    # if !params[:figure][:name].empty?
    #   @landmark.figure = Figure.create(params[:figure])
    # end
    # if !params[:title][:name].empty?
    #   @landmark.title << Title.create(params[:title])
    # end
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end
