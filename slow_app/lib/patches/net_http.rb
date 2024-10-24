require "net/http"

class RestrictedTCPSocket < TCPSocket
  class << self
    attr_accessor :ready

    def open(...)
      raise "Not ready yet" unless ready
      super
    end
  end

  self.ready = false
end

Net::HTTP::TCPSocket = RestrictedTCPSocket
