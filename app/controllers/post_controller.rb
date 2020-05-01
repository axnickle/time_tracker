# posts_controller.rb

before_action :require_user, except: [:show, :index] # means that if you are not logged in you can only use the show or index action
