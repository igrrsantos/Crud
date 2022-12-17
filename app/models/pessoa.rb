class Pessoa < ApplicationRecord
  before_save :format_date

  def format_date
    self.birth_date = birth_date.to_date.strftime('%d/%m/%Y')
  end
end
