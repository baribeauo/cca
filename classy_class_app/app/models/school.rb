class School < ActiveRecord::Base
	attr_accessible :name, :description, :number_of_days, :number_of_periods, :start_time, :buffer_time

	has_many :users
	has_many :days
	has_one :schedule

	validates :name, presence: true, uniqueness: true
	validates :number_of_days, presence: true, allow_nil: { inclusion: 1..10 }
	validates :number_of_periods, presence: true, allow_nil: { inclusion: 1..26 }
	validates :start_time, presence: true
	validates :buffer_time, presence: true
end
