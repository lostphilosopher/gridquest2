class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def start
    @game = Game.create

    # Build grid (this should be seed or rake task)
    if Box.count < 100
      grid = Grid.create(x_max: 10, y_max: 10)
      (1..grid.y_max).each do |l|
        (1..grid.x_max).each do |w|
          Box.create(
            x: w,
            y: l,
            paths: paths_from_grid_boundaries(w, l),
            grid_id: grid.id
          )
        end
      end
    end

    # Build a population
    Box.all.each do |box|
      seed = rand(1..99)

      item = Item.where("seed_max >= ?", seed).where("seed_min <= ?", seed)
      item_id = item.first ? item.first.id : nil

      npc = Npc.where("seed_max >= ?", seed).where("seed_min <= ?", seed)
      npc_id = npc.first ? npc.first.id : nil

      population = Population.create!(
        seed: seed,
        item_id: item_id,
        npc_id: npc_id,
        box_id: box.id,
        game: @game
      )

      @game.populations << population
    end

    # Place the player
    @game.update(current_box_id: rand(1..100))

    @game.save

    redirect_to game_path(id: @game.id)
  end

  def paths_from_grid_boundaries(w, l)
    x = w
    y = l
    paths = ''
    paths << 'n' if y < 10
    paths << 's' if y > 1
    paths << 'e' if x < 10
    paths << 'w' if x > 1

    paths
  end

  def move
    @game = Game.find_by(id: params[:id])

    @game.move(params[:direction])

    redirect_to game_path(id: @game.id)
  end
end
