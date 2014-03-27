class CustomersController < ApplicationController
  layout "sidebar"
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :restrict_access, if: lambda { |controller|  controller.request.format.json? }
  before_filter :authenticate_user!, except: [:create]
  skip_before_action :verify_authenticity_token

  # GET /customers
  # GET /customers.json
  def index
    if params[:filter] != "All"
      @customers = current_user.customers.to_a.select { |c| c.custom_data.keys.include?(params[:filter]) }
    else
      @customers = current_user.customers
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = ApiKey.find_by_access_token(params[:access_token]).user_id if params[:access_token]

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer.user_id = ApiKey.find_by_access_token(params[:access_token]).user_id if params[:access_token]

    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      # get all custom_data params to pass into strong params
      unknown_property_keys = params[:customer][:custom_data].try(:keys)
      params.require(:customer).permit(:user_id, :email, { custom_data: unknown_property_keys },
                                      :id_on_app)
    end

    def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
    end
end
