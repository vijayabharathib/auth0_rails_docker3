Shelf.delete_all
Book.delete_all
books=Book.create([
    {name: "Oliver Twist", author:'Charles Dickens'}, 
    {name: 'Great Expectations',author:'Charles Dickens'},
    {name: 'A tale of two cities', author:'Charles Dickens'},
    {name: 'Leonardo Da Vinci',author:'Walter Isaacson'},
    {name: 'Einstein: His Life and Universe', author: 'Walter Isaacson'},
    {name: 'Benjamin Franklin',author: 'Walter Isaacson'}
])
