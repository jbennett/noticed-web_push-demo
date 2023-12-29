# To deliver this notification:
#
# NewPostNotification.with(post: @post).deliver_later(current_user)
# NewPostNotification.with(post: @post).deliver(current_user)

class NewPostNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  deliver_by :web_push, data_method: :web_push_data

  param :post

  def post
    params[:post]
  end

  def web_push_data
    {
      title: "New post: #{post.title}",
      body: post.content.truncate(40),
      url: post_url(post),
    }
  end

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
end
