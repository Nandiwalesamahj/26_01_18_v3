class Recruitment < ApplicationRecord

	mount_uploader :attachment, AttachmentUploader
	mount_uploader :r_photo, FileUploader
end
