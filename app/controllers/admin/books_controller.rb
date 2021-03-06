class Admin::BooksController < Admin::BaseController
  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def new
    @book = Book.new
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update!(book_params)
    respond_to do |format|
      format.html { render "show" }
      format.json { render json: @book }
    end
  end

  def create
    @book = Book.create!(book_params)
    respond_to do |format|
      format.html { render "show" }
      format.json { render json: @book }
    end
  end

  def destroy
    Book.delete(params[:id])
    respond_to do |format|
      format.html { render "index" }
      format.json { render json: Book.all}
    end
  end
private
  def book_params
    params.require(:book).permit(:title, :author, :description, :year, :isbn, :cover_image, :level)
  end
end
