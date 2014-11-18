ActiveAdmin.register Product do

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

  menu priority: 2

  permit_params :name, :price, :stock_quantity, :description, :category_id, :image

  index title: 'Products' do
    selectable_column
    column :name

    column :price do |product|
      number_to_currency product.price
    end

    column :stock_quantity
    column :description
    column :category

    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :price
      f.input :stock_quantity
      f.input :description
      f.input :category
      f.input :image
    end
    f.actions
  end

end
