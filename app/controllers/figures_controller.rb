class FiguresController < ApplicationController

  #show all of the figures
  get '/figures' do #index action
    # binding.pry
    @figure = Figure.all
    erb :"landmarks/index"
  end

  get '/figures/new' do #new action # render a new form
    @titles = Title.all
    @landmarks = Landmark.all
    # binding.pry
    erb :"landmarks/new"
  end

  post '/figures' do #create action #taking our data from new form and creating a new instance of figures
    binding.pry
    figure = Figure.new(params[:figure])
    figure.save

    lm = Landmark.new(params[:landmark])
    lm.figure = figure
    lm.save

    title = Title.new(params[:title])
    title.save
    fg = FigureTitle.new(figure_id: figure.id,title_id: title.id)
    fg.save

     redirect "/figures/#{figure.id}" #single instance of the figure
  end

  get '/figures/:id' do #show action #take params[:id] will display or render the show page for that specific figure

  end

  get '/figures/:id/edit' do    #display the edit form for that figure that matches the :ID

  end

  patch '/figures/:id' do
    #we're taking info from the edit form and updating the figure that matches [:ID]
  end

  delete '/figures/:id' do
    #deletes the figure matching params[:ID]
  end

end
