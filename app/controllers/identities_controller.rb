class IdentitiesController < ApplicationController
  before_action :set_identity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @identities = Identity.all
    respond_with(@identities)
  end

  def show
    filename =  "Identidade #{@identity.id}.pdf"
    respond_to do |format|
      format.html
      format.pdf do
        render pdf:filename,                  # file name
               layout: 'layouts/pdf_layout.pdf.erb'  # layout used
      end
    end
  end

  def new
    @identity = Identity.new
    respond_with(@identity)
  end

  def edit
  end

  def create
    @identity = Identity.new(identity_params)
    @identity.user_id = current_user.id
    @identity.user_name = current_user.name
    
    @identity.save
    respond_with(@identity)
  end

  def update
    @identity.update(identity_params)
    respond_with(@identity)
  end

  def destroy
    @identity.destroy
    respond_with(@identity)
  end

  private
    def set_identity
      @identity = Identity.find(params[:id])
    end

    def identity_params
      params.require(:identity).permit(:name, :enrollment, :campus)
    end
end
