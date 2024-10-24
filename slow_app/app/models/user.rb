class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  class << self
    attr_accessor :default_name
  end

  after_initialize do
    self.name ||= default_name
  end
end
