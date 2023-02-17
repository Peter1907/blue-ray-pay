require 'image_processing/mini_magick'

class ImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size 5 * 1024 * 1024
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      small: magick.resize_to_limit!(150, 150)
    }
  end
end
