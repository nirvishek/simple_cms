class PagesController < ApplicationController
  
  layout false

  def new
    @page=Page.new(:name => "default")
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end

  end

  def index
    @pages=Page.all.order('position ASC')
  end

  def show
    @page=Page.find(params[:id])
  end

  def edit
    @page=Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end  

  end


  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' deleted successfuly."
    redirect_to(:action => 'index')
  end

  private
    def page_params
      params.require(:page).permit(:name,:position,:visible,:permalink)
    end

end
