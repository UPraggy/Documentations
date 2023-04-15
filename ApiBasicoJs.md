# API BASICO
#### API é basicamente um conjunto de protocolos que permite a comunicação entre sistemas, idependente de linguagem, plataforma ou tecnologia. Nesse contexto, o formato de dados mais comum para essa comunicação é json, por ser mais leve e de fácil compreenssão.


## CONSUMINDO API DE FORMA FACIL COM JAVASCRIPT


#### Forma mais básica de consumir uma API, é usando fetch, que funciona tanto com javascript basico quanto em servidores e ambientes em node.

#### Basicamente para rodar basta colocar 

```js
fetch("SUA URL")
.then("TRATAMENTO DE RESPOSTA")
```

#### Para converter a resposta em json use:

```js
fetch("SUA URL")
.then(response => response.json())
.then(respostaConvertida => console.log(respostaConvertida))
.catch(error => {
    // manipular o erro aqui
  })
```

#### EXEMPLO ABAIXO:

```js
fetch("https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL")
	.then(resposta => resposta.json())
	.then(resposta => console.log(resposta))
```

#### RESULTADO


```json
	{
    "USDBRL": {
        "code": "USD",
        "codein": "BRL",
        "name": "Dólar Americano/Real Brasileiro",
        "high": "4.9644",
        "low": "4.8931",
        "varBid": "-0.0193",
        "pctChange": "-0.39",
        "bid": "4.9065",
        "ask": "4.9092",
        "timestamp": "1681505996",
        "create_date": "2023-04-14 17:59:56"
    },
    "EURBRL": {
        "code": "EUR",
        "codein": "BRL",
        "name": "Euro/Real Brasileiro",
        "high": "5.466",
        "low": "5.3955",
        "varBid": "-0.0444",
        "pctChange": "-0.82",
        "bid": "5.3937",
        "ask": "5.3986",
        "timestamp": "1681505997",
        "create_date": "2023-04-14 17:59:57"
    },
    "BTCBRL": {
        "code": "BTC",
        "codein": "BRL",
        "name": "Bitcoin/Real Brasileiro",
        "high": "151223",
        "low": "149800",
        "varBid": "-662",
        "pctChange": "-0.44",
        "bid": "149800",
        "ask": "149822",
        "timestamp": "1681595303",
        "create_date": "2023-04-15 18:48:23"
    }
}
```

#### Normalmente as API's contém argumentos para filtro/consumo delas. Assim como o exemplo acima ele tem uma url com parametros de filtro, um deles (no caso oque foi usado) é ``` https://economia.awesomeapi.com.br/json/last/:moedas ```, neste trecho ele recebe a sigla das moedas como filtro, oque como no exemplo acima foi colocado:

```js
"https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL"
```

#### Podem haver variações nos argumentos, de acordo com a necessidade:

```js
fetch("https://economia.awesomeapi.com.br/last/CLP")
	.then(resposta => resposta.json())
	.then(resposta => console.log(resposta))
```


#### Resultado

```json
{
    "CLPBRL": {
        "code": "CLP",
        "codein": "BRL",
        "name": "Peso Chileno/Real Brasileiro",
        "high": "0.00622",
        "low": "0.00616",
        "varBid": "-0.00003",
        "pctChange": "-0.57",
        "bid": "0.00616",
        "ask": "0.00616",
        "timestamp": "1681505835",
        "create_date": "2023-04-14 17:57:15"
    }
}
```
