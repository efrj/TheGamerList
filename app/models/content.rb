class Content < ActiveRecord::Base
  after_save :save_slug

  # has_attached_file :image, styles: { medium: "700x450#", thumb: "250x150#" },
  #                   :url  => "/images/content/:id/:style/:basename.:extension",
  #                   :path => ":rails_root/public/images/content/:id/:style/:basename.:extension"

  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # validates_attachment_size :image, less_than: 2.megabytes

  # mount_uploader :image, ImageUploader

  # validates_processing_of :image
  # validate :image_size_validation
   
  private
    def image_size_validation
      errors[:image] << "should be less than 5000KB" if image.size > 5.5.megabytes
    end

  def save_slug
    @slug = self.title
      .gsub(' ','-')
      .gsub('_','-')
      .gsub('"','')
      .gsub('ç','c')
      .gsub('á','a')
      .gsub('é','e')
      .gsub('í','i')
      .gsub('ó','o')
      .gsub('ú','u')
      .gsub('ã','a')
      .gsub('ẽ','e')
      .gsub('ĩ','i')
      .gsub('õ','o')
      .gsub('ũ','u')
      .gsub('â','a')
      .gsub('ê','e')
      .gsub('î','i')
      .gsub('ô','o')
      .gsub('û','u')
      .gsub('ä','a')
      .gsub('ë','e')
      .gsub('ï','i')
      .gsub('ö','o')
      .gsub('ü','u')
      .downcase!
    update_column(:slug, @slug)
  end

end
