module RequestSpecHelper
  # Parse JSON response to Ruby hash
  # TODO @thangle: where does the response object come from ? It's not define in the method parameters
  def json
    JSON.parse(response.body)
  end
end