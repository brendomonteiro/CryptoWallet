module CoinsHelper
    def mostrar_mining_type
    @coin.mining_type.description unless @coin.mining_type.blank?
    end
    
    def mostrar_acronym(coin)
        coin.mining_type.acronym unless coin.mining_type.blank?
    end
end
