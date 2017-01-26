class NpcsController < ApplicationController
  def new
    @npc = Npc.new
  end

  def create
    @npc = Npc.new(
      npc_params
    )

    if @npc.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def npc_params
    params.require(:npc).permit(
      :name,
      :description,
      :theme_id,
      :seed_min,
      :seed_max
    )
  end
end
