Fabricator(:user) do
  id { UUIDTools::UUID.random_create }
  name 'John'
  email 'doe@email.com'
  password '123'
  password_confirmation '123'
end