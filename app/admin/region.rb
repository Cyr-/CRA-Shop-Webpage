ActiveAdmin.register Region do
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

  permit_params :name, :gst, :pst, :hst

  menu priority: 4

  index title: 'Regions' do
    selectable_column
    column :name
    column 'GST' do |region|
      number_to_percentage region.gst * 100, precision: 3
    end
    column 'PST' do |region|
      number_to_percentage region.pst * 100, precision: 3
    end
    column 'HST' do |region|
      number_to_percentage region.hst * 100, precision: 3
    end

    actions
  end
end
