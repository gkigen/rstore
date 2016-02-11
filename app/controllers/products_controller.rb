class ProductsController < ApplicationController
  # GET /products
  
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      
    end
  end

  # GET /products/1
  
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      
    end
  end

  # GET /products/new
  
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
 
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        
      else
        format.html { render action: "new" }
       
      end
    end
  end

  # PUT /products/1
  
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        
      else
        format.html { render action: "edit" }
       
      end
    end
  end

  # DELETE /products/1
 
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      
    end
  end
  private

    def product_params
      # same as using "params[:account]", except that it:
      # - raises an error if :account is not present
      # - allows listed attributes to be mass-assigned
      params.require(:product).permit(:brand, :description, :name, :price, :serial, :sub_category_id, :warranty_expire_at)
    end
end
