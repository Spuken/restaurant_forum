class Admin::CategoriesController < Admin::BaseController
    before_action :set_category_by_params_id, only: [:update, :destroy]

    def index
        @categories = Category.all
        if params[:id]
            @category = Category.find(params[:id])
        else
            @category = Category.new
        end
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "category was successfully created..."
            redirect_to admin_categories_path
        else
            flash[:alert] = "category was fail to create..."
            @categories = Category.all
            render :index
        end
    end
    
    def update
        #set_category_by_params_id
        if @category.update(category_params)
            flash[:notice] = "category was successfully updated..."
            redirect_to admin_categories_path
        else
            flash[:alert] = "category was fail to update..."
            @categories = Category.all
            render :index
        end    
    end

    def destroy
        #set_category_by_params_id
        @category.destroy
        flash[:notice] = "category was successfully deleted"
        redirect_to admin_categories_path
    end
    
    

    private

    def set_category_by_params_id
        @category = Category.find(params[:id])
    end
    

    def category_params
        params.require(:category).permit(:name)
    end
    

end
