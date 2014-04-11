class ClientsController < MastersController
private

  def client_params
    params.require(:client).permit(:code, :name, :contact, :photo, :remote_photo_url, :notes, :created_by, :updated_by)
  end
end
