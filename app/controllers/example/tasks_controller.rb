class Example::TasksController < Example::DummyController
  before_filter :get_list, only: [ :edit, :create, :update, :destroy ]
  before_filter :get_task, only: [ :edit, :update, :destroy ]

  def edit
    render partial: 'edit', content_type: 'text/html'
  end

  def create
    @task = @list.tasks.new params[:task]

    if @task.save
      js_notify message: t('app.created', model: @task.class)
      render partial: @task, content_type: 'text/html'
    else
      js_notify message: t('app.error')
      render partial: 'form', status: :unprocessable_entity
    end
  end

  def update
    if @task.update_attributes params[:task]
      js_notify message: t('app.updated', model: @task.class)
      render partial: @task, content_type: 'text/html'
    else
      js_notify message: t('app.error')
      render partial: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    render nothing: true, content_type: 'text/html'
  end

  private
    def get_task
      @task = @list.tasks.find params[:id]
    end

    def get_list
      @list = List.find params[:list_id]
    end
end
