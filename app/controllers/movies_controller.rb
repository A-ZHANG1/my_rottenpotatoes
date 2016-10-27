class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
   id = params[:id] # retrieve movie ID from URI route
   @movie = Movie.find(id) # look up movie by unique ID
   # will render app/views/movies/show.html.haml by default
  end
  
  def create
   params.permit!
   @movie = Movie.create!(params[:movie])
   redirect_to movies_path
  end

  def new
      #default :render 'new' template
  end
   
  def edit
   @movie = Movie.find params[:id]
  end
 
  def update
   @movie = Movie.find params[:id]
   params.permit!
   @movie.update_attributes!(params[:movie])
   flash[:notice] = "#{@movie.title} was successfully updated."
   redirect_to movie_path(@movie)
  end
end