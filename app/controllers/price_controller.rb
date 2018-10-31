class PriceController < ApplicationController
  #consumindo o endpoint da API de criptomoedas
  #utilizando o Resource para que não seja feito a atribuiçao imediata do JSON para economizar memoria
  def bitcoin
    url = 'https://api.coinmarketcap.com/v2/ticker/1/'
    RestClient::Resource.new(url)
  end

  def eth
    url = 'https://api.coinmarketcap.com/v2/ticker/1027/'
    RestClient::Resource.new(url)
  end

  def monero
    url = 'https://api.coinmarketcap.com/v2/ticker/328/'
    RestClient::Resource.new(url)
  end
  
  def index
    @coins = Coin.all
    #Requisitando os JSONs a partir do .get e convertendo-os para Hashes
    bit= JSON.parse(bitcoin.get)
    ethe = JSON.parse(eth.get)
    mon = JSON.parse(monero.get)
    #Atrbuindo os prices de cada em um array
    @prices = [bit["data"]["quotes"]["USD"]["price"], ethe["data"]["quotes"]["USD"]["price"], mon["data"]["quotes"]["USD"]["price"]]
  end
end
