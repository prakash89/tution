class DocumentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin!, only: [:create, :destroy]

  def index
    @document = Document.new
    @documents = Document.all
  end

  def create
    @document = Document.new
    @document.report = params["document"]["report"].first
    @document.save
    redirect_to documents_path
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path
  end

  def download
    document = Document.find params[:id]
    send_file(document.report.current_path,
          :filename => document.report_identifier,
          :type => document.report.content_type,
          :disposition => 'attachment',
          :url_based_filename => true)
  end
end
