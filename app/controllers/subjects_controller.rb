class SubjectsController < ApplicationController
  layout 'admin'

  def index
    @subjects = Subject.sorted
    # render('index') #by default rails will look for index
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = t('subjects.create.success')
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count
      render('new')
    end
  end

  def edit
    @subject_count = Subject.count
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      flash[:notice] = t('subjects.update.success')
      redirect_to(subject_path(@subject))
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = t('subjects.destroy.success', subject_name: @subject.name)
    redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
