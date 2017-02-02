class BillingsController < ApplicationController
  def index
    @billings = Billing.all.order("created_at DESC")
  end

  def new
    @billing = Billing.new
    @cources = Event.all
  end

  def create
    @billing = Billing.new(billings_params)
    binding.pry
    if @billing.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @billing = Billing.find_by_id(params[:id])
    @billing.destroy
    redirect_to billings_path
  end

  def test
    file_name = "mydoc"
    @file_path = Rails.root.join(Rails.root, "tmp", file_name)

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(:template => 'users/clients/pdf.html.erb',
        :layout => false,
        :orientation => 'Landscape'))
    File.open(@file_path, 'wb') do |file|
      file << pdf
    end
  end

  def invoice
    @billing = Billing.find_by_id(params[:id])
  end

  private

  def billings_params
    params.require(:billing).permit(:name, :father_name, :address, :cource_id, :amount, :mode_of_payment, :ref_number)
  end
end
