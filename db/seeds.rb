# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner= TTY::Spinner.new("[:spinner] Cadastrando Moedas!!!")    
spinner.auto_spin

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
    }
        
  ]
coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("Concluído")

 