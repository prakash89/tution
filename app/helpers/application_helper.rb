module ApplicationHelper

  def get_exam_type
    ["Acadamic", "Compitative"]
  end

  def get_class_names
    ["below 7th", "below 10th", "1st PU", "2nd PU", "Degree in Bsc", "Degree in Bcom", "Degree in BA", "Master degree", "Others"]
  end

  def get_course_ids
  	Event.all.collect{ |f| [f.name, f.id]}
  end

  def get_payment_modes
  	["Cash", "DD", "Check", "Card"]
  end
end
