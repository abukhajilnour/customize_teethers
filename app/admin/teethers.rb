ActiveAdmin.register Teether do

 index do
  column :name
  column :money do |p|
    number_to_currency p.price
  end
  column :theme

 end
  
end
