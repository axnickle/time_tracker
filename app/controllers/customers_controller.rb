class CustomersController < ApplicationController
  def index #calls index method, so that's why we're defining it here
    @customers = Customer.all #Customer is the class
  end
end
