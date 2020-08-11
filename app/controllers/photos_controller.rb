class PhotosController < ApplicationController
  def new
  end

  def create

    if params[:file]
      response = Cloudinary::Uploader.upload params[:file]
      Photo.create image: response['public_id'], title: params[:photo][:title], post_id: params[:post_id]
    end
    redirect_to post_path(params[:post_id])
  end
end
