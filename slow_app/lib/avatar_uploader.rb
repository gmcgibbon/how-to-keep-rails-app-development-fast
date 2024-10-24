module AvatarDownloader
  class << self
    def download(user)
      bucket.file("path/to/#{user.avatar_path}")
    end

    private

    def bucket
      @bucket ||= storage.bucket("avatar-bucket")
    end

    def storage
      @storage ||= Google::Cloud::Storage.new(
        project_id: "my-project",
        credentials: "/path/to/keyfile.json"
      )
    end
  end
end
