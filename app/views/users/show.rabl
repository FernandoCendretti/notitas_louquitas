object @user

attributes :id, :name, :email

child :plans do
  attributes :id, :name, :limit_folder, :limit_notes
end