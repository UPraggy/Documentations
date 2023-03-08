/*
INDICE 

# Node
- MODULOS
- PACKAGE.JSON
- UTILIZANDO APRENDIZADO 

- PACKAGE.JSON - COMANDOS
- ARQUIVOS
- FRAMEWORK
*/

/*Obs.: 

Para buscar pesquise por '# nome'.


Os programas contem comentarios sobre o assunto, ele pode ser executado para
melhor entendimento, use 'console.log()' para ver as saidas e alterações.
Além disso, os exemplo podem usar arquivos diferentes (abordando o tema de modulos)*/



















/*                                      ########################################################### 
                                        ###########################################################
                                        ########################### MODULOS #######################
                                        ###########################################################
                                        ###########################################################*/

/*Ao programar no Node, é bem popular e é recomendado ao programar em js, utilizar modulos,
ou seja, organizar arquivos e funções em diferentes arquivos.*/

                            /*-------------------Exportanto variaveis ou objetos------------------*/

    /*Para acessar as variaveis e objetos dentro de outro modulo, primeiro é preciso declara-los,
    abaixo algumas formas*/

    this.variavel = '' //-> ao declarar a variavel com o 'this' e globalmente, ela pode ser acessada fora do modulo
    exports.name = 'Nome aleatorio' // semalhante ao this

    module.exports.outroName = "Name aqui"

    /* No geral, esses são os metodos utilizados para declarar variaveis que podem ser exportadas,
    abaixo, uma forma mais comum de exportar variaveis */

    /*-------Arquivo1-------*/
    module.exports = {
        attr1 = "World",

        falar(){
           console.log(`Hello ${this.attr1}!`);
        }

    }

    /*Obs.: o this e o exports são apenas referencias para o objeto dentro module.exports,
    ou seja, caso você tente colocar o this ou export recebendo um outro objeto, ele(s) 
    não será(ão) exportado(s), pois já não refereciam o objeto em module.exports.

    Por isso, é recomendado usar module.exports.
    */




                            /*-------------------Importando modulos------------------*/




                                    //Importanto modulos locais
    /*-------Arquivo1-------*/
    module.exports = {
        attr1 = "World",

        falar(){
            console.log(`Hello ${this.attr1}!`);
        }

    }


    /*-------Arquivo2-------*/

    // Para importar é preciso utilizar o require e inserir o caminho realtivo para arquivos locais
    // Vale destacar que é necessario armazenar o require em uma variavel, onde vai receber o objeto exportado do outro modulo
    //como esta trabalhando no node, não é necessario colocar a extensão se o arquivo for js
    const importa_teste = require('./Arquivo1.js'); 

    importa_teste.falar();
    //ola hello


                                    //Importanto modulos locais

    //para instalar modulos de terceiros digite o seguinte comando no console:
    npm i modulo
    npm i modulo@versao -E//para instalar uma versão especifica @versao -E
    // ao instalar, será criada uma pasta chamada node_modules, onde será organizado todos os modulos de terceiros

    //Exemplo

    /*-------Arquivo1-------*/
    let print_ = (...arg) => { //função para facilitar a impressao
        let string = ''
        arg.forEach(function(i,e){
            if (e != 0){
                string += ` ${i}`
            }else{
                string += `${i}`
            }})
            console.log(`${string}`)
    }

    module.exports = {
        attr1 : "ola",

        falar(){
            console.log(`${this.attr1} hello`)
        },

        print_ : print_,
    }


    /*-------Arquivo2-------*/

    const importa_teste = require('./Arquivo1.js'); 
    //não é necessario colocar caminho relativo, o proprio Node encontra o modulo na pasta node_modules
    const lodash = require('lodash') 
    
    importa_teste.print_("Numero aleatorio",lodash.random(0,1000)) //gera numero aleatorio
    //Numero aleatorio 896





    //-------------OBS---------

    /*  Ao criar um modulo local, é boa pratica criar como arquivo principal o 'index.js'
    por Exemplo:

    Foi criada uma pasta para um modulo e nomeada de "ContaAte100"
    Nela foi criada o arquivo index.js e varios outros com funções, objetos, etc.
    ao importar usando:
    */
    const modulo1 = require("./ContaAte100")
    /* automaticamente o Node vai procurar o arquivo 'index.js' e rodar

    A vantagem de se ter um index, é a de centralizar todos seus arquivos, funções... em um local só 
    */







                            /*-------------------Passando parametros entre modulos------------------*/

