module UsersHelper
  def gravatar_for(user, size:30 )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://i.pravatar.cc/70?img=#{rand{1..70}}"
    image_tag(gravatar_url, alt: user.name,alt:user.email, class: 'gravatar')
  end

end