/*
INDICE 

# Node
- TAGGED TEMPLATE
- MAP
- SET
- FOR/OF
- PROMISE
- ASYNC/AWAIT
*/

/*Obs.: 

Para buscar pesquise por '# nome'.


Os programas contem comentarios sobre o assunto, ele pode ser executado para
melhor entendimento, use 'console.log()' para ver as saidas e alterações.
Além disso, os exemplo podem usar arquivos diferentes (abordando o tema de modulos)*/







/*                                      ########################################################### 
                                        ###########################################################
                                        ####################### TAGGED TEMPLATE ###################
                                        ###########################################################
                                        ###########################################################*/

/* Após algumas atualizações do JavaScript foi introduzida uma funcionalidade, chamada 
tagged template, que permite formatar uma string conforme uma tag (função pré-definida)*/


function tag_money(string, ...variaveis){ 
    //as variaveis são aquelas com '${}' dentro da string, e a string são os valores restantes
    let tam = variaveis.length > string.length ? variaveis.length : string.length;
    let  string_nova = []
    variaveis.forEach((valor,x)=>{
        isNaN(valor) ? '' : valor = `R$ ${valor.toFixed(2)}`;
        string_nova.push(string[x],valor) //juntando os valores já modificados a cada iteração
    })


    return  string_nova.join('')
}


let valor_J = 100;
let pao = 20;
let troco = 80;
console.log(tag_money `Jõao comprou com seus ${valor_J} o pao de ${pao} e recebeu de troco ${troco}`);

//Jõao comprou com seus R$ 100.00 o pao de R$ 20.00 e recebeu de troco R$ 80.00

















/*                                      ########################################################### 
                                        ###########################################################
                                        ############################# MAP #########################
                                        ###########################################################
                                        ###########################################################*/


/*
Um map, é mais flexivel que o objeto, podendo conter como chave, uma função, numero ou objeto
*/

/*------Criando um Map--------*/

const meuMap = new Map()

/*------Inserindo chave e valores--------*/

meuMap.set('numerosPar',{minhaLista:[2,4,6,8,10]})
meuMap.set('numerosImpar',[1,3,5,7,9])
meuMap.set('numerosPrimos',[1,2,3,5,7,9])


/*------Acessando valores--------*/

console.log(meuMap.get('numerosPar'))
//{ minhaLista: [ 2, 4, 6, 8, 10 ] }
console.log(meuMap.get('numerosPar').minhaLista)
//[ 2, 4, 6, 8, 10 ]


/*-----Criando Map com diferentes chaves------*/
function meuNome(){
    console.log("ola")
}
const meuNovoMap = new Map([
    [meuNome,'Valor da Funcao'],
    [{},5],
    [[1,2,3],{Um_array:["ola",'array']}],
    [120,35],
    ])


meuNovoMap.forEach((valor,i)=>{
    console.log(valor,i)
})


/*
Valor da Funcao [Function: meuNome]
5 {}
{ Um_array: [ 'ola', 'array' ] } [ 1, 2, 3 ]
35 120 
*/

/*------Funções do Map------*/

console.log(meuNovoMap.has(120))
true
console.log(meuNovoMap.has('chave'))
false

meuNovoMap.delete(120)
console.log(meuNovoMap.has(120))
false

console.log(meuNovoMap.size)
3



















/*                                      ########################################################### 
                                        ###########################################################
                                        ############################# SET #########################
                                        ###########################################################
                                        ###########################################################*/


/*
Estrutura não é indexada e não aceita repetição
*/


const pares = new Set()

pares.add(2).add(8).add(4).add(6)
pares.add(10)
pares.add(2).add(6)

console.log(pares)
//Set(5) { 2, 8, 4, 6, 10 }

console.log(pares.size)
//5
console.log(pares.has(2))
//true

pares.delete(2)

console.log(pares.has(2))
//false

/*-----Criando a Partir de um array-----*/

const impar = [1,3,5,7,9]
const impares_set = new Set(impar)

console.log(impares_set)
//Set(5) { 1, 3, 5, 7, 9 }

















/*                                      ########################################################### 
                                        ###########################################################
                                        ########################### FOR/OF ########################
                                        ###########################################################
                                        ###########################################################*/

/* Ao contrario do ForIn, o ForOf percorre valores */

const array_animais = ['vaca','gato','cachorro','lobo']


for (x of array_animais){
    console.log(x)
}
/*
vaca
gato
cachorro
lobo
*/


















/*                                      ########################################################### 
                                        ###########################################################
                                        ########################### PROMISE #######################
                                        ###########################################################
                                        ###########################################################*/


/* Como o proprio nome diz, uma promise é uma promessa que pode ou não ser cumprida,
podendo retornar um erro

O uso de Promise pode ser melhor quando se tem muitas chamadas de uma função callback,
em que se chama uma função dentro da outra, para realizar um tratamento especifico,
vale mencionar que ela é assíncrona, logo, ela não para a execução do programa,
para executar as inumeras chamadas

No exemplo abaixo, além de mostrar como se cria uma Promise, é possivel
ver o assíncronismo, em que o console.log() executou mais rapido que a promise*/




function someDepoisDe(tempo, valor){
    return new Promise((resolve, reject)=>{ //resolve é cumprir a promessa, ou caso não dê erro e reject é o contrario
        setTimeout(()=>{
            valor += 1
            console.log(valor)
            if (isNaN(valor)){
                reject(valor) // chama o catch e retorna um erro, paralisando todas as execuções (não chama o proximo then)
            }else{
                resolve(valor); //passagem do valor para a proxima chamada "then"
            }
             
        }, tempo * 1000)
    })
}

