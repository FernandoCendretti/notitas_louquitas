object @note

attributes :id, :name, :content, :folder_id

node(:tags) do |note|
  note.tags.map { |tag| 
    { 
      id: tag.id, 
      name: tag.name
    } 
  }
end