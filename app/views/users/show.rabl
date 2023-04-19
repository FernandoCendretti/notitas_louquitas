object @user

attributes :id, :name, :email

child :plan do
  attributes :id, :name, :value, :limit_folder, :limit_notes
end