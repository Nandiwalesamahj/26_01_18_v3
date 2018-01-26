class Feedback < ApplicationRecord
	
	searchable do
		text :title, :description
	end
end
