namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner('Apagando DB...'){%x( rails db:drop:_unsafe)}
      
      show_spinner('Criando DB...'){%x(rails db:create)}
      
      show_spinner('Migrando DB...'){%x(rails db:migrate)}
      
      show_spinner('Populando DB...'){%x(rails db:seed)}
      
    else 
      puts 'Você não está no ambiente de desenvolvimento!!!'
    end
  end
   
   def 
    show_spinner(msg_inicio,msg_end = 'Concluido!!!')
    spinner= TTY::Spinner.new("[:spinner] #{msg_inicio}")    
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
   end
    
end

 
      
  