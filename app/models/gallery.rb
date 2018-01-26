class Gallery < ApplicationRecord
	mount_uploader :photo, FileUploader
end
