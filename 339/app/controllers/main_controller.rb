class MainController < ApplicationController
def form
  render :form and return
end

def upload
  filename = params[:file].original_filename
  image = Image.new
  image.data         = params[:file].read
  image.content_type = params[:file].content_type
  image.extension    = filename.downcase.split(".").last
  image.save!
  respond_to do |format|
    format.html { redirect_to form_path and return }
    format.json { render :json => image.id and return }
  end
end

def image_data
  image = Image.find(params[:id])
  send_data image.data, type: image.content_type,
    disposition: "inline"
end

end
