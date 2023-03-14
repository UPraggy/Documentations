# MongoDB

## INDICE 




# INTRODUCAO


### MongoDB trabalha com dados organizados em um banco<br>que dentro dele há documentos e nesses documentos são <br>armazenados collections onde se persiste<br>os dados fortemente "agrupados" em formato de json<br><br>Por ele ser um banco se eschema, ele não reclama,<br>em ter mais de uma "coluna" ou estar faltando um dado<br><br>MongoDB é case sensitive, ou seja, ele diferencia<br>as maiusculas das minusculas



# COMANDOS BASICOS
                                        

### Mostrando bancos disponiveis
```js
show dbs
```

### Utilizando um banco, o mesmo comando serve para cria-lo

```js
use databaseName
```

## Para mostrar as collections, use:

```js
show collections
```


### Em geral, dentro da base de dados, os comandos estarão<br>relacionados a mesma, ao chamar os comandos<br>ele comummente usaram db.comando




## Criando Collections
```js
db.createCollections("collectionName")
```

## Deletando Collections

```js
db.collectionName.drop()
```




# INSERINDO DADOS 
                                        
                                        

### É possivel inserir dados sem que o collection esteja criado,<br>basicamente ao inserir um dados essa collection será criada<br>com o nome dado, o comando é o mesmo para inserir em <br>collections que já existem


```js
db.CollectionName.insert({atributo1:"valor", attr2:"valor2"}) //insere os dados na collection
```
### caso dê erro tente usar os metodos

```js
db.CollectionName.insertOne({atributo1:"valor", attr2:"valor2"}) //para um registro

db.student.insertMany([ //para varios registros
{atributo132:"valor", attr132:"valor2"}, 
{atributo34:"valor", attr34:"valor2"}
]
)
```


### Ao inserir esse dado receberá um id em hex unico para sua identificação

### Caso queira adcionar um id para subatributos, use:

```js
ObjectId() -> para gerar um hex unico


db.CollectionName.insert({
atributo1:"valor", 
attr2:"valor2",
attr3:[ 

    { 
       _id : ObjectId(),
      subattr1: "valor4223"
    },
    { 
       _id : ObjectId(),
      subattr1: "valor324423"
    }

]})

```













# CONSULTANDO DADOS 



## COLECTION DE EXEMPLO

```js
db.estados.insertMany([
{
nome:"Minas Gerais", 
sigla:"MG",
cidades:[ 
    { 
       _id : ObjectId(),
      cidade: "Belo Horizonte"
    },
    { 
       _id : ObjectId(),
      cidade: "Ouro Preto"
    }
]},
{
nome:"São Paulo", 
sigla:"SP",
cidades:[ { _id : ObjectId(),cidade: "São Paulo"},
    { _id : ObjectId(), cidade: "Santo André"}]
},
{
nome:"Amazonas", 
sigla:"AM",
cidades:[{ _id : ObjectId(), cidade: "Manaus" },
    { _id : ObjectId(), cidade: "Borba"  }]
}
]);
```



## Visualizando todos registros 

### Para ver os dados de uma colection especifica use:
```js
db.NomeCollection.find()
Ex.:
db.estados.find()
/*
{ "_id" : ObjectId("64087becd"), "nome" : "Minas Gerais", "sigla" : "MG", "cidades" : [ { "_id" : ObjectId("64087bed6"), "cidade" : "Belo Horizonte" }, { "_id" : ObjectId("6408755d7"), "cidade" : "Ouro Preto" } ] }
{ "_id" : ObjectId("64087becd4"), "nome" : "São Paulo", "sigla" : "SP", "cidades" : [ { "_id" : ObjectId("64087bed8"), "cidade" : "São Paulo" }, { "_id" : ObjectId("64087be"), "cidade" : "Santo André" } ] }
{ "_id" : ObjectId("64087becd"), "nome" : "Amazonas", "sigla" : "AM", "cidades" : [ { "_id" : ObjectId("640855da"), "cidade" : "Manaus" }, { "_id" : ObjectId("64087becb"), "cidade" : "Borba" } ] }
```


### para visualizar mais formatado no terminal use:
```js
db.estados.find().pretty()
```

## Filtrando registros 
### para filtrar um registro especifico use:
```js
db.NomeCollection.findOne() //e coloque o objeto para filtrar
EX.:
db.estados.findOne({nome: "Minas Gerais"})

{ "_id" : ObjectId("64087becd4f55dc"), "nome" : "Minas Gerais", "sigla" : "MG", "cidades" : [ { "_id" : ObjectId("64087bed6"), "cidade" : "Belo Horizonte" }, { "_id" : ObjectId("64087becdf55d7"), "cidade" : "Ouro Preto" } ] }
```


##  Filtrando registros com condições 

### É possível filtrar com condições logicas como  "or e and" (ou e e)

