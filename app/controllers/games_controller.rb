class GamesController < ApplicationController
	def index
		@games = Game.where(user_id: current_user.id)
	end

  def show
    @game = Game.find(params[:id])
    @box = @game.current_box
    @population = Population.find_by(box_id: @box.id)
  end

  def new
    @game = Game.new
  end

  def create
    # Theme from user choice
    theme = Theme.find_by(id: params[:game][:theme_id])

    # @todo: Select Player
    player = Player.where(theme_id: theme.id).first

    @game = Game.create(
      user_id: current_user.id,
      player_id: player.id,
      theme_id: theme.id
    )

    # Build a population
    Box.all.each do |box|
      seed = rand(1..99)

      item = Item.where("seed_max >= ?", seed).where("seed_min <= ?", seed)
      item_id = item.first ? item.first.id : nil

      npc = Npc.where("seed_max >= ?", seed).where("seed_min <= ?", seed)
      npc_id = npc.first ? npc.first.id : nil

      scene = Scene.where("seed_max >= ?", seed).where("seed_min <= ?", seed)
      scene_id = scene.first ? scene.first.id : nil

      population = Population.create!(
        seed: seed,
        item_id: item_id,
        npc_id: npc_id,
        box_id: box.id,
        scene_id: scene_id,
        game: @game
      )

      @game.populations << population
    end

    # Place the player
    @game.update(current_box_id: rand(1..100))

    @game.save

    redirect_to game_path(id: @game.id)
  end

  # Actions

  def move
    @game = Game.find_by(id: params[:id])

    @game.move(params[:direction])

    redirect_to game_path(id: @game.id)
  end
end
