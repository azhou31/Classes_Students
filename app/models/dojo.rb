class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :state, length: { minimum: 4 }, presence: true
    validates :state, length: { is: 2 }
    has_many :students, dependent: :destroy
end
