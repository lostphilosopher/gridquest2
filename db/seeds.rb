# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Default Grid
if Grid.count == 0
  grid = Grid.create(x_max: 10, y_max: 10)
  (1..grid.y_max).each do |l|
    (1..grid.x_max).each do |w|
      Box.create(
        x: w,
        y: l,
        paths: Box.paths_from_grid_boundaries(w, l),
        grid_id: grid.id
      )
    end
  end
end

# Create default user
User.create(
  email: 'default@example.com',
  password: '12345678',
  password_confirmation: '12345678'
)

# Create default theme and components
theme = Theme.create(name: 'default')

Scene.create(
  name: 'Red River',
  theme_id: theme.id,
  seed_min: 1,
  seed_max: 33
)
Scene.create(
  name: 'Blue Basin',
  theme_id: theme.id,
  seed_min: 34,
  seed_max: 66
)
Scene.create(
  name: 'Green Gorge',
  theme_id: theme.id,
  seed_min: 67,
  seed_max: 99
)

i = 0
['Alpha', 'Beta', 'Kappa'].each do |n|
  Npc.create(
    name: n,
    theme_id: theme.id,
    seed_min: 1 + i,
    seed_max: 20 + i
  )
  i = i + 10
end

i = 0
['Foo', 'Bar'].each do |n|
  Item.create(
    name: n,
    theme_id: theme.id,
    seed_min: 1 + i,
    seed_max: 10 + i
  )
  i = i + 10
end

Player.create(
  name: 'Default',
  theme_id: theme.id
)
