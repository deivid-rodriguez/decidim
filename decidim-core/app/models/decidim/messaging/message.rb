# frozen_string_literal: true

module Decidim
  module Messaging
    class Message < ApplicationRecord
      belongs_to :sender,
                 foreign_key: :decidim_sender_id,
                 class_name: "Decidim::User"

      belongs_to :chat,
                 foreign_key: :decidim_chat_id,
                 class_name: "Decidim::Messaging::Chat"

      has_many :receipts,
               dependent: :destroy,
               foreign_key: :decidim_message_id,
               inverse_of: :message

      validates :sender, :body, presence: true
      validates :body, length: { maximum: 1_000 }
    end
  end
end
