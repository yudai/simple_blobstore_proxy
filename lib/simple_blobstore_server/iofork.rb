class IOFork
  def initialize(response, file)
    @response = response
    @file = file
  end

  def write(arg)
    @response << arg
    @file.write(arg)
  end

  def flush()
    @file.flush()
  end
end
