class Admin::ColumnsController < Admin::BaseController
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @columns = Column.order("created_at desc")
    respond_with([:admin, @columns])
  end

  def show
    respond_with([:admin, @column])
  end

  def new
    @column = Column.new
    respond_with([:admin, @column])
  end

  def edit
  end

  def create
    @column = Column.new(column_params)
    @column.save
    respond_with([:admin, @column])
  end

  def update
    @column.update(column_params)
    respond_with([:admin, @column])
  end

  def destroy
    @column.destroy
    respond_with([:admin, @column])
  end

  private
    def set_column
      @column = Column.find(params[:id])
    end

    def column_params
      params.require(:column).permit(:name, :slug, :introduce)
    end
end
