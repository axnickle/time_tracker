class CustomersController < ApplicationController
  # from url customers/1
  def show
    puts "*********** #{params}" #see what comes into this controller
    @customer = Customer.find params[:id] #@customer is availble for the view
  end

  def index #calls index method, so that's why we're defining it here
    @customers = Customer.all #Customer is the class
  end

  def new
    @customer = Customer.new
  end

  def edit # enable me to add a description for customers
    @customer = Customer.find params[:id]
  end

  def update # enables 'edit' to be saved; in edit.html.erb
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "Customer updated!"
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def create #this could also be 'def new'?
      # getting parameters the user is entering, this info gets
      # passed to the Customer controller; takes attrbutes and makes new customer
      @customer = Customer.new(customer_params) #using strong params in the 'create' action
    if @customer.save
      flash[:notice] = "Customer created!"
      redirect_to @customer #or root_path # the user 'create' action with a save and a redirect
    else
      render :new #if there's a problem creating the new customer
    end
  end

  private # no public access to parameters

  def customer_params
    params.require(:customer).permit(:company, :description, :address1, :address2, :city,
                                 :state, :zip)
  end

end
