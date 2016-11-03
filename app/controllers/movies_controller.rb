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
   @movie = Movie.new(params[:movie])
   if @movie.save
       flash[:notice]="#{@movie.title} successfully saved!"
       redirect_to movies_path
   else
       render 'new' #thinking redirect_to new_movie_path might also work
   end
  end

  def new
      @movie=Movie.new
      #default :render 'new' template
  end
   
  def edit
   @movie = Movie.find params[:id]
  end
 
  def update
   @movie = Movie.find params[:id]
   params.permit!
   if @movie.update_attributes(params[:movie])
       flash[:notice] = "#{@movie.title} was successfully updated."
       redirect_to movie_path(@movie)
   else
       render 'edit'
   end
  end
  
  def destroy
   @movie = Movie.find(params[:id])
   @movie.destroy
   flash[:notice] = "Movie '#{@movie.title}' deleted."
   redirect_to movies_path
  end
  
  def search_tmdb
   flash[:warning]="'#{params[:search_terms]}' was not found in TMDb."
   redirect_to movies_path
  end

end