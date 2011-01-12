module LessonsHelper

  def formatted_lesson_name(lesson)
    h(lesson.taught_class.name) + " on " + h(lesson.event.event_date.to_formatted_s(:day_month_year))   
  end

end
