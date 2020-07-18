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
     show_spinner('Cadastrando Moedas...')do
       coins = 
        [
         { 
            description: 'Bitconin', 
            acronym: 'BTC', 
            url_image: 'https://e7.pngegg.com/pngimages/978/643/png-clipart-bitcoin-bitcoin.png' 
          },
              
         {
            description: 'Ethereum', 
            acronym: 'ETH', 
            url_image: 'https://img2.gratispng.com/20180411/gwq/kisspng-ethereum-blockchains-digital-assets-smart-contr-blockchain-5ace40c3acb1a6.6050038115234664357074.jpg' 
          },
        
         {
            description: 'DASH', 
            acronym: 'DASH', 
            url_image: 'https://www.dash.org/wp-content/uploads/dash-d-circle-1000.png' 
          },
          
          {
            description: 'LITECOIN', 
            acronym: 'LTC', 
            url_image: 'https://img2.gratispng.com/20180525/wal/kisspng-litecoin-cryptocurrency-bitcoin-logo-cryptocurrency-5b081f1979b524.5871818715272589054985.jpg' 
          },
          
          {
            description: 'RIPPLE', 
            acronym: 'XRP', 
            url_image: 'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/256/Ripple-icon.png' 
          }
              
        ]
          coins.each do |coin|
            Coin.find_or_create_by!(coin)
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