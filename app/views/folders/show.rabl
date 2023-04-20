object @folder

attributes :id, :name
node(:notes) do |folder|
  folder.notes.map { |note| 
    { 
      id: note.id, 
      title: note.title, 
      content: note.content,
      tags: note.tags.map { |tag|
        { 
          id: tag.id, 
          name: tag.name
        }
      }
    }
  }
end
node(:tags) do |folder|
  folder.tags.map { |tag| 
    { 
      id: tag.id, 
      name: tag.name, 
    } 
  }
end