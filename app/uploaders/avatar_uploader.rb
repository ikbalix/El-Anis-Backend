class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  version :dashboard do
    process :resize_to_fit => [800, 800]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{timestamp}.#{file.extension}" if original_filename.present?
 end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
  end
end