class Article < ActiveRecord::Base
  attr_accessible :title, :body, :released_at, :expired_at,
    :no_expiration, :member_only, as: :admin

  validates :title, :body, :released_at, presence: true
  validates :title, length: {maximum: 200}

  validate :check_expired_at

  def no_expiration
    expired_at.blank?
  end

  def no_expiration=(val)
    @no_expiration = val.in?([true, 1, "1"])
  end

  before_validation :clear_expired_at

  def clear_expired_at
    self.expired_at = nil if @no_expiration
  end
  
  scope :readable_for,
    ->(member){ 
        now = Time.current
        rel = where("released_at <= ? AND (? < expired_at OR " + 
        "expired_at IS NULL)", now, now) 
        member.kind_of?(Member) ? rel : rel.where(member_only: false)
      }
  #class method
  class << self
    def sidebar_articles(member, num = 5)
      readable_for(member).order("released_at DESC").limit(num)
    end
  end

  private
  def check_expired_at
    if expired_at && expired_at < released_at
      errors.add(:expired_at, :expired_at_too_old)
    end
  end
end
