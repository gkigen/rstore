class CategoriesController < ApplicationController
  # GET /categories
  
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      
    end
  end

  # GET /categories/1
  
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      
    end
  end

  # GET /categories/new
  
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
 
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        
      else
        format.html { render action: "new" }
        
      end
    end
  end

  # PUT /categories/1
 
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
       
      else
        format.html { render action: "edit" }
        
      end
    end
  end

  # DELETE /categories/1
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      
    end
  end
  private

    def category_params
      # same as using "params[:account]", except that it:
      # - raises an error if :account is not present
      # - allows listed attributes to be mass-assigned
      params.require(:category).permit(:name)
    end
end
