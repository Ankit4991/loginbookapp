class BooksController < ApplicationController	
	before_action :find_user, only: [:show,:edit,:update,:destroy]
	before_action :authenticate_user!
	
	
	def index
    	@books = Book.all
    end
	
	def show
	    
  	end
	
	def new
		@book = Book.new
	end
  	
  	def edit
	end
  	
  	def create

  		@book = Book.new(book_params)
  		@book.user_id = current_user.id
   		if @book.save
	    	redirect_to @book
	   	else
	    	render 'new'
	   	end
  	end
  	
  	def update
	    if @book.update(book_params)
	      redirect_to @book
	    else
	      render 'edit'
	    end
  	end
 
	def destroy
		@book.destroy
		redirect_to books_path
	end

	def find_user
		@book= Book.find(params[:id])
	end
	private
	def book_params
		params.require(:book).permit(:title, :text)
	end

end

