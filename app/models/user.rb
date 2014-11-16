class User < ActiveRecord::Base
  after_create :login!

  def login!
    update_attributes session: Digest::MD5.hexdigest("#{self.name}#{Time.now.to_s}")
  end
end
