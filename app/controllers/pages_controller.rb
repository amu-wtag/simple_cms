class PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
    @subjects = Subject.sorted
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = t('pages.create.success')
      redirect_to pages_path
    else
      @page_count = Page.count + 1
      @subjects = Subject.sorted
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.sorted
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      flash[:notice] = t('pages.update.success')
      redirect_to pages_path
    else
      @page_count = Page.count
      @subjects = Subject.sorted
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
end
