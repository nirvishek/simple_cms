class SectionsController < ApplicationController
  
  layout false
  def new
    @section= Section.new(:name => "default")
  end

  def create
    @section=Section.new(section_params)

    if @section.save
      flash[:notice] ="section successfully saved."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def index
    @sections=Section.all.order('position ASC')
  end

  def show
    @section=Section.find(params[:id])
  end

  def edit
    @section=Section.find(params[:id])
  end

  def update
    @section=Section.find(params[:id])

    if @section.update_attributes(section_params)
      flash[:notice] = "Section successfully updated."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def delete
    @section=Section.find(params[:id])
  end

  def destroy
    section=Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' successfully deleted."
    redirect_to(:action => 'index')
  end

  private
    def section_params
      params.require(:section).permit(:name,:position,:visible,:conten_type,:content)
    end
end
