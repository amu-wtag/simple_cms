class PagesController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  # find_subjects method runs before the other methods
  before_action :find_subjects, only: %i[new create edit update]

  before_action :set_page_count, only: %i[new edit update]

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = t('pages.create.success')
      redirect_to pages_path
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      flash[:notice] = t('pages.update.success')
      redirect_to pages_path
    else
      @page_count = Page.count
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = t('pages.destroy.success', page_name: @page.name)
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_page_count
    @page_count = Page.count
    return unless params[:action] == 'new' || params[:action] == 'create'

    @page_count += 1
  end
end
