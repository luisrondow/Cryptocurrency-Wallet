class WelcomeController < ApplicationController
  #Utilizando o resource para consumir o endpoint
  def dolar
    #Pegando a data de hoje e a convertendo para colocá-la na url e assim pegar sempre a cotação mais recente
    dataHoje = Date.today.strftime("%m-%d-%Y")
    url = "https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarDia(dataCotacao=@dataCotacao)?@dataCotacao=%27#{dataHoje}%27&$top=100&$format=json"
    RestClient::Resource.new(url)
  end
  def index
    @nome = params[:nome]
    #Requisitando o JSON a partir do .get e convertendo-o para Hashe
    json = JSON.parse(dolar.get)
    @valorDol = json["value"][0]["cotacaoCompra"]
  end
end
