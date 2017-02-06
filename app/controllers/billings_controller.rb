class BillingsController < ApplicationController
  
  def index
    @billings = Billing.all.order("created_at DESC")
  end

  def manager_index
    @billings = Billing.all.order("created_at DESC")
  end

  def new
    @billing = Billing.new
    @cources = Event.all
  end

  def create
    @billing = Billing.new(billings_params)
    i= (Billing.last && Billing.last.order_number.present?) ? Billing.last.order_number.split('-').last.to_i : 0000

    binding.pry
    @billing.order_number = "INSP" + '-' + Time.now.strftime("%Y%m%d%H%M%S") + '-' + "#{i+1}"
    if @billing.save
      redirect_to manager_index_billings_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @billing = Billing.find_by_id(params[:id])
    @billing.destroy
    redirect_to billings_path
  end

  def pdf_output
    @billing = Billing.find_by_id(params[:id])

    file_name = "mydoc"
    @file_path = Rails.root.join(Rails.root, "tmp", file_name)

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(:template => 'billings/pdf.html.erb',
        :layout => false,
        :orientation => 'Landscape'))
    File.open(@file_path, 'wb') do |file|
      file << pdf
    end
  end

  def pdf_download
    begin
      send_file params[:file_path] if params[:file_path]
      rescue
        flash[:notice] = "File not found"
        redirect_to billings_path
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
