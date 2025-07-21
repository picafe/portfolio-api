class Project < ApplicationRecord
  has_one_attached :cover_image
  has_many_attached :gallery_images

  validates :title, presence: true
  validates :description, presence: true
  validates :tools_used, presence: true

  scope :ordered, -> { order(:created_at) }

  def tools_array
    tools_used.split(",").map(&:strip)
  end

  def tools_array=(array)
    self.tools_used = array.join(", ")
  end

  def remove_gallery_image(attachment_id)
    gallery_images.find(attachment_id).purge
  end

  def remove_gallery_image_by_blob_id(blob_id)
    gallery_images.find_by(blob_id: blob_id)&.purge
  end
end
