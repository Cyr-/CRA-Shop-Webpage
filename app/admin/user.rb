ActiveAdmin.register User do
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

  permit_params :first_name, :last_name, :address,
                :postal_code, :region_id, :phone, :email

  index title: 'Users' do
    selectable_column
    column :first_name
    column :last_name
    column :address
    column :postal_code
    column :region
    column :phone
    column :email

    actions
  end
end
