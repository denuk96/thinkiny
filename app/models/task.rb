class Task < ApplicationRecord
  belongs_to :lesson

  validates :title, :body, presence: true
  validates :title, length: { in: 3..20 }
  validates :body, length: { in: 5..300 }
  validates :status, inclusion: { in: [true, false] }
end
