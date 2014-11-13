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

  permit_params :name, :price, :stock_quantity, :description, :category_id

  index :title => "Products" do
    column :name

    column :price do |product|
      number_to_currency product.price
    end

    column :stock_quantity

    column :description

    column :category_id

    actions
  end

end
