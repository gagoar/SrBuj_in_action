class Example::TodosController < Example::DummyController
  before_filter :get_list, only: [ :edit, :create, :update, :destroy ]
  before_filter :get_todo, only: [ :edit, :update, :destroy ]

  def edit
    render partial: 'edit', content_type: 'text/html'
  end

  def create
    @todo = @list.todos.new params[:todo]

    if @todo.save
      js_notify message: t('app.created', model: @todo.class)
      render partial: @todo, content_type: 'text/html'
    else
      js_notify message: t('app.error')
      render partial: 'form', status: :unprocessable_entity
    end
  end

  def update
    if @todo.update_attributes params[:todo]
      js_notify message: t('app.updated', model: @todo.class)
      render partial: @todo, content_type: 'text/html'
    else
      js_notify message: t('app.error')
      render partial: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy

    render nothing: true, content_type: 'text/html'
  end

  private
    def get_todo
      @todo = @list.todos.find params[:id]
    end

    def get_list
      @list = List.find params[:list_id]
    end
end