/* Para passagem de parametros entre modulos (além de chamar uma função como mostrado acima),
é possível passando em vez de um objeto, uma função para o module.exports */

/*-------Arquivo1-------*/
    module.exports = function (arg){
            console.log(`Imprima minha mensagem: ${arg}!`);
        }

    /*-------Arquivo2-------*/

    const importa_teste = require('./Arquivo1.js')("HELLLO WORLDDD"); 
    //Saida:
    // Imprima minha mensagem: HELLLO WORLDDD!








/*                                      ########################################################### 
                                        ###########################################################
                                        ######################## PACKAGE.JSON #####################
                                        ###########################################################
                                        ###########################################################*/

/*
O arquivo 'package.json' tem como função 'documentar' as dependencias e especificações de um projeto
Node, como vantagem, ele pode facilitar a instalação dessas dependecias além de bloquear a versão
*/

"lodash": "^4.17.21"



                            /*-------------------Descrição do arquivo------------------*/


// Abaixo os campos que um arquivo package pode receber e suas descrições
    /*-------package.json-------*/


{
  
  "name": "testenode", //Nome do pacote/projeto
  "version": "1.0.0", //versão
  "description": "", //descrição
  "main": "arq1.js", //o seu arquivo 'index.js' pode ser colocar outro nome também
  "scripts": { //comando de teste
    "test": "node arq1.js"
  },
  "author": "", //autor
  "license": "ISC" //licença
  "dependencies": { //suas dependecias (modulos necessarios para seu projeto)
    "lodash": "^4.17.21" 
  }
  "devDependencies": {},  // dependecias necessarias apenas para desenvolvimento
  "repository": { //seu repositorio
    "type": "git",
    "url": ""
  },
  "keywords": [ //palavras chaves
    "key"
  ]
}

npm i --save lodash



                            /*-------------------Criando arquivo------------------*/
/*
O arquivo pode ser criado manualmente ou através do comando:
*/
npm init 
/*ele vai inicializar e fazer algumas perguntas, caso de 'Enter' sem responder a pergunta
ele insere o padrão
*/

//para não precisar responder as perguntas use
npm init -y


                            /*-------------------Sobre dependencia------------------*/


/*caso queira instalar alguma dependencia e queira que seja registrada em seu package,
automaticamente use:*/

npm i --save modulo 
npm i --save-dev modulo //para salvar na parte "devDependencies"
/* automaticamente será instalado e inserido em seu package.json,
ao fazer isso, também será criado um documento chamado,

package-lock.json -> ele serve para controlar a versão exata da instalação de um modulo
*/

    /*----Sobre versão dos modulos/dependecias---*/

// No package é comum ao instalar um depencia aparecer um sinal antes da versão da dependecia:

"dependencies": { 
    "modulo": "^0.1.5" 
  }
/*este sinal serve para permitir ou bloquear a instalação de um modulo em uma versão 
  superior ou não a atual, isso pode evitar muitos bugs de versões
  A versão é dividida em três major.minor.fix, ou seja
  o 0 é major, 1 é minor e 5 é fix:

  Para o sinal "^":
  O modulo poderá ser atualizado da versão 0.1.5 para 0.2.5, ou seja,
  pode mudar sua versão minor (o numero localizado no meio)

  Para o sinal "~":
  O modulo poderá ser atualizado da versão 0.1.5 para 0.1.8, ou seja,
  pode mudar sua versão fix (o numero localizado no final)

  Sem o sinal:
  O modulo não poderá ser atualizado e poderá ser instalada,
  apenas aquela versão especificada

  */




                            /*-------------------Instalando dependencias com arquivo package------------------*/
