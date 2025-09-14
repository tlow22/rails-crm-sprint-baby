class Api::V1::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /api/v1/contacts
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  # GET /api/v1/contacts/:id
  def show
    render json: @contact
  end

  # POST /api/v1/contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/contacts/:id
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: { errors: @contact.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/contacts/:id
  def destroy
    @contact.destroy
    head :no_content
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :company, :tags, :next_follow_up_date)
  end
end
