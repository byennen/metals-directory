class Admin::CompaniesController < Admin::ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to admin_companies_path, notice: 'Company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to admin_companies_path, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  def set_categories
    @categories = Category.all
    @equipment_categories = Category.where(category_type: 'Equipment')
    @service_categories = Category.where(category_type: 'Service')
    @material_categories = Category.where(category_type: 'Material')
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:contact_name, :company_name, :sub_company_name, :address_1, :address_2, :city,
                                    :state, :zip, :country, :website, :phone_1, :phone_2, :fax, :logo_package_id, :logo,
                                    branches_attributes: [:name, :address_1, :address_2, :city, :state, :zip, :country, :phone_1, :phone_2, :fax])
  end
end
