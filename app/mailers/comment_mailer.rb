class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.comment_created.subject
  #
  def comment_created
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
