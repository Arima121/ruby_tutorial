require 'grape'

class MyApp < Grape::API

  resource :recipe do

    desc 'get recipe by name'
    params do
      requires :name
    end
    get '/:name' do
      file = MyApp.get_file("files/#{params[:name]}.json")
      file = file.nil? ? JSON.pretty_generate(response: 'Not Found') : file
      { response: file }
    end

    desc 'create a new recipe'
    params do
      requires :name
      requires :description
      requires :ingredients, type: Array do
        requires :quantity
        requires :measure_unit
        requires :name
      end
      requires :steps, type: Array[String]
    end
    post '/' do
      File.write("files/#{params[:name]}.json", JSON.pretty_generate(params))
      JSON.pretty_generate(response: 'OK')
    end
  end

  def self.get_file(path)
    File.read(path)
  rescue Exception
    nil
  end

end