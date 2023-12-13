class User < ApplicationRecord
    before_save :encrypt_tokens
    after_find :decrypt_tokens

    private
        def encrypt_tokens
            encryptor = ActiveSupport::MessageEncryptor.new(ENV['SECRET_KEY_BASE'][0..31])
            self.refresh_token = encryptor.encrypt_and_sign(self.refresh_token) if self.refresh_token.present?
            self.access_token = encryptor.encrypt_and_sign(self.access_token) if self.access_token.present?
        end

        def decrypt_tokens
            encryptor = ActiveSupport::MessageEncryptor.new(ENV['SECRET_KEY_BASE'][0..31])
            self.refresh_token = encryptor.decrypt_and_verify(self.refresh_token) if self.refresh_token.present?
            self.access_token = encryptor.decrypt_and_verify(self.access_token) if self.access_token.present?
        end
end
