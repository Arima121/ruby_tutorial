require 'grape'

class MyApp < Grape::API

  resource :recurso do

    desc 'say hello world'
    get :hello do
      'hello world 2.0'
    end

    desc 'say bye world'
    post :bye do
      'bye :D 2.0'
    end
  end

end