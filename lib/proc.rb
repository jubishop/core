class Proc
  def run(*params)
    return call(*params)
  rescue LocalJumpError => error
    return error.exit_value
  end
end
