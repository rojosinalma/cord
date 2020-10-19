class String
  def to_id
    self.gsub(/\D/, '').to_i
  end
end