let valor = 0;
someDepoisDe(1,valor)
    .then(valor => someDepoisDe(2,valor)) //é possivel concatenar novas chamadas, além de utilizar o valor anterior
    .then(valor => someDepoisDe(1,valor)) 
    .then(valor => someDepoisDe(1,'teste')) 
    .then(valor => someDepoisDe(1,valor)) 
    .catch(e => console.log("error"))

console.log("Executei antes da Promise")
/*
Executei antes da Promise
1
2
3
teste1
error
*/





function someDepoisDe(tempo){
    return new Promise((resolve, reject)=>{ 
           setTimeout(()=>{
                valor += 1
                if (valor > 2){
                    reject('rejeitada')
                }
                else{
                    resolve(valor); 
                }
                }, tempo * 500)
              
        
    })
}

let valor = 0;
/*a vantagem do Promise.all é chamar varias promisses ao mesmo tempo e depois
chamar o then, ao chamar ao mesmo tempo, é possivel uma função executar antes,
da outra*/
Promise.all([someDepoisDe(1),someDepoisDe(1),someDepoisDe(1)]) 
    .then(() => someDepoisDe(1))
    .then(valor => console.log(valor))
    .catch((e) => {console.log(e +' '+ valor)})

//rejeitada 3


/*Saida se na função fosse:
    if (valor > 5){*/

//4


                            /*----------------------Desafio-------------------------*/

/*
Criar uma promisse que leia um arquivo .txt usando o modulo 'fs'
do Node, recebendo como parametro o nome do arquivo, 
e após ler, imprimir o conteudo
Nota: tente colocar um tratamento de erro
*/




/*



                            ABAIXO A RESOLUÇÃO DO DESAFIO




*/







const readFile = (dirName) => {
    return new Promise((resolve,reject)=>{

        const diretorio = __dirname + dirName;

        const fs = require('fs');
        fs.readFile(diretorio, 'utf-8', (error, text)=>{
            error ? reject(error) : resolve(text); //se tem erro, retorna erro
            
        })

    })
}


readFile('/meuArquivo.txt')
    .then(text => console.log(text))
    .catch(err => console.log("ERRO ENCONTRADO "+err.message))

//CONTEUDO DO ARQUIVO



//passando o nome errado para capturar o erro
readFile('/Arquivo.txt')
    .then(text => console.log(text))
    .catch(err => console.log("ERRO ENCONTRADO "+err.message))

//ERRO ENCONTRADO ENOENT: no such file or directory, open 'd:\Usuarios\xxxxxx\dres.txt'















/*                                      ########################################################### 
                                        ###########################################################
                                        ######################### ASYNC/AWAIT #####################
                                        ###########################################################
                                        ###########################################################*/


/*
O ASYNC/AWAIT tem conceito parecido com promise, em que você pode declarar uma função assincrona,
e sua execução não interfere no codigo, dentro da função todo o código será executado de forma
assincrona, mas ao usar a palavra chave 'await' é possível determinar se o codigo deve ou não
esperar que uma determinada promise seja resolvida
Nota: a palavra await não aceita ser escrita fora de uma função com async
*/



function someDepoisDe(tempo,valor){
    return new Promise((resolve, reject)=>{ 
           setTimeout(()=>{
                valor += 1
                    resolve(valor); 
                }, tempo * 500)
    })
}

async function imprimeSaudacao(valor){
    someDepoisDe(5,valor).then(valor => console.log(valor))
    console.log("executa assincrono tambem")
}


imprimeSaudacao(1)
console.log("Ultima linha do codigo")

/*
executa assincrono tambem
Ultima linha do codigo
2

---------------------
Nesta saída é possível verificar que a função executou,
'paralelamente' ao resto do codigo, o console.log dentro
executou rapidamente logo ele que saiu primeiro, já o 'someDepoisDe'
como iria demorar foi o ultimo a ser executado, logo
o console.log fora da função teve sua execução normal,

Nesta mesma saída é possível observar que cada linha do
codigo dentro da função 'imprimeSaudacao' é assincrono,
visto que um executou antes do outro
*/




                    /*-------------Usando Await-----------*/


function someDepoisDe(tempo,valor){
    return new Promise((resolve, reject)=>{ 
           setTimeout(()=>{
                valor += 1
                    resolve(valor); 
                }, tempo * 500)
    })
}

async function imprimeSaudacao(valor){
    valor = await someDepoisDe(2,valor)
                    .then(valor =>{
                        console.log(valor)
                        return valor
                    })
                        
    console.log("executa assincrono tambem")
    await someDepoisDe(2,valor)
                    .then(valor =>{
                        console.log(valor)
                        return valor
                    })
    console.log("executa assincrono tambem")
}


imprimeSaudacao(1)
console.log("Ultima linha do codigo")





/*
Ultima linha do codigo
2
executa assincrono tambem
3
executa assincrono tambem

---------------------
Ao usar await (lembrando que a função tem que ser uma promise),
a função assincrona é obrigada a esperar a linha com await
ser executada para que possa dar continuidade a suas execuções normais,
Nesta saída é possível verificar que somente após a função
'someDepoisDe' ser executada que o console.log("executa...") logo abaixo foi
executado
*/










 //                                                           REFERENCIAS


/*
https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/

https://chat.openai.com/chat
https://www.w3schools.com/js/

https://www.udemy.com/course/curso-web/
*/