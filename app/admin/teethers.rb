ActiveAdmin.register Teether do

 index do
  id_column
  column :name
  column :money do |p|
    number_to_currency p.price
  end
  column :theme

 end
  
end