/* Caso queira instalar seus modulos, que estão no package.json,
apenas redirecione o terminal para a pasta e dê: */

npm install

/*E o Node irá buscar os arquivos e instalará todas as dependencias, inclusive as de desenvolvedor
Para instalar apenas as dependencias de produção, ou seja, as que o sistema necessita
use:
*/

npm install --production //ou npm install --omit=dev para ignorar as devDependencies






/*                                      ########################################################### 
                                        ###########################################################
                                        ################### UTILIZANDO APRENDIZADO  ###############
                                        ###########################################################
                                        ###########################################################*/


/* Neste modulo, terá um desafio utilizando alguns conhecimentos*/


//Crie uma pasta chamada DesafioNode e crie os seguintes arquivos


/*--------empresas.json-------*/

[
    {"id":1,"nome":"Inovare","capital":150000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":2,"nome":"Best Place","capital":250000.00,"pais":"Alemanha","mercado":"Imobiliario"},
    {"id":3,"nome":"Cultural Store","capital":1580000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":4,"nome":"Requint","capital":300000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":5,"nome":"Digimund","capital":100000.00,"pais":"Alemanha","mercado":"Alimentos"},
    {"id":6,"nome":"Universo","capital":50000.00,"pais":"Colombia","mercado":"Imobiliario"},
    {"id":7,"nome":"Witt","capital":1000000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":8,"nome":"VitaSonho","capital":620000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":9,"nome":"Previx","capital":200000.00,"pais":"pais de Gales","mercado":"Alimentos"},
    {"id":10,"nome":"Upper","capital":320000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":11,"nome":"Love & Dream","capital":400000.00,"pais":"França","mercado":"Alimentos"},
    {"id":12,"nome":"Powerful","capital":210000.00,"pais":"Alemanha","mercado":"Tecnologia"}
    ]


/*--------empresas.js-------*/
/*é aqui onde você vai realizar o desafio criando uma função
que recebe um objeto e seja capaz de filtrar o pais, mercado 
como parametros a função terá (obj, pais,mercado)
*/

const selecionaEmpresa = (obj, pais,mercado) =>{
    //...
}


/*--------index.js-------*/
/* è aqui onde você importará o arquivo json e o empresas.js e chamará
a função e filtrara as empresas do pais "Alemanha" e mercado "Tecnologia"
e vai selecionar uma empresa aleatoria.

Para selecionar uma empresa aleatoria use o modulo 'lodash' que deverá ser instalado
e além disso é preciso criar o arquivo package.json com ele como especificação
e aceite apenas a versão "4.17.21" do 'lodash'.

a função para selecionar aleatoriamente é 
lodash.sample(array);
onde ela recebe um array e retorna um elemento aleatorio

Apos selecionar imprima:
A empresa X sediada em Y no ramo Z com capital de L foi selecionada dentre as empresas,
com as mesmas caracteristicas.

Dica: ao abrir o arquivo Json, não é necessario realizar a conversão em obj*/










                    /*--------------------Resolvendo Desafio--------------------------*/


//Criada a pasta dadwd é iniciado o package.json

npm init -y

//instalando modulo 'lodash'

npm i --save lodash@4.17.21 -E

/*--------package.json-------*/

{
  "name": "desafionode",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "lodash": "4.17.21"
  }
}

/*--------empresas.js-------*/

const selecionaEmpresa = (obj, pais,mercado) =>{

    let resultado = obj.filter(function(e){
        if (e.pais == pais){
            return e.mercado == mercado
        }
    })
    return resultado
}

module.exports = {
        selecionaEmpresa : selecionaEmpresa
    }





/*--------index.js-------*/

const desafio = require('./empresas.js')
const lodash = require('lodash')

const empresas = require('./empresas.json')

let retorno = desafio.selecionaEmpresa(empresas, "Alemanha","Tecnologia")

retorno = lodash.sample(retorno)

console.log(`A empresa ${retorno.nome} sediada em ${retorno.pais} no ramo ${retorno.mercado} com 
capital de ${retorno.capital} foi selecionada dentre as empresas, \
com as mesmas caracteristicas.`)






/*--------executando.js-------*/
node index.js

/*
Exemplo de Saida
A empresa Powerful sediada em Alemanha no ramo Tecnologia com
capital de 210000 foi selecionada dentre as empresas, com as mesmas caracteristicas.
*/

/* Caso você execute o modulo pelo terminal fora da pasta, ao digitar 
o nome da pasta, ele vai utilizar seu index.js como referencia 

Ex.: 
Abri a pasta 

C:\projeto\DesafioNode

se eu voltar para
C:\projeto 
no terminal posso executar o comando abaixo e ele vai procurar o index.js
*/
node DesafioNode

/*
Exemplo de Saida 
A empresa VitaSonho sediada em Alemanha no ramo Tecnologia com
capital de 620000 foi selecionada dentre as empresas, com as mesmas caracteristicas.
*/















/*                                      ########################################################### 
                                        ###########################################################
                                        ################### PACKAGE.JSON - COMANDOS ###############
                                        ###########################################################
                                        ###########################################################*/

/*
Dentro do package.json é possivel configurar comandos, para realizar diversas tarefas,
como: backup, rodar testes e diversos outros.
Abaixo como criar um:
*/



{
  "name": "desafionode",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "node index.js"
  }...
}

