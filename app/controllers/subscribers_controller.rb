
class SubscribersController < ApplicationController
  def create
  source = params.dig(:subscriber, :source).presence

  if source.blank? && request.referer.present?
    source = URI.parse(request.referer).path
  end

  return_path = case source
  when "about-top", "about-bottom"
    about_path(anchor: source)
  when "about", "/about"
    about_path
  when "/works"
    works_path(anchor: "early-access")
  when "/fandoms"
    fandoms_path(anchor: "early-access")
  else
    root_path(anchor: "early-access")
  end

  return_path = case source
  when "about-top", "about-bottom"
    about_path(anchor: source)
  when "about"
    about_path
  else
    root_path(anchor: "early-access")
  end

    unless params.dig(:subscriber, :consent) == "1"
      redirect_to return_path,
                  alert: "Подтвердите согласие на обработку данных.",
                  status: :see_other
      return
    end

    email = params.dig(:subscriber, :email).to_s.strip.downcase

    subscriber = Subscriber.find_or_initialize_by(email: email)
    subscriber.consented_at ||= Time.current

    if subscriber.save
      redirect_to return_path,
                  notice: "Спасибо! Вы в списке раннего доступа.",
                  status: :see_other
    else
      redirect_to return_path,
                  alert: subscriber.errors.full_messages.to_sentence,
                  status: :see_other
    end
  end
end
