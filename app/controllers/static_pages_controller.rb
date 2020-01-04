class StaticPagesController < ApplicationController
  def home
  end

  def faq
    @mailing_list = MailingList.new
  end

  def rules
  end
end
