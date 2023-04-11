print "- Populating Sample Plans - "
Plan.create(name: 'Basic', value: 9.99, limit_folder: 10, limit_notes: 50)
Plan.create(name: 'Standart', value: 49.99, limit_folder: 100, limit_notes: 500)
Plan.create(name: 'Deluxe', value: 99.99, limit_folder: 100000, limit_notes: 500000) 
