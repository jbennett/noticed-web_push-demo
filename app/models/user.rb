class User < ApplicationRecord
  include Clearance::User
  has_many :notifications, as: :recipient, dependent: :destroy
	has_many :web_push_subscriptions, class_name: "Noticed::WebPush::Subscription", dependent: :destroy
end
