object @user

attributes :id, :name, :email

node(:plan) do |user|
  {
    name: user.plan.name,
    value: user.plan.value,
    limit_folder: user.plan.limit_folder,
    limit_notes: user.plan.limit_notes
  }
end