```js
db.estados.find({$or: [{sigla: "MG"},{"nome" : "São Paulo"}]})

{ "_id" : ObjectId("64087be"), "nome" : "Minas Gerais", "sigla" : "MG", "cidades" : [ { "_id" : ObjectId("64087be6"), "cidade" : "Belo Horizonte" }, { "_id" : ObjectId("64087d7"), "cidade" : "Ouro Preto" } ] }
{ "_id" : ObjectId("640f"), "nome" : "São Paulo", "sigla" : "SP", "cidades" : [ { "_id" : ObjectId("6404a"), "cidade" : "São Paulo" }, { "_id" : ObjectId("64088b"), "cidade" : "Santo André" } ] }
```

```js
db.estados.find({$and: [{sigla: "MG"},{"nome" : "São Paulo"}])
//Não acha nada, não há estado com sigla MG e nome São Paulo
```



## Filtrando registros caso haja uma propriedade 
```js
db.estados.find({populacao : {$exists: true}}) 
//não há registro com a propriedade populacao, mas se houvesse, ele seria filtrado
```


##  Limitando filtro 

### As vezes o collection um numero grande de registros, <br> para verificar a quantidade use:

```js
db.estados.count()
//3
```

### Para pular alguns registros use:

```js
db.estados.find().skip(1) //dentro do skip use para pular a quantidade de registros desejada
```

### Para limitar os registros use:
```js
db.estados.find().limit(1) //nesse exemplo, vai aparecer apenas um registro
```


## Filtrando e recebendo apenas alguns atributos 
Coloque o seu filtro, e como segundo parametro, os atributos que deseja que apareça 
use 0 para ocultar e 1 para mostrar

```js
db.estados.find({nome:"Amazonas"},{"cidades.cidade": 1, "_id":0})
//{ "cidades" : [ { "cidade" : "Manaus" }, { "cidade" : "Borba" } ] }
```









# CONSULTAS AGREGADAS 

A API do MongoDB tem o chamado PipeLine de Agregação onde se utiliza um padrão chamado Pipes and Filters,
onde os dados seguem por um PipeLine ("Tubo") e conforme passam são filtrados de acordo com
funções, abaixo algumas funções e exemplos.
Nota.: caso queira ver mais, siga o link abaixo. 