/*Dentro do arquivo há uma seção chamada scripts, onde é possível,
configurar comandos usados no terminal.
É possível concatenar esse comandos com a palavra "&&"
Abaixo um exemplo de comandos:
*/

"scripts": {
    "run": "node index.js",
    "test": "node testes.js",
    "backup" : "echo \" Backup Feito\"",
    "deleteNodeModules": "rmdir node_modules /S /Q && cls && echo \"Pasta node_modules deletada com sucesso\""
  }


/* To run the commands use: */

npm run command



/* Exemplo no terminal*/

npm run deleteNodeModules
//"Pasta node_modules deletada com sucesso"



















/*                                      ########################################################### 
                                        ###########################################################
                                        ########################## ARQUIVOS #######################
                                        ###########################################################
                                        ###########################################################*/
/*
No proprio Node há um modulo capaz de ler e escrever em arquivos, 
conhecido como FileSystem ou 'fs'
*/


                        /*--------------------Lendo Arquivos--------------------------*/


const fs = require('fs')


const caminho_arquivo = __dirname +'/empresas.json' //__dirname -> retorna o diretorio atual

/*Há duas formas de ler o arquivo, pela forma sincrona
ou seja, precisa ser lido inteiramente para o codigo continuar,
e assincrona que lê e vai executando o codigo (extremamente eficiente para
arquivos grandes)*/


const fs = require('fs')


const caminho_arquivo = __dirname +'/empresas.json'


/*--------Forma sincrona-------*/


const texto1 = fs.readFileSync(caminho_arquivo,'utf-8');//utf-8 é a forma que o arquivo foi salvo
console.log(texto1)


/*
[
    {"id":1,"nome":"Inovare","capital":150000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":2,"nome":"Best Place","capital":250000.00,"pais":"Alemanha","mercado":"Imobiliario"},
    {"id":3,"nome":"Cultural Store","capital":1580000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":4,"nome":"Requint","capital":300000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":5,"nome":"Digimund","capital":100000.00,"pais":"Alemanha","mercado":"Alimentos"},
...


*/

/*--------Forma assincrona-------*/
fs.readFile(caminho_arquivo,'utf-8', (erro, texto2)=>{
    console.log(texto2)
});


