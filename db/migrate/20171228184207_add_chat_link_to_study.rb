class AddChatLinkToStudy < ActiveRecord::Migration
  def change
    add_column :studies, :chat_link, :string
    add_column :studies, :survey_link, :string
    add_column :studies, :consent, :boolean, default: true
  end
end
