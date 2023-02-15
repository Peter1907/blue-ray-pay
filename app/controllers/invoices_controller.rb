class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.includes(:invoices).find(params[:format])
    @invoices = @category.invoices.order('created_at DESC')
  end

  def new
    @invoice = Invoice.new
    @categories = Category.where(user: current_user)
  end

  def create
    if record_params[:categories].nil?
      flash[:alert] = 'Please select at least one category'
      redirect_to new_transaction_path
      return
    end

    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user

    if @invoice.save
      record_params[:categories].each do |id|
        Record.create(invoice: @invoice, category_id: id.to_i)
      end
      flash[:notice] = 'Transaction created successfully'
      redirect_to transactions_path(@invoice.id)
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :amount)
  end

  def record_params
    params.require(:invoice).permit(:categories => [])
  end
end
