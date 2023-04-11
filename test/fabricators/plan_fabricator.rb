Fabricator(:plan) do
  id { UUIDTools::UUID.random_create }
  name 'Basic'
  value 10.99
  limit_folder 10
  limit_notes 50
end
Fabricator(:plan) do
  id { UUIDTools::UUID.random_create }
  name 'Standart'
  value 49.99
  limit_folder 100
  limit_notes 500
end
Fabricator(:plan) do
  id { UUIDTools::UUID.random_create }
  name 'Deluxe'
  value 99.99
  limit_folder 100000
  limit_notes 500000
end
