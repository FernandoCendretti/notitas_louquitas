Fabricator(:plan) do
  id { UUIDTools::UUID.random_create }
  name 'Basic'
  value 10.99
  limit_folder 10
  limit_notes 50
end
