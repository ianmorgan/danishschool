class NewsItemsController < ApplicationController
  layout "internal"
  
  # GET /news_items
  # GET /news_items.xml
  def index
    @news_items = NewsItem.ordered.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_items }
    end
  end

  # GET /news_items/1
  # GET /news_items/1.xml
  def show
    @news_items = NewsItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_items }
    end
  end

  # GET /news_items/new
  # GET /news_items/new.xml
  def new
    @news_items = NewsItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_items }
    end
  end

  # GET /news_items/1/edit
  def edit
    @news_items = NewsItem.find(params[:id])
  end

  # POST /news_items
  # POST /news_items.xml
  def create
    @news_items = NewsItem.new(params[:news_item])

    respond_to do |format|
      if @news_items.save
        flash[:notice] = 'NewsItems was successfully created.'
        format.html { redirect_to(@news_items) }
        format.xml  { render :xml => @news_items, :status => :created, :location => @news_items }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_items.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_items/1
  # PUT /news_items/1.xml
  def update
    @news_items = NewsItem.find(params[:id])

    respond_to do |format|
      if @news_items.update_attributes(params[:news_item])
        flash[:notice] = 'NewsItems was successfully updated.'
        format.html { redirect_to(@news_items) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_items.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.xml
  def destroy
    @news_items = NewsItems.find(params[:id])
    @news_items.destroy

    respond_to do |format|
      format.html { redirect_to(news_items_url) }
      format.xml  { head :ok }
    end
  end
end
