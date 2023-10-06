class Sub < ApplicationRecord
    validates :description, :moderator_id, presence: true

    belongs_to :moderator,
        primary_key: :id,
        primary_key: :moderator_id,
        class_name: :User

    
    def is_moderator?
        current_user.id == moderator_id
    end
end
