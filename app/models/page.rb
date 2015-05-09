class Page < ActiveRecord::Base
	#создаем связь модели к самой себе
	has_many :subpages, class_name: "Page", foreign_key: "parent_name"
	belongs_to :manager, class_name: "Page"

	#поля обязательные к заполнению
	validates :name, :title, :text, presence: true

	#уникальным д.б. только название, т.к. оно используется в урл
	#заголовки статей могут быть одинаковыми, мало ли на свете извращенцев
	validates :name, uniqueness: true

end
