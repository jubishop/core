class Proc
  def run(*params)
    return call(*params)
  rescue LocalJumpError => e
    return e.exit_value
  end
end
