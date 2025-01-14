class ListsController < ApplicationController
    def index
      @lists = List.includes(:items).all
      @new_list = List.new
      @new_item = Item.new
    end
  
    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to root_path, notice: 'Lista criada com sucesso.'
      else
        redirect_to root_path, alert: 'Erro ao criar a lista.'
      end
    end
  
    def update
      @list = List.find(params[:id])
      if @list.update(list_params)
        redirect_to root_path, notice: 'Lista atualizada com sucesso.'
      else
        redirect_to root_path, alert: 'Erro ao atualizar a lista.'
      end
    end
  
    def destroy
      @list = List.find(params[:id])
      @list.destroy
      redirect_to root_path, notice: 'Lista excluída com sucesso.'
    end
  
    def add_item
      @list = List.find(params[:id])
      @item = @list.items.new(item_params)
      if @item.save
        redirect_to root_path, notice: 'Item adicionado com sucesso.'
      else
        redirect_to root_path, alert: 'Erro ao adicionar o item.'
      end
    end
  
    def toggle_item
      @item = Item.find(params[:item_id])
      @item.update(completed: !@item.completed)
      redirect_to root_path
    end
  
    def destroy_item
      @item = Item.find(params[:item_id])
      @item.destroy
      redirect_to root_path
    end

    def sort_items_by_priority
      @list = List.find(params[:id])
      @list.items.order(priority: :desc).each_with_index do |item, index|
      item.update(position: index + 1)
      end
      redirect_to root_path
    end    


    private
  
    def list_params
      params.require(:list).permit(:title)
    end
  
    def item_params
      params.require(:item).permit(:content, :priority, :category)
    end
end