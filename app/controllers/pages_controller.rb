class PagesController < ApplicationController
  def show #this empty 'show' action in the page controller will be what we use to render our static page
    if valid_page?
      render template: "pages/#{params[:page]}" #for now, we're assuming the static pages lives in teh app/views/pages direcotry and has an html.erb extension
    else
      render file: "public/404.html", status: :not_found
  end
end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end

# All static pages are routed through this controller
