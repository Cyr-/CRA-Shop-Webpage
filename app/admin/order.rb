ActiveAdmin.register Order do
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
  # endmenu priority: 2

  permit_params :user_id, :amount, :tax, :shipped, :paid

  index title: 'Orders' do
    selectable_column
    column :id
    column :user

    column :amount do |order|
      number_to_currency order.amount
    end

    column :tax do |order|
      number_to_currency order.tax
    end

    column :shipped
    column :paid

    actions
  end

  ActiveAdmin.register Order do
    show do |order|
      div do
        h2 'Line Items'
        order.line_items.each do |line_item|
          h4 "#{line_item.product.name} - #{number_to_currency line_item.price}"
        end
        active_admin_comments
      end
    end
  end
end
