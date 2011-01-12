class TaughtClassesController < ApplicationController
  layout "internal"
  

  # GET /taught_classes
  # GET /taught_classes.xml
  def index
    @taught_classes = TaughtClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taught_classes }
    end
  end

  # GET /taught_classes/1
  # GET /taught_classes/1.xml
  def show
    @taught_class = TaughtClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taught_class }
    end
  end

  # GET /taught_classes/new
  # GET /taught_classes/new.xml
  def new
    @taught_class = TaughtClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @taught_class }
    end
  end

  # GET /taught_classes/1/edit
  def edit
    @taught_class = TaughtClass.find(params[:id])
  end

  # POST /taught_classes
  # POST /taught_classes.xml
  def create
    @taught_class = TaughtClass.new(params[:taught_class])

    respond_to do |format|
      if @taught_class.save
        flash[:notice] = 'TaughtClass was successfully created.'
        format.html { redirect_to(@taught_class) }
        format.xml  { render :xml => @taught_class, :status => :created, :location => @taught_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @taught_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /taught_classes/1
  # PUT /taught_classes/1.xml
  def update
    @taught_class = TaughtClass.find(params[:id])

    respond_to do |format|
      if @taught_class.update_attributes(params[:taught_class])
        flash[:notice] = 'TaughtClass was successfully updated.'
        format.html { redirect_to(@taught_class) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @taught_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /taught_classes/1
  # DELETE /taught_classes/1.xml
  def destroy
    @taught_class = TaughtClass.find(params[:id])
    @taught_class.destroy

    respond_to do |format|
      format.html { redirect_to(taught_classes_url) }
      format.xml  { head :ok }
    end
  end
end
