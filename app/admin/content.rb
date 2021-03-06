ActiveAdmin.register Content do

  permit_params :title, :content, :image

  index do
    selectable_column
    id_column
    column :title
    column :image do |image|
      image_tag(image.image, width: 80) if image.present?
    end

    column :created_at
    column :updated_at
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :content
      # f.input :image, :as => :file
      f.inputs :multipart => true do 
        f.input :image, :as => :file, :hint => image_tag(f.object.image, width: 200) if f.object.image?
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :content
      row :slug
      row :image do |image|
        image_tag(image.image, width: 200) if image.image.present?
      end
      row :created_at
      row :updated_at
    end
  end

end
