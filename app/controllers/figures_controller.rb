class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
#----------------------- New/Show
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    title = Title.create(params[:title])
    landmark = Landmark.create(params[:landmark])
    figure.titles&.push(title)
    figure.landmarks&.push(landmark)
    binding.pry
    redirect "/figures/#{figure.id}"
  end
#-------------------- Edit

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    Title.create(params[:title])
    Landmark.create(params[:landmark])
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    redirect "/figures/#{figure.id}"
  end
end
