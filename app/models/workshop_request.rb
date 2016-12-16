class WorkshopRequest < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :telephone, presence: true
	validates :collage, presence: true
	validates :percentage, presence: true
end
