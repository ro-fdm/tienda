class LineItem < ActiveRecord::Base
  belongs_to :producto
  belongs_to :pedido
end
