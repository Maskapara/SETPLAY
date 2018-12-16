class Post < ApplicationRecord
    validates :orgnizer, {presence:true}
    validates :contact, {presence:true} 
    validates :content, {presence:true}

    # 参加者数のバリデーションは後で実装

    validates :game_title, {presence:true}
end
