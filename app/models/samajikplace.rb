class Samajikplace < ApplicationRecord
	mount_uploader :photo, FileUploader
	mount_uploader :attachment, AttachmentUploader
end
