class WishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = Wishlist.where("user_id = " + current_user.id.to_s)
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
    @wishlist_id = params[:id].to_s
    @items = Item.where("wishlist_id = '" + params[:id].to_s + "'")
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
    redirect_to root_path
    flash[alert] = "Em breve."
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    
    valid = validateCustomLink(wishlist_params[:link])
    
    if valid[0]
      @wishlist = Wishlist.new(wishlist_params)

      respond_to do |format|
        if @wishlist.save
          format.html { redirect_to root_path, notice: 'Lista de desejos criada com sucesso.' }
          format.json { render :show, status: :created, location: @wishlist }
        else
          format.html { redirect_to root_path }
          
          flash[alert] = ""
          
          @wishlist.errors.each do |key|
            flash[alert] = flash[alert] + " " + @wishlist.errors[key][0]
          end
        end
      end
    else 
      flash[alert] = valid[1]
      redirect_to root_path
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: 'Lista de desejos editada com sucesso.' }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    
    listItems = Item.where("wishlist_id = '" + @wishlist.id + "'")
    
    listItems.each do |item|
      item.delete
    end
    
    @wishlist.destroy
    
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Lista de desejos excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id, :nome, :desc, :link)
    end
    
    def validateCustomLink(link)
      valid = [true, ""]
      
      # Só pode ter letras minúsculas sem acento
      link.each_char do |letra|
        if letra.ord < 97 or letra.ord > 122
          valid = [false, "O link deve conter apenas letras minúsculas."]
        end
      end
      
      # O link deve ser único por usuário
      if Wishlist.where("link = '"+link+"'").size > 0
        valid = [false, "O link deve ser único."]
      end
      
      return valid
    end
end
