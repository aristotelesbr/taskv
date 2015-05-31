require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
    # Cria um usuário
    user = create(:user)
    # Faz login
    login_as(user)

    # Preenche o campo           com
    fill_in label('task.title'), with: 'Some task'
    # Clicar no no botão
    click_on button ('task.create')

    # Eu espero que esteja na pagina de tarefas(Tasks)
    assert_equal tasks_path, current_path
    assert page.has_text?(notice('task.create'))
    # Exibe o titulo da tarefa(task)
    assert page.has_text?('Some task')
  end

  test 'With invalid data' do
    user = create(:user)
    login_as(user)
    click_on button ('task.create')

    assert_equal new_task_path, current_path
    assert page.has_text?(form_error_message)
  end
end
