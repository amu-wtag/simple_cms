class DemoController < ApplicationController
  layout false

  $global_array = [1,2,34]
  def index
    @id = params['id']
    @page = params[:page]
    render('index')
  end

  def hello
    @ar = [1,2,3,4,5]
    render('hello')
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def welldev
    redirect_to('https://www.welldev.io/')
  end
end
