class Example::ListsController < Example::DummyController
  before_filter :get_list, only: [ :show, :edit, :update, :destroy ]

  def index
    @lists = List.all
  end

  def show
    @tasks = @list.tasks
    respond_to do |format|
      format.html
      format.js { render partial: 'show', content_type: 'text/html' }
    end
  end

  def new
    @list = List.new
    render partial: 'new', content_type: 'text/html'
  end

  def edit
    render partial: 'edit', content_type: 'text/html'
  end

  def create
    @list = List.new params[:list]
    if @list.save
      js_notify message: t('app.created', model: @list.class)
      render partial: @list, content_type: 'text/html'
    else
      js_notify message: t('app.error')
      render partial: 'new', status: :unprocessable_entity
    end
  end

  def update
    if @list.update_attributes params[:list]
      js_notify message: t('app.updated', model: @list.class)
      render partial: @list, content_type: 'text/html'
    else
      js_notify message: t('app.error')
      render partial: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    js_redirect(to: example_lists_path)
  end

  private
    def get_list
      @list = List.find params[:id]
    end
end
