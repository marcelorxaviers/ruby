class LeadsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :set_lead_through_lead_id, only: [:zoho_add, :zoho_remove]

  def zoho_add
    if @lead.zoho_save
      respond_to do |format|
        format.html { redirect_to leads_path, notice: "Added lead '#{@lead.full_name}' to zoho." }
        format.json { render action: 'show', status: :created, location: @lead }
      end
    else
      respond_to do |format|
        format.html { redirect_to leads_path, alert:  "It was not possible to update the lead." }
        format.json { render action: 'show', status: :created, location: @lead }
      end
    end
  end

  def zoho_remove
    if @lead.zoho_remove
      respond_to do |format|
        format.html { redirect_to leads_path, notice: "Removed lead '#{@lead.full_name}' from zoho." }
        format.json { render action: 'show', status: :created, location: @lead }
      end
    else
      respond_to do |format|
        format.html { redirect_to leads_path, alert: "It was not possible to update the lead." }
        format.json { render action: 'show', status: :created, location: @lead }
      end
    end
  end

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.where(company_id: (current_user.companies.to_a))
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
    @companies = current_user.companies.to_a
    if @companies.size < 1
      respond_to do |format|
        format.html { redirect_to new_company_path, alert: 'Before creating a new lead you must create a leading company.' }
        format.json { render json: ['Before creating a new lead you must create a leading company.'], status: :unprocessable_entity }
      end
    end
  end

  # GET /leads/1/edit
  def edit
    @companies = current_user.companies.to_a
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    @companies = current_user.companies.to_a

    respond_to do |format|
      if @lead.save
          format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
          format.json { render action: 'show', status: :created, location: @lead }
      else
        format.html { render action: 'new' }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_lead_through_lead_id
      @lead = Lead.find(params[:lead_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:name, :last_name, :email, :company_name, :job_title, :phone, :website, :company_id)
    end
end
