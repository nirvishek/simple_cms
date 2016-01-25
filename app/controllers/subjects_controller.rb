class SubjectsController < ApplicationController
 
  # layout false
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    # instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # save the new object
    if @subject.save
      # if subject save succeeds redirect to index page
      flash[:notice] = "Subject created successfuly."
      redirect_to(:action => 'index')
    else 
      # else reload the new form page
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # find an existing object using form parameters
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      # if subject update succeeds redirect to index page
      flash[:notice] = "Subject updated successfuly."
      redirect_to(:action => 'index')
    else 
      # else reload the new form page
      render('edit')
    end
  end


  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject=Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' deleted successfuly."
    redirect_to(:action => 'index')
  end

  private

    def subject_params
      params.require(:subject).permit(:name,:position,:visible)
    end


end
