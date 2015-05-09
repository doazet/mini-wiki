class PagesController < ApplicationController

	
	def index
		@page = Page.all
	end

	def add
		@page = Page.new
	end

	def create
		@page = Page.create(page_params)
		respond_to do |format|
    		if @page.save
      			format.html { redirect_to show_path(@page.name), notice: 'Страница была успешно сохранена' }
      			#format.json { render json: @page, status: :created, location: @page }
    		else
      			format.html { render action: "add" }
      			#format.json { render json: @page.errors, status: :unprocessable_entity }
    		end
   		end
	end

	def add_subpage
		@subpage = Page.new
	end

	def create_subpage
		@subpage = Page.create(page_params)
		respond_to do |format|
    		if @subpage.save
      			format.html { redirect_to show_path(@subpage[:name, :parent_id]), notice: 'Страница была успешно сохранена' }
      			#format.json { render json: @page, status: :created, location: @page }
    		else
      			format.html { render action: "add_subpage" }
      			#format.json { render json: @page.errors, status: :unprocessable_entity }
    		end
   		end
	end	

	def show
		@page = Page.find_by(name: params[:name])
		if @page	
			render action: "show"
		else
			render text: "Страница не найдена", status: 404
		end
	end

	def edit
		@page = Page.find_by(name: params[:name])

	end

	def update
		@page = Page.find_by(name: params[:name])
		if @page.update(page_params)
    			redirect_to show_path(@page.name)
  			else
    			render 'edit'
  			end
	end

	def destroy
		@page = Page.find_by(name: params[:name])
		@page.destroy

		redirect_to root_path
	end

	private

	def page_params
		params.require(:page).permit(:name, :title, :text)
	end

end
