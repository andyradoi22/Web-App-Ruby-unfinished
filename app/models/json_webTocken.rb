class JsonWebTocken
    def self.encode(payload)
        expiration = 15.minutes.from_now.to_i
        JWT.encode payload, Rails.application.secrets.secret_key_base
    end

    def self.encode(token)
        JWT.decode(tocken, Rails.application.secrets.secret_key_base).first
    end
end