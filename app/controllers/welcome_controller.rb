class WelcomeController < ApplicationController
  def index
    #render plain: 'Hello world!'
    render :home
    # this wil automatically search for "home" in welcome/views- the default format is HTML.
    # out templating system is EJS.
    # by default Rails will use app/views/layouts/application.html.erb as the layout,
    # so the content of home.html.erb will be insterted in the place of <%= yield %>


    #the default behavior is to render: index.html.erb from app/views/welcome
  end

  def about
  end

  def contact_us
  end

  def contact_submit
     @name = params[:name]
   end

end
