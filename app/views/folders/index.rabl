collection @folder

attributes :id, :name
node(:parent_id) { |folder| folder.parent.try(:id) }
node(:children) do |folder|
  folder.children.map { |child| { id: child.id, name: child.name } }
end