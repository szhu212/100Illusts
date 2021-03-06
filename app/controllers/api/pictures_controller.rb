class Api::PicturesController < ApplicationController
    
    def index
        @pictures = Picture.all#.order('updated_at ASC') 
        @pictures = @pictures.reverse
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
        render :show
    end

    def user_picrure_index
        # debugger
        @pictures = Picture.where(author_id:params[:user_id])
        render :user_picture_index
    end

    def editor_index
        @pictures = Picture.where(editors_choice: true)#.order('updated_at DESC') 
        @pictures = @pictures.reverse
        render :editor_index
    end

    private
    
    def pic_params
        params.require(:picture).permit(:title, :author_id, :description, :equipment_or_material, :picture)
    end
end
