ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  menu priority: 3

  permit_params :name

  index title: 'Categories' do
    column :name

    actions
  end

  show do |category|
    panel('Products in this category') do
      table_for(category.products) do
        column 'Name' do |product|
          product.name
        end
        column 'Price' do |product|
          product.price
        end
        column 'Quantity' do |product|
          product.stock_quantity
        end
      end
    end
  end

end
