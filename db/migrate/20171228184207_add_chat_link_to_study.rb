class AddChatLinkToStudy < ActiveRecord::Migration[5.2]
  def change
    add_column :studies, :chat_link, :string
    add_column :studies, :survey_link, :string
    add_column :studies, :consent, :boolean, default: true
  end
end
