collection @folders

attributes :id, :name
node(:parent_id) { |folder| folder.parent.try(:id) }
node(:childrens) do |folder|
  folder.childrens.map { |child| 
    {
      id: child.id, 
      name: child.name, 
      childrens: child.childrens.map { |subchild| 
        {
          id: subchild.id, 
          name: subchild.name, 
          childrens: subchild.childrens,
          notes: subchild.notes.map { |note| 
            { 
              id: note.id, 
              title: note.title, 
              content: note.content 
            } 
          }
        } 
      },
      notes: child.notes.map { |note| 
        { 
          id: note.id, 
          title: note.title, 
          content: note.content 
        } 
      }
    } 
  }
end
node(:notes) do |folder|
  folder.notes.map { |note| 
    { 
      id: note.id, 
      title: note.title, 
      content: note.content 
    } 
  }
end
