class Component < ApplicationRecord
  include Depreciable
  belongs_to :comp_array
end
