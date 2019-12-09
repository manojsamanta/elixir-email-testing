defmodule Helloplug.Email do
  import Bamboo.Email

  def welcome_email(recipient, msg) do
    new_email(
      to: recipient,
      from: "manoj.samanta@gmail.com",
      subject: "Testing",
      html_body: msg,
      text_body: msg
    )
  end

end

