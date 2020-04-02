# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  theme       :string
#  description :text
#  time        :datetime
#  course_id   :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lesson < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :course
  has_many :check_ins, dependent: :destroy
  has_many :users, through: :check_ins
  has_many :tasks, dependent: :destroy

  validates :theme, :description, :time, presence: true
  validates :picture, file_size: { less_than: 5.megabytes }
  validate :relevant_time

  def start_time
    time
  end

  def relevant_time
    errors.add(:time, ': invalid date') if (Time.now > time) || (time > '2050-01-01')
  end




  def as_json(options={})
    h = if options.key?(:only) or options.key?(:methods) or options.key?(:include) or options.key?(:except)
          super(options)
        else
          super(only: %i[id theme],
                    methods: [:title])
        end
  end

  def title
    theme
  end

  def start
    time.strftime("%Y-%m-%d %R")
  end

  def allDay
    false
  end

  def extendedProps
    status = time > Time.now ? true : false
    id = self.id
    extendedProps = Hash.new
    extendedProps = { "status" => status, "id" => id }
  end
end
