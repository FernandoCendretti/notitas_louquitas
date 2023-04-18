collection @folder

attributes :id, :name
node(:parent_id) { |folder| folder.parent.try(:id) }
node(:childrens) do |folder|
  folder.childrens.map { |child| { id: child.id, name: child.name } }
end