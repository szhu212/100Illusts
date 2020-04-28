class Api::PicturesController < ApplicationController
    
    def index
        @pictures = Picture.all 
        render :index
    end
    
    def show  
         @picture= Picture.find(params[:id])
        render :show
    end

    def create
            @picture = Picture.new(pic_params)
            if @picture.save
                render :show
            else
                render json: @picture.errors.full_messages, status: 422
            end 
    end
    
    def destroy 
        @picture = Picture.find(params[:id])
        @picture.destroy
        rebder :show
    end

    def user_picrure_index
        @pictures = Picture.where(author_id:params[:user_id])
        render :user_picrure_index
    end

    private
    
    def pic_params
        params.require(:picture).permit(:title, :author_id, :description, :equipment_or_material, :picture)
    end
end
