module ApplicationHelper
  def optimized_cl_image_path(public_id, options = {})
    default_transformation = [
      {:quality => "auto", :fetch_format => :auto},  # Optimize quality and format
      {:dpr => 'auto'},                              # Serve based on device pixel ratio
      {:flags => "lossy"}                            # Apply lossy compression
    ]

    # Merge with any additional transformations passed in options
    transformations = options[:transformation] || []
    options[:transformation] = default_transformation + transformations

    cl_image_path(public_id, options)
  end
end
