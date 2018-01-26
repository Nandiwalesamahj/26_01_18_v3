class Excelattach < ApplicationRecord
	mount_uploader :excel, AttachmentUploader
end
