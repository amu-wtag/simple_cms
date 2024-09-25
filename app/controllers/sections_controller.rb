class SectionsController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_page, only: %i[new create]

  def index
    # @sections = Section.sorted
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(page_id: @page.id)
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = t('sections.create.success')
      # redirect_to sections_path
      redirect_to sections_path(page_id: @page.id)
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])

    if @section.update(section_params)
      flash[:notice] = t('sections.update.success')
      # redirect_to sections_path
      redirect_to sections_path(page_id: @page.id)
    else
      @section_count = Section.count
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = t('sections.destroy.success', section_name: @section.name)
    # redirect_to sections_path
    redirect_to sections_path(page_id: @page.id)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
