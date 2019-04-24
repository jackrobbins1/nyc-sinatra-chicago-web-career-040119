class LandmarksController < ApplicationController
  #-------- All
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end
#----------------------- New/Show
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end
#-------------------- Edit

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end

  #----------------Delete

  # delete '/landmarks/:id' do
  #   landmark = Landmark.find(params[:id])
  #   landmark.destroy
  #   redirect "/landmarks"
  # end


end
