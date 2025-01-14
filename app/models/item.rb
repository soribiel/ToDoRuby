class Item < ApplicationRecord
  belongs_to :list
  validates :content, presence: true

  CATEGORY = {
    1 => 'Atividade Física',
    2 => 'Lazer',
    3 => 'Trabalho',
    4 => 'Estudos',
    5 => 'Compras',
    6 => 'Casa',
    7 => 'Saúde'
  }
  CATEGORY_IMAGES = {
    1 => 'exercise.png',
    2 => 'park.png',
    3 => 'working.png',
    4 => 'studying.png',
    5 => 'online-shopping.png',
    6 => 'home.png',
    7 => 'cardiogram.png'
  }
  def category_name
    CATEGORY[category] || 'Indefinido'
  end

  def category_image
    CATEGORY_IMAGES[category] || 'default.png'
  end
end
