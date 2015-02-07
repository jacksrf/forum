class EntriesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if @user
      @entries = Entry.order('created_at DESC')
    else
      redirect_to '/login'
    end
  end

  def show
    @entry = Entry.find_by(id: params[:id])
    @comments = @entry.comments
    @comment = Comment.new
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to entry_path(@entry)
    else
      render :new
    end
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    @entry.update(entry_params)
    redirect_to entry_path(@entry)
  end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    @entry.destroy
    @entry.comments.destroy
    redirect_to entries_path
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :content, :user_id)
    end
end
