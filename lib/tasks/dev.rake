namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner('Apagando DB...'){%x( rails db:drop:_unsafe)}
      show_spinner('Criando DB...'){%x(rails db:create)}
      show_spinner('Migrando DB...'){%x(rails db:migrate)}
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
     
      
    else 
      puts 'Você não está no ambiente de desenvolvimento!!!'
    end
  end
  
  desc "Cadastra as Moedas"
   task add_coins: :environment do
       show_spinner('Populando Mining Types...')do
       7.times do
        hash = Faker::CryptoCoin.coin_hash
        coin = {description: hash[:name], acronym: hash[:acronym], url_image: hash[:url_logo]}
        Coin.find_or_create_by(coin)
        end
      end
    end 
    
    
     
  desc "Cadsatrando Tipo de Mineração"
   task add_mining_types: :environment do
     show_spinner('Cadastrando Mining Types...')do
       mining_types = 
        [
         { 
            description: 'Proof of Works', 
            acronym: 'PoW' 
          },
              
         {
            description: 'Proof of Stake', 
            acronym: 'PoS'
          },
          
         {
            description: 'Proof of Capacity', 
            acronym: 'PoC'
          }
        ]
          mining_types.each do |mining_type|
            MiningType.find_or_create_by!(mining_type)
          end
      end
    end 
    
    
    
   private
     def 
      show_spinner(msg_inicio,msg_end = 'Concluido!!!')
      spinner= TTY::Spinner.new("[:spinner] #{msg_inicio}")    
      spinner.auto_spin
      yield
      spinner.success("#{msg_end}")
     end
end