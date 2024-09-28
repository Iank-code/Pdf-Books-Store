module ApplicationHelper
  def human_readable_file_size(size_in_bytes)
    case size_in_bytes
    when 0..1023
      "#{size_in_bytes} Bytes"
    when 1024..(1024 * 1024 - 1)
      "#{(size_in_bytes / 1024.0).round(2)} KB"
    when (1024 * 1024)..(1024 * 1024 * 1024 - 1)
      "#{(size_in_bytes / (1024.0 * 1024)).round(2)} MB"
    else
      "#{(size_in_bytes / (1024.0 * 1024 * 1024)).round(2)} GB"
    end
  end
end
