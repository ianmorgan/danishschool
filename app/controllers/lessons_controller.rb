class LessonsController < AdminPageController
  layout "internal"
  
  def index
    @lessons = Lesson.ordered.all
    render :template => 'lessons/index'
  end
  
  def edit
    @lesson = Lesson.find(params[:id])
    render :template => 'lessons/edit'
  end
  
  def show
    @lesson = Lesson.find(params[:id])
    render :template => 'lessons/show'
  end
  
  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(params[:lesson])
      flash[:notice] = 'Lesson content was successfully updated.'
      redirect_to(@lesson) 
    end
  end
  
end
