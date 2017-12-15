class Manogat < ApplicationRecord
	attr_accessor :photo
	mount_uploader :photo, FileUploader
	mount_uploader :attachment, AttachmentUploader
end
