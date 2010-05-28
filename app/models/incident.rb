class Incident < ActiveRecord::Base
  has_many  :involvements
end