[Link](https://www.mongodb.com/docs/manual/reference/operator/aggregation/)


### Neste exemplo, usaremos a seguinte collection

```js
db.estados.drop()

db.estados.insertMany([
{
nome:"Minas Gerais", 
sigla:"MG",
cidades:[ 
    { _id : ObjectId(), cidade: "Belo Horizonte", populacao: 100000, capital: "capital" },
    { _id : ObjectId(), cidade: "Ouro Preto", populacao: 5000 },
    { _id : ObjectId(), cidade: "Ibirité", populacao: 10000 },
    { _id : ObjectId(), cidade: "Contagem", populacao: 30000 }
    ]},
{
nome:"São Paulo", 
sigla:"SP",
cidades:[ { _id : ObjectId(),cidade: "São Paulo", populacao: 80000, capital: "capital"},
    { _id : ObjectId(), cidade: "Santo André", populacao: 30000},
    { _id : ObjectId(), cidade: "São Roque", populacao: 20000},
    { _id : ObjectId(), cidade: "Ribeirão Preto", populacao: 3000}
    ]
},
{
nome:"Amazonas", 
sigla:"AM",
cidades:[{ _id : ObjectId(), cidade: "Manaus", populacao: 50000, capital: "capital" },
    { _id : ObjectId(), cidade: "Borba", populacao: 10000  },
    { _id : ObjectId(), cidade: "Amaturá", populacao: 5000 },
    { _id : ObjectId(), cidade: "Barreirinha", populacao: 6000 }
    ]
},
{
nome:"Bahia", 
sigla:"BA",
cidades:[{ _id : ObjectId(), cidade: "Salvador", populacao: 110000, capital: "capital" },
    { _id : ObjectId(), cidade: "Barreiras", populacao: 30000  },
    { _id : ObjectId(), cidade: "Porto Seguro", populacao: 20000 },
    { _id : ObjectId(), cidade: "Irecê", populacao: 2000 }
    ]
}
]);
```

## Utilizando Operadores
### Neste exemplo será usado o operador $project
```js
db.estados.aggregate([
  {
     //quando é usado o nome do campo como valor Cava:valor, como em cidades.populacao
     //é necessario usar o operador "$"
    $project : {populacao : {$sum : "$cidades.populacao" }, sigla:1, _id:0}
    
  }
  ])
 

{ "sigla" : "MG", "populacao" : 145000 }
{ "sigla" : "SP", "populacao" : 133000 }
{ "sigla" : "AM", "populacao" : 71000 }
{ "sigla" : "BA", "populacao" : 162000 }
```

### Utilizando o operador $filter dentro de project para filtrar,<br>as cidades com capitais,é usado o operador $eq para<br>comparações de igualdade<br>Nota.: a função aggregate permite concatenar em um array diversas etapas
```js
db.estados.aggregate([
  {

    $project : {capital : {
      $filter : {
      //variavel ou array de entrada
        input: "$cidades",
          //condicao, se cidades.capital tiver capital retorne verdadeiro
         cond: {$eq: ["$$cidades.capital", "capital"]},
         //nome da variavel
         as: "cidades"
        
      }

    }, nome:1, _id:0, cidade: 1}
  },
  
  /*
  Primeira etapa de filtragem, filtrando apenas campos com nome capital
  { "nome" : "Minas Gerais", "capital" : [ { "_id" : ObjectId("640f7"), "cidade" : "Belo Horizonte", "populacao" : 100000, "capital" : "capital" } ] }...
  */
  { $unwind: "$capital" },
  /*
  Segund etapa de filtragem usando unwind, para realizar "destructuring de array", separar elementos dos arrays
  { "nome" : "Minas Gerais", "capital" : { "_id" : ObjectId("640d"), "cidade" : "Belo Horizonte", "populacao" : 100000, "capital" : "capital" } }
  */
  {$project : {nome:1, capital: "$capital.cidade"}}
  //Terceira, apresentando dados com filtro de campos desejados
  ])
  
  
  
/*
SAIDA
{ "nome" : "Minas Gerais", "capital" : "Belo Horizonte" }
{ "nome" : "São Paulo", "capital" : "São Paulo" }
{ "nome" : "Amazonas", "capital" : "Manaus" }
{ "nome" : "Bahia", "capital" : "Salvador" }
*/  
```



### Mais um exemplo de aggregate, dessa vez, vamos filtrar as cidades com<br>população maior ou igual a  30.000 e mostrar<br>em ordem decrescente

```js
db.estados.aggregate([
  {$project: {
      populacaoMaior30Mil : {
        $filter:{
            input: "$cidades",
            as : "cidades",
            cond: {$gte : ["$$cidades.populacao", 30000]} //gte -> maior ou igual
        }
      },_id:0,sigla:1
    }
  },
  {$unwind : "$populacaoMaior30Mil"}, // tira os dados do array, realizando destructuring
  {$project:{ // pegando campos desejados
          sigla: 1, cidade: "$populacaoMaior30Mil.cidade", populacao : "$populacaoMaior30Mil.populacao"
        }
  },
  {$sort: {populacao: -1}} //ordenando em ordem decrescente
  
  ])
```





# UPDATE 
## COLECTION DE EXEMPLO
```js
db.estados.insertMany([
{
nome:"Minas Gerais", 
sigla:"MG",
cidades:[ 
    { _id : ObjectId(), cidade: "Belo Horizonte", populacao: 100000, capital: "capital" },
    { _id : ObjectId(), cidade: "Ouro Preto", populacao: 5000 },
    { _id : ObjectId(), cidade: "Ibirité", populacao: 10000 },
    { _id : ObjectId(), cidade: "Contagem", populacao: 30000 }
    ]},
{
nome:"São Paulo", 
sigla:"SP",
cidades:[ { _id : ObjectId(),cidade: "São Paulo", populacao: 80000, capital: "capital"},
    { _id : ObjectId(), cidade: "Santo André", populacao: 30000},
    { _id : ObjectId(), cidade: "São Roque", populacao: 20000},
    { _id : ObjectId(), cidade: "Ribeirão Preto", populacao: 3000}
    ]
},
{
nome:"Amazonas", 
sigla:"AM",
cidades:[{ _id : ObjectId(), cidade: "Manaus", populacao: 50000, capital: "capital" },
    { _id : ObjectId(), cidade: "Borba", populacao: 10000  },
    { _id : ObjectId(), cidade: "Amaturá", populacao: 5000 },
    { _id : ObjectId(), cidade: "Barreirinha", populacao: 6000 }
    ]
},
{
nome:"Bahia", 
sigla:"BA",
cidades:[{ _id : ObjectId(), cidade: "Salvador", populacao: 110000, capital: "capital" },
    { _id : ObjectId(), cidade: "Barreiras", populacao: 30000  },
    { _id : ObjectId(), cidade: "Porto Seguro", populacao: 20000 },
    { _id : ObjectId(), cidade: "Irecê", populacao: 2000 }
    ]
}
]);
```


### Adicionando novo campo 
```js
//update, (FILTRO, ATUALIZACAO)
db.estados.update({sigla: "MG"}, {$set : {regiao: "Sudeste"}})

db.estados.aggregate([ // filtrando para visualizar atualização
  {$match : {sigla: "MG"}},
  {$project: { _id: 0, cidades: 0}}
  ])
  
 //SAIDA
 /*
 De acordo com o filtro foi achado apenas um objeto e ele foi atualizado
 
 WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 }) 
 
{ "nome" : "Minas Gerais", "sigla" : "MG", "regiao" : "Sudeste" }
*/
```

### Adicionando atributos a um campo existente


```js
//Para adicionar um atributo/elemento em um campo já existente, use "push"
db.estados.update({sigla: "MG"}, {
  $push : {
    cidades: {
      _id : ObjectId(),
      cidade : "Montes Claros",
      populacao: 5000,
      
    }
    
  }
  
})

db.estados.aggregate([
  {$match : {sigla: "MG"}},
  {$project: { _id: 0, "cidades._id":0, "cidades.capital": 0}},
  {$project: {cidades:1}},
  {$unwind: "$cidades"}
  ])
  
/*
SAIDA

WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

{ "cidades" : { "cidade" : "Belo Horizonte", "populacao" : 100000 } }
{ "cidades" : { "cidade" : "Ouro Preto", "populacao" : 5000 } }
{ "cidades" : { "cidade" : "Ibirité", "populacao" : 10000 } }
{ "cidades" : { "cidade" : "Contagem", "populacao" : 30000 } }
{ "cidades" : { "cidade" : "Montes Claros", "populacao" : 5000 } }

*/
```


# REMOVE

## COLECTION DE EXEMPLO
```js
db.estados.insertMany([
{
nome:"Minas Gerais", 
sigla:"MG",
regiao: "Sudeste",
cidades:[ 
    { _id : ObjectId(), cidade: "Belo Horizonte", populacao: 100000, capital: "capital" },
    { _id : ObjectId(), cidade: "Ouro Preto", populacao: 5000 },
    { _id : ObjectId(), cidade: "Ibirité", populacao: 10000 },
    { _id : ObjectId(), cidade: "Contagem", populacao: 30000 },
    {_id  : ObjectId(),  cidade : "Montes Claros",  populacao: 5000}
    ]},
{
nome:"São Paulo", 
sigla:"SP",
cidades:[ { _id : ObjectId(),cidade: "São Paulo", populacao: 80000, capital: "capital"},
    { _id : ObjectId(), cidade: "Santo André", populacao: 30000},
    { _id : ObjectId(), cidade: "São Roque", populacao: 20000},
    { _id : ObjectId(), cidade: "Ribeirão Preto", populacao: 3000}
    ]
},
{
nome:"Amazonas", 
sigla:"AM",
cidades:[{ _id : ObjectId(), cidade: "Manaus", populacao: 50000, capital: "capital" },
    { _id : ObjectId(), cidade: "Borba", populacao: 10000  },
    { _id : ObjectId(), cidade: "Amaturá", populacao: 5000 },
    { _id : ObjectId(), cidade: "Barreirinha", populacao: 6000 }
    ]
},
{
nome:"Bahia", 
sigla:"BA",
cidades:[{ _id : ObjectId(), cidade: "Salvador", populacao: 110000, capital: "capital" },
    { _id : ObjectId(), cidade: "Barreiras", populacao: 30000  },
    { _id : ObjectId(), cidade: "Porto Seguro", populacao: 20000 },
    { _id : ObjectId(), cidade: "Irecê", populacao: 2000 }
    ]
}
]);
```

### Removendo um documento do collection
```js
//Removendo estados com a sigla "AM"
db.estados.remove({sigla: "AM"})

//mostrando estados
db.estados.find({},{_id:0, nome: 1});

/*
SAIDA
WriteResult({ "nRemoved" : 1 })
{ "nome" : "Minas Gerais" }
{ "nome" : "São Paulo" }
{ "nome" : "Bahia" }
*/
```


### Removendo um subdocumento de uma collection
```js
//para remover use o operador "pull" dentro do update
db.estados.update({sigla: "MG"}, {$pull : {cidades : {cidade : "Montes Claros"}}})

//mostrando cidades
db.estados.find({sigla:"MG"},{_id:0, "cidades.cidade": 1});

/*
SAIDA
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
{ "cidades" : [ { "cidade" : "Belo Horizonte" }, { "cidade" : "Ouro Preto" }, { "cidade" : "Ibirité" }, { "cidade" : "Contagem" } ] }
*/
```


### Removendo um campo da collection
````js
db.estados.update({sigla: "MG"}, { 
  $unset : { //removendo campo
    cidades : ""
    
  }})

//mostrando modificações
db.estados.find({sigla:"MG"},{_id:0});

/*
SAIDA
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

{ "nome" : "Minas Gerais", "sigla" : "MG", "regiao" : "Sudeste" }
*/
```

/*---------------------------------------------REFERÊNCIAS---------------------------------------------*/


https://www.udemy.com/course/curso-web
https://www.mongodb.com/docs/manual/
