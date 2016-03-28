module TokenGenerator
  def self.generate(user)
    payload = {
      user: {
        id: user.id
      }
    }

    TokenEncoder.encode(payload)
  end
end