/*
[
    {"id":1,"nome":"Inovare","capital":150000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":2,"nome":"Best Place","capital":250000.00,"pais":"Alemanha","mercado":"Imobiliario"},
    {"id":3,"nome":"Cultural Store","capital":1580000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":4,"nome":"Requint","capital":300000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":5,"nome":"Digimund","capital":100000.00,"pais":"Alemanha","mercado":"Alimentos"},
...


*/




                        /*--------------------Lendo Arquivos--------------------------*/

/* Para escrever é preciso ser uma string */

const veiculo = {
    tipo : "carro",
    rodas : 4,
    velocidadeMaxima : 150,
    locaisCirculacao : 'cidade'
}

fs.writeFile(__dirname+"/veiculo.json",JSON.stringify(veiculo), (erro)=>{
    console.log(erro || "Arquivo Salvo!")
})




                    /*--------------------Listando Arquivos--------------------------*/

fs.readdir(__dirname, (erro, lista)=>{
    console.log(lista)
})


/*
[
  'empresas.js',
  'empresas.json',
  'index.js',
  'node_modules',
  'package-lock.json',
  'package.json',
  'teste'
]

*/









/*                                      ########################################################### 
                                        ###########################################################
                                        ######################### FRAMEWORK #######################
                                        ###########################################################
                                        ###########################################################*/
/*FRAMEWORKS diferentes de bibliotecas eles não vem funções e funcionalidades prontas,
eles oferecem estruturas e preceitos para serem seguidos e possibilitar,
criar sua aplicação */



/*
Dentro desse contexto há um padrão chamado, padrão middleware ou chain of responsability,
onde é passado uma sequencia de funções onde são ligadas em uma corrente (chain),
encarregando ou não a reposta para a proxima função (responsability),
a parte de encarregar é basicamente chamar a proxima função da corrente,
para realizar o tratamento do dado, e a sequencia das funções,
podem ser alteradas sempre que quiser, ou seja, não precisará ser algo
preso a um unico conjunto de tratamentos
*/



/*
Abaixo um exemplo:
*/



const funcao1 = (contexto, prox_func) => {
    contexto.nome = "Passei pela funcao1" 
    prox_func();
}


const funcao2 = (contexto, prox_func) => {
    contexto.nome1 = "Passei pela funcao2" 
    prox_func();
}


const funcao3 = (contexto) => { //a funcao 3 foi definida para ser o final da corrente
    contexto.nome2 = "Passei pela funcao3" 
}


const middleware_func = (contexto, ...lista_funcoes) => {
    const chain = (indice_func) => {
        indice_func <= lista_funcoes.length ? lista_funcoes[indice_func](contexto, ()=>chain(indice_func + 1)) : '';
        }
    chain(0);
}

let contexto = {}

middleware_func(contexto, funcao1,funcao2,funcao3)
console.log(contexto)
//{ nome: 'Passei pela funcao1', nome1: 'Passei pela funcao2', nome2: 'Passei pela funcao3'}

contexto = {}
middleware_func(contexto, funcao1,funcao3, funcao2)
console.log(contexto)
// { nome: 'Passei pela funcao1', nome2: 'Passei pela funcao3' }


contexto = {}
middleware_func(contexto, funcao3,funcao2)
console.log(contexto)
//{ nome2: 'Passei pela funcao3' }

contexto = {}
middleware_func(contexto, funcao2,funcao1)
console.log(contexto)
//{ nome1: 'Passei pela funcao2', nome: 'Passei pela funcao1'}


/*
O padrão não se limita a chamada em uma ordem diferente, é 
possível também decidir adicionar outras funções (ou seja, outros tratamentos para o dado)
*/





//                                                           REFERENCIAS


/*
https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/

https://chat.openai.com/chat
https://www.w3schools.com/js/

https://www.udemy.com/course/curso-web/
*/