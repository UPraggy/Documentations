


# JavaScript Basico ao Avançado


## INDICE 
### JS BASICO

- **[Variaveis](#variaveis)**
- **[Tipos de Dados](#tipos-de-dados)**
- **[Impressão](#impressão)**
- **[Array Básico](#array-basico)**
- **[Objetos](#objetos)**
- **[Funções](#funções)**
- **[Classes](#classes)**
- **[Exceções - Try And Catch](#exceções---try-and-catch)**
- **[For/in](#forin)**

### JS APROFUNDANDO 

- **[Funções](#aprofundando-funções)**
- **[Json](#json)**
- **[Objetos](#aprofundando-objetos)**
- **[Classe](#aprofundando-classe)**
- **[Array](#aprofundando-array)**



## Obs.: 


#### Os programas contem comentarios sobre o assunto, ele pode ser executado para melhor entendimento, use 'console.log()' para ver as saidas e alterações.



















# VARIAVEIS


## VAR

#### o var pode ser chamada fora do escopo de outras funções, desde que ela seja usada depois da sua declaração.

#### EXEMPLO:

```js
    console.log(temp) //imprime indefined (variavel não existe ainda), mas não da erro

    {
        var temp = 10;
        console.log(temp) //imprime 10
    }
    console.log(temp) //imprime 10
```


## LET

#### o let pode ser chamada apenas dentro do escopo da função. É a mais recomendada para usar.

#### EXEMPLO:

```js
    console.log(temp) //retorna erro 'temp is not defined'

    {
        let temp = 10;
        console.log(temp) //imprime 10
    }
    console.log(temp) //retorna erro 'temp is not defined'
```

## CONST

#### É semelhante ao let, porém ele não aceita novos valores

```js
    const temp = 10;
    temp = 20; // retorna erro 'Assignment to constant variable.''
```


### OBS: As variaveis NÂO TEM TIPOS DEFINIDOS



















# TIPOS DE DADOS

#### Mesmo que na declaração de uma variavel, ela não tenha um tipo especifico, é de grande importancia aprender sobre os diferentes tipos de dados para algumas operações.

#### Os tipo de dados são os seguintes

### String

#### Normalmente se refere a textos ou palavras.

```js
    var string = "texto aleatorio"
```

### Number

#### Corresponde a qualquer numero.

```js
    var number = 7
    number = 8.2
    numer = 7.1651846
```

### Boolean

#### Corresponde aos valores verdadeiro e falso, comummente usado em verificações.

```js
    var variavel_booleana = true
    variavel_booleana = false
```

### Null

#### Apesar de Null ser igual a Undefined, eles não são identicos. Null corresponde a um valor vazio. Enquanto Undefined transmite que a variavel não existe

```js
    var variavel_ = undefined
    var variavel_ = null
```

### Object

#### Se refere a um conjunto de chaves e valores.

```js
    var dados = {
      par: 2,
      impar: 17,
      texto: 'um texto'
    };
    //para chamar:
    console.log(dados) //{par: 2, impar: 17, texto: 'um texto'}
    console.log(dados.impar) //17
```
















 
# IMPRESSÃO 


#### Em projetos maiores, normalmente não é usada a impressão, porém em menores ou até na criação dos maiores a impressão de textos, variaveis e saídas tem uma grande importância

## TIPOS DE IMPRESSÃO

### String

```js
     console.log(variavel) //impressão de variavel
     console.log("TEXTO") //impressão de texto

    //Use o sinal de '+' para concatenar o texto com variaveis
    console.log("TEXTO " + variavel)
    console.log(`1 + 1 = ${variavel}`) // também é possivel imprimir utilizando '${}' com a variavel dentro
```






















# ARRAY BASICO 

#### Um array serve para armazenar mais de uma variavel ou grupo de de dados, um array é uma matriz onde ela pode mudar de dimensão além disso o JavaScript permite armazenar qualquer tipo de dados dentro dela, desde tipos basicos, até funções e objetos.

```js
    var array_exemplo = ['ola',10,40,'w',true]
    // acessando array
    console.log(array_exemplo[0]);

    //converte para uma string com virgulas separando os dados
    array_exemplo.toString(); //'ola,10,40,w,true'

    //converte para uma string e junta os dados separando por oque tem dentro do join
    array_exemplo.join('-'); //'ola-10-40-w-true'

```

### Excluido dados
```js
    array_exemplo.pop(); //exclui ultimo item
    console.log(array_exemplo); //['ola',10,40,'w']
    //caso coloque a posição dentro exclui o dado naquela posição
    array_exemplo.pop(0);
    console.log(array_exemplo); //[10,40,'w',true]
```

### Incluindo dados

```js
    array_exemplo.push('dado'); //inclui na ultima posição, pode ser colocar mais de um dado 'push(dado1, dado2,dado3)'
    console.log(array_exemplo); //['ola',10,40,'w',true,'dado']
```

### Tamanho da matriz
```js
    console.log(array_exemplo.length); //5
```
### Ordenando a matriz

#### use o metodo sort para ordenar os dados, e reverse para ordem decrescente

```js
    var array_numeros = [7,2,5,9,3,4,5] 
    console.log(array_.sort()) //[2, 3, 4, 5, 5, 7, 9]
    console.log(array_.reverse()) //[9, 7, 5, 5, 4, 3, 2]
```



















# OBJETOS 

#### Um objeto serve para armazenar variaveis em conjuntos de chave/valor além disso o JavaScript permite armazenar qualquer tipo de dados dentro dela, desde tipos basicos, até funções e objetos.


### criando um objeto


```js
var exemplo_de_objeto = {
    nome : 'hello',
    numero : 10
};

var outro_objeto = {};
```


### adicionando mais atributos

```js
var obj1 = {};
obj1.atributo = 20; // voce pode apenas chamar um atributo que ele será automaticamente criado caso não exista

console.log(obj1); //{atributo: 20}

obj1.fucao = function(){}; //proximo tópico será demostrado como criar uma funcao
```


### É possível cria um objeto utilizando o operador 'new'

```js
var Novo_obj = new Object();

Novo_obj.atributo1 = 'Nome'
```

### é possivel acessar os atributos de um objeto de diferentes formas 

```js
Novo_obj.atributo1
//Nome
Novo_obj['atributo1']
//Nome

```














# FUNÇÕES 

#### Funções é um bloco de codigo pronto e são executadas sempre que solicitadas. Para declarar uma função use:

```js
function nome_da_funcao(parametros) { /* as funções em JavaScript aceitam como parametro qualquer tipo de dado */
  //escreva sua funcao aqui
}
```

### Para chamar uma função 

```js
nome_da_funcao();
```

#### Exemplo 

```js
function imprimeTexto(texto) {
  console.log(texto);
}

imprimeTexto('Olá!'); // imprime "Olá!"
```

### É possivel que a função retorne valores

```js
function soma(num1,num2) { /* as funções em JavaScript retornam qualquer tipo de dado */
  return num1 + num2;
}

soma(2,85); // imprime 87
```

### É possivel armazenar uma função em uma variavel

```js
var variavel_ = function(){
    console.log("esta é uma função");
}

variavel_();
```

### Arrow function

#### Utilizada na criação de funções mais curtas

```js
const media = (param1,param2) => {
    return (param1+param2)/2
}

const media_3 = (a,b,c=0) => (a+b+c)/3 //é implicito o retorno, e em uma linha, não e necessario chave
//ao igualar um parametro a um valor na declaração da função, quando ao chamar a função ele não receber um valor, ele receberá o valor padrão
//ex.: media_3(2,3); -> o valor de c será 0
```

### Passando objeto function (destructuring)

#### Uma forma muito boa e recomendada de passar parametros é por meio de objetos

```js
const distancia = ({v = 10, t = 1}) => v*t;
distancia({t:10})
//100
const obj = {v:5, t:10}
distancia(obj)
//50
/* Caso não queira passar nenhum parametro use um objeto vazio*/
distancia({})
//10
distancia() // retorna erro
```

### Passando array function (destructuring)

#### A mesma forma serve para array

```js
const distancia = ([v = 10, t = 1]) => v*t;
distancia([,10])
//100
const array = [5,10]
distancia(array)
//50
```


#### Caso não queira passar nenhum parametro use um objeto vazio

```js
distancia([])
//10
distancia() // retorna erro

```













# CLASSES 

#### Classes é nada mais doque uma difinição de objeto, com seus atributos e metodos, podendo ser 'instanciado'(instanciar é como criar um novo, com base em um modelo) quantas vezes for preciso.


## Criando uma classe

```js
class NomeDaClasse {
  constructor(atr1, atr2, atrx) { //o constructor é responsavel pela passagens dos atributos ao instanciar a classe
    this.atributo1 = atr1; 
    this.atributo2 = atr2;
    this.atributox = atrx;
    /* a palavra 'this' é usada dentro da classe para referenciar uma variavel ou função contida nela
    ele é parecido como quando acessamos um atributo em um objeto, colocando objeto.atributo1, porém o 'this'
    é comummente usado dentro da classe*/
  }

  methodo1() {

  }

  methodo2() {

  }
  methodox() {

  }

}
```

## Instanciando uma classe

#### ao colocar os atributos dentro do parenteses, os valores serão armazenados nas variaveis atraves do construtor

```js
var variavel_ = new NomeDaClasse(atributo1, atributo2, atributox); 
```


## Exemplo de uso de uma classe

```js
class Animal {
  constructor(atr1, atr2, atrx = 10, atry = 1) { 
    /*colocar o atributo com um valor (por exemplo, contador = 1), significa que caso ele não receba um valor na função, 
    ele setara um valor padrao*/
    this.nome = atr1; 
    this.especie = atr2;
    this.velocidade = atrx;
    this.aceleracao = atry;
    this.distancia = 0;
    console.log(`O ${this.nome} especie ${this.especie} foi instanciado com sucesso!`)
  }

  corre() {
    this.distancia += (this.velocidade+this.aceleracao); /* o operador '+=' indica soma da variavel anterior mais o outro valor ex: 
    this.distancia = this.distancia + velocidade;  */
    console.log(`${this.nome} ultrapassou a distancia de ${this.distancia} metros`)
  }

  aumentaAceleracao(contador = 1) { 
    this.aceleracao += contador; 
    console.log(`Aceleracao ${this.aceleracao} m/s2`)
  }

}


var gato = new Animal('Gato', 'felino');
/* O Gato especie felino foi instanciado com sucesso! */

gato.corre()
/*Gato ultrapassou a distancia de 11 metros*/

gato.aumentaAceleracao(10)
/* Aceleracao 11 m/s */

gato.corre()
/* Gato ultrapassou a distancia de 32 metros */

```

## Subclasse Extends

```js

class Animal {
  constructor(atr1, atr2, atr3) { 
    this.nome = atr1; 
    this.especie = atr2;
    this.idade = atr3;
    console.log(`O ${this.nome} especie ${this.especie} foi instanciado com sucesso!`);
     
  }
  animal(){
    console.log(`${this.nome} da especie ${this.especie} com ${this.idade} anos de idade`);
  }
  falar(){
    console.log(`${this.nome} fale!`);
     }
}

class Gato extends Animal{ /* extends é usado para determinar qual a classe pai */
    constructor(atr1, atr2) { 
        super('Gato','felino', atr2); /* super é usado para referenciar a classe pai assim*/
        this.velocidade = atr1;
    }
  falar(){
    super.falar(); //super pode ser usado para chamar uma função ou atributo do pai
    console.log(`O ${this.nome} Mia!`);
  }

  corre(){
    console.log(`O ${this.nome} corre a uma velocidade de ${this.velocidade} m/s!`);
  }

}


var gato = new Gato(10, 8)
/* O Gato especie felino foi instanciado com sucesso! */

gato.falar();
/*Gato fale!
O Gato Mia!*/
gato.corre();
/* O Gato corre a uma velocidade de 10 m/s! */
gato.animal();

```














# EXCEÇÕES - TRY AND CATCH 

#### No ambiente de desenvolvimento, é comum aparecerem alguns erros e exceções por erro ao codificar, porém algumas vezes o erro pode vir do usuario ou até mesmo do próprio programador, e alguns tipo de erros são ncessarios serem tratados, no JavaScript são usadas as palavras-chave 'try, catch e throw' 

#### Try - tente executar esse codigo
#### Catch - Caso dê erro, pegue ele e trate-o
#### Throw - retorne essa mensagem de erro
#### Finnaly - Sempre é chamado esse bloco, com erro ou não

```js
function trataErro(e, func, where){
    //throw 'mensagem' -> trow pode retornar oque for desde uma simples string ou numero, até objeto
    throw{
        erro : e,
        funcaoOriginal : func,
        onde : where
    }
}

function divideString (obj) {
    let nome, endereço;
    try{
        nome = obj.nome.split('/'); // divide a string e converte em um array de acordo com o delimitador setado
        endereco = obj.endereço.split(' ');
        return [nome, endereco]
    }catch(e){
        console.log("error")
        trataErro(e, 'divideString', 'primeiro try');
    }
    
} 

let obj = {nome:'meu/nome',endereço:'Rua Abril'};
divideString(obj);
//[[meu,nome],[Rua,Abril]]
obj = {nome:10,endereço:5};
divideString(obj);
//error
/*Uncaught 
{erro: TypeError: obj.nome.split is not a function
    at divideString (<anonymous>:13:25)
    at <anonymo…, funcaoOriginal: 'divideString', onde: 'primeiro try'}
erro : TypeError: obj.nome.split is not a function at divideString (<anonymous>:13:25) at <anonymous>:27:1
funcaoOriginal: "divideString"
onde: "primeiro try"*/

obj = {};
divideString({});
//error
/*Uncaught 
{erro: TypeError: Cannot read properties of undefined (reading 'split')
    at divideString (<anonymous>:13:25)
    at <anonymo…, funcaoOriginal: 'divideString', onde: 'primeiro try'}
erro : TypeError: obj.nome.split is not a function at divideString (<anonymous>:13:25) at <anonymous>:27:1
funcaoOriginal: "divideString"
onde: "primeiro try"*/

```











# FOR/IN 

#### Ótimo para usar ao iterar sobre uma estrutura de dados, mais simples que o for covencional 

```js
const animais = ['gato','cachorro','cavalo','vaca','alce']


for (let i in animais){
    console.log(i, animais[i])
}
/*
0 gato
1 cachorro
2 cavalo
3 vaca
4 alce
*/

const animal = {
    nome : 'gato',
    especie : 'felino',
    patas : '4'
}

for (let i in animal){
    console.log(i, animal[i])
}
/*
nome gato
especie felino
patas 4
*/

```








# APROFUNDANDO FUNÇÕES 

#### Funções pode ter mais de um parametro declarado, e há uma forma de pegar todos os parametros utilizando a palavra chave 'arguments'.

```js
function media(){ //'arguments' só funciona em functions, arrow functions não há essa palavra chave
    let soma = 0, quantidade = 0;
    for (var i in arguments){ //usando 'var' para ser possível acessar fora do escopo do 'for'
        soma += arguments[i];
    }
    /*o array conta a partir do '0' para a media é preciso contar a partir do '1'
    é preciso converter o 'i' para int, pois ele vem como string */
    quantidade += (parseInt(i)+1); 
    return soma/quantidade;
}

media(2,2);
//x
media(2,2,6,5);
//3.75
```



## THIS E BIND


#### A palavra reservada 'this', serve para referenciar o contexto onde está a função ou parametro, porém ele pode variar e para impedir essa variação a função 'bind' serve para isso. Abaixo um exemplo com o 'this' com erro e ele sendo corrigido pelo 'bind':

```js
const animal = {
    nome : 'gato',
    especie : 'felino',
    patas : '4',

    falar(){
        console.log(`${this.nome} Miou!!`);
    }
}
```

#### Ao chamar a função através da própria variavel, o this tem o efeito desejado

```js
animal.falar();
//gato Miou!!
```

#### Mas ao 'instanciar' a função do objeto em outra variavel, ele muda, isso se deve ao 'this' apontar para a nova variavel

```js
const novo_animal = animal.falar;
novo_animal();
//undefined Miou!!

```



#### uma forma de resolver isso, é utilizando o bind, onde ele aponta sempre para o objeto/referencia desejada 

```js
const novo_animal = animal.falar.bind(animal);
novo_animal();
//gato Miou!!
```

### Ainda é possível usar uma outra forma de resolver o 'this', que seria com uma constante normalmente nomeada de self*/


#### Sem o self

```js
function Gato(){
        this.nome = 'gato';
        setTimeout(function(){ //função que conta um tempo para chamar outra função
            console.log(`${this.nome} Miou!!`)
        }, 1000)
        return 0;
        
}

new Gato; //ao criar como objeto sem armazenar na variavel, o this varia, no caso, aponta para quem invocou  função setTimeout
//undefined Miou!!
```



#### Com o self

```js
function Gato(){
        this.nome = 'gato';
        const self = this;
        setTimeout(function(){
            console.log(`${self.nome} Miou!!`)
        }, 1000)
        return 0;
        
}

new Gato;
//gato Miou!!
```

#### Funções arrow tiram o problema do this


```js
function Gato(){
        this.nome = 'gato';
        setTimeout(() =>{ 
            console.log(`${this.nome} Miou!!`)
        }, 1000)
        return 0;
        
}

new Gato;
//gato Miou!!
```

#### Obs.: o arrow é tão forte que caso use o bind para referenciar outro objeto, o this ainda vai referenciar no caso a função Gato, o arrow sempre aponta para o contexto em que foi definido.




## Funções construtoras

#### Funções também podem ser instanciadas como classes, elas em geral são iguais a uma classe, porém tem uma forma diferente de serem escritas.

```js
function Poligono(tamanho = [8,3,5]){
    // atributos definidos sem o this, são privados, ou seja, não podem ser acessados fora da função
    let tipo = ''
    this.tamanho = tamanho;

    // funcao privada
    let ordenaLados = () => { //metodos
        for (y in tamanho){
            for (let x=0; x < tamanho.length; x++){
                if (tamanho[x] > tamanho[x+1]){
                  aux = tamanho[x+1];
                  tamanho[x+1] = tamanho[x];
                  tamanho[x] = aux;
                 }
            }                                       
        }
    }
    
    ordenaLados();
    this.perimetro = () => { 
        let resultado = 0;
        for (i in this.tamanho){  
            resultado += this.tamanho[i]
            
        }
        return resultado
    }

    this.descobreTipo = (triagulo = this) => {
        if (triagulo.tamanho[0] == triagulo.tamanho[1]){
            if (triagulo.tamanho[1] == triagulo.tamanho[2]){
                tipo = 'equilatero';
            }else{
                tipo = 'isoceles';
            }
        }
        else if (triagulo.tamanho[1] == triagulo.tamanho[2]){
            tipo = 'isoceles';
        }else{
            tipo = 'escaleno';
        }
        return tipo
    }

    this.calculaSemelhanca = function(triangulo){
        let t2 = triangulo.tamanho
        let t1 = this.tamanho
        return ((t1[0]/t2[0]) == (t1[1]/t2[1]) && (t1[2]/t2[2]) == (t1[1]/t2[1]) && (t1[2]/t2[2]) == (t1[0]/t2[0])) ? 'Triangulos Semelhantes' : 'Triangulos diferentes';
    // (condição) ? retorno se verdadeiro : retorno se falso;
    }

}


const triangulo = new Poligono;
const triangulo2 = new Poligono([16,6,10]);
const triangulo3 = new Poligono([4,4,4]);


triangulo.perimetro(); //16
console.log(triangulo.tipo);//undefined -> parametro privado
console.log(triangulo.tamanho);//[3,5,8] -> parametro publico

triangulo.calculaSemelhanca(triangulo2); //'Triangulos Semelhantes'
triangulo.calculaSemelhanca(triangulo3); //'Triangulos diferentes'

triangulo.descobreTipo()//'escaleno'
triangulo.descobreTipo(triangulo3)//'equilatero'
```


# JSON 

#### JSON é uma forma de armazenar objetos, através de uma string, amplamente usado para comunicação entre linguagens, só aceita valores (numero, string, bool, array, objetos dentro de objetos), funções não.


```js
const obj = { indice1: 123, numero2: true, d: {

chave : [1,2,3,4]

} }
let json_obj = JSON.stringify(obj) //para converter em json
json_obj
//'{"indice1":123,"numero2":true,"d":{"chave":[1,2,3,4]}}'


let json_obj  = JSON.parse('{ "gato": "hello", "abelha": true, "chaves": 89 , "d": [], "e": { "obj_novo" : { "obj" : [1,2,3] }} }')
json_obj

//{gato: 'hello', abelha: true, chaves: 89, d: [], e: { obj_novo : { obj : [1,2,3] }} }
```










# APROFUNDANDO OBJETOS 


#### Alem das propriedades comum de um objeto, de armazenar funções, e valores, há outras operações possiveis.


## Algumas funções e conceitos

```js
const cachorro = new Object

cachorro.nome = 'Spike';
cachorro.idade = 10;
cachorro.velocidade = 5;
cachorro.falar = function() {
        console.log(`${this.nome} Latiu!!`);
    }.bind(cachorro);

cachorro.mudaNome = function(novoNome) {
        this.nome = novoNome;
    }.bind(cachorro);


console.log(cachorro)
//{nome: 'Spike', idade: 10, velocidade: 5, falar: ƒ, mudaNome: ƒ}
cachorro.falar()
//Spike Latiu!!


cachorro.velocidade
//5
delete cachorro.velocidade //função deleta qualquer atributo dentro do objeto
cachorro.velocidade
//undefined

Object.freeze(cachorro) //bloqueia o objeto para qualquer tipo de alteração
cachorro.nome
//'Spike'
cachorro.nome = 'Mike'; //não funciona
cachorro.nome
//'Spike'

//Mesmo uma funcao dentro dele não tem o poder de mudar
cachorro.mudaNome('Tony')
cachorro.nome
//Spike

Object.preventExtensions(cachorro) //impede de adcionar atributos no objeto
Object.seal(cachorro) //impede de adcionar ou deletar atributos no objeto, modificações de atributos são permitidas







Object.keys(cachorro) //pega todas as chaves
//['nome', 'idade', 'falar', 'mudaNome']
Object.values(cachorro) //pega todos os chaves
//['Spike', 10, ƒ, ƒ]

Object.entries(cachorro) //retorna array de chave e valor
//[['nome', 'Spike'],['idade', 10],['falar', ƒ],['mudaNome', ƒ]]


const cachorro2 = {
    nome : 'Oi',
    idade : 10,
    velocidade : 5,
    falar : function() {
        console.log(`${this.nome} Latiu!!`);
    },

    mudaNome : function(novoNome) {
        this.nome = novoNome;
    }

}



/*A função defineProperty pode definir inumeras propriedades para um atributo de
um objeto:
enumerable(true or false) -> pode ser listado, por exemplo, pelo Object.keys
writable(true or false) -> pode ser modificado
value(valor) -> atribuir valor a ela
*/
Object.defineProperty(cachorro2, 'nome',{
    writable : false,
    value : 'Dog',
})
cachorro2.nome = 'Novo_Dog'
cachorro2.idade = 5

cachorro2.nome
//Dog
cachorro2.idade
//5
```


#### A função Object.assign permite 'concatenar' ,ou seja, unir todos os atributos de diferentes objetos, em um vale ressaltar que atributos com mesmas chaves, serão sobreescritos pelo objeto mais recente.

```js
const obj1 = { a: 1, b: 2 };
const obj2 = { b: 4, c: 5 };
const obj3 = { e: 8, a: 5 };

const returnedTarget = Object.assign(obj1, obj2, obj3);


obj1
//{a: 5, b: 4, c: 5, e: 8}

returnedTarget
//{a: 5, b: 4, c: 5, e: 8}
```


## Herança

#### Em js para herança é usado a palavra chave '__proto__', para estabelecer um prototipo, ou seja, o '__proto__' é como uma seta que aponta para o pai de determinado objeto, com esse apontamento, caso o filho não tenha algum atributo e o pai tiver, é possivel acessar através do filho o atributo (valor ou função) do pai, abaixo um exemplo de utilização:


#### Neste exemplo os objetos filhos são gato e cachorro, em que herdam o pai que é o objeto mamifero.

```js
const mamifero = {
    nome : 'Mamifero Sem Nome',
    patas : 0,
    tipo: 'mamifero',

}

const cachorro = {
    __proto__ : mamifero, //Herdando o obj mamifero através do atributo '__proto__'
    falar : function() {
        console.log(`${this.nome} Latiu!!`);
    },


}

const gato = {
    __proto__ : mamifero,
    falar : function() {
        console.log(`${this.nome} Miou!!`);
    },


}

/*ao tentar acessar um atributo que não existe em gato, ele tenta verificar se o pai 
'mamifero' tem e o retorna caso tenha*/
gato.nome; 
//Mamifero Sem Nome


/*Caso o atributo receba valor, o obj filho cria esse atributo, assim perdendo o acesso
ao atributo em questão do pai*/
cachorro.nome = "Spike"; 
cachorro.nome
//Spike

//fora essa palavra chave também pode ser usada uma função equivalente Object.setPrototypeOf(obj, prototipo)

```




#### Obs.: o objeto pai, também pode ser filho de outro objeto 


```js
const animal = {
    vivo : 'Morto',
    tipo: 'Indeterminado',

    status(){
        return ` encontra-se ${this.vivo}`;
    }
}


const mamifero = {
    __proto__ : animal, 
    nome : 'Mamifero Sem Nome',
    patas : 0,
    tipo: 'mamifero',

    status(){
        return `O ${this.nome} tipo ${this.tipo} ${super.status()}`; //super é semelhante ao this, só que ele referencia a classe pai
    }
}

const cachorro = {
    __proto__ : mamifero, //Herdando o obj mamifero através do atributo '__proto__'
    especie : 'cachorro',
    falar : function() {
        console.log(`${this.nome} Latiu!!`);
    },

    status(){
        return `O ${this.especie} ${super.status()}`; //super é semelhante ao this, só que ele referencia a classe pai
    }
}


cachorro.vivo; //-> caso não encontre o atributo nem no filho, nem no pai, ele vai procurando nos pais mais acima
//Morto
cachorro.vivo = 'vivo';
cachorro.tipo; //caso tenha no pai, ele para de buscar nos niveis mais acima
//mamifero
cachorro.nome = "Spike";
cachorro.nome;
//Spike
cachorro.__proto__.nome; //com proto é possivel realizar esse tipo de chamada
//Mamifero Sem Nome
```


#### Seguindo essa linha assim como o objeto tem o 'this' para referencia-lo, há também o 'super' usado para referenciar o objeto pai no exemplo abaixo, a função é chamada, e dentro dela é chamada como complemento a função pai utilizando o 'super' verfique os metodos mais acima para melhor entendimento.

```js
cachorro.status();
//O cachorro O Spike tipo mamifero  encontra-se vivo
```

#### a palavra nome foi sobreescrita pelo nome do cachorro, pois o this teve 
como referencia a função que o chamou, logo a referencia foi a função dentro
do objeto cachorro.








# APROFUNDANDO CLASSE 

```js
class Animal{
    constructor(tipo = 'sem tipo',vivo = 'Morto'){
        this.vivo = vivo;
        this.tipo = tipo;
    }

    status(){
        return ` encontra-se ${this.vivo}`;
    }
}

class Mamifero extends Animal{ //a palavra 'extends' serve como '__proto__' em objeto, definindo a classe pai
    constructor(nome = 'Sem Nome',patas = 0,tipo,vivo){
        super(vivo,tipo); //em classe uma forma de inicializar/chamar o contrutor da classe, é usando a palavra chave 'super'
        this.nome = nome;
        this.patas = patas;
        
    }

    status(){
        return `O ${this.nome} tipo ${this.tipo} ${super.status()}`;
    }
}


class Cachorro extends Mamifero{ 
    constructor(especie = 'cachorro',cor = 'marrom', nome,patas,tipo,vivo){
        super(nome,patas,tipo,vivo); 
        this.especie = especie;
        this.cor = cor;
        
    }

    status(){
        return `O ${this.especie} cor ${this.cor} ${super.status()}`;
    }
}



const cachorro1 = new Cachorro;
cachorro1
//{vivo: 'Morto', tipo: 'sem tipo', nome: 'Sem Nome', patas: 0, especie: 'cachorro', cor: 'marrom'}

```

















# APROFUNDANDO ARRAY 

#### Alem das propriedades comum de um objeto, de armazenar funções, e valores, há outras operações
possiveis.


```js
var array_exemplo = ['a','b','c','d','e']


array_exemplo.length //retorna tamanho do array
//5

delete array_exemplo[0]
array_exemplo
//[undefined,'b','c','d','e']


array_exemplo[0] = 'a'
array_exemplo
//['a','b','c','d','e']

```


#### exclui items a partir de um indice e pode adicionar elementos
```js
array_exemplo.splice(1,2) //(indice de partida, quantidade de elementos)
array_exemplo
//['a', 'd', 'e']

array_exemplo = ['a','b','c','d','e']
array_exemplo.splice(2,3, 'f','g','h', 'j') 
array_exemplo
//['a', 'b', 'f', 'g', 'h']

//caso coloque 0 na quantidade ele não apaga nenhum elemento
array_exemplo = ['a','b','c','d','e']
array_exemplo.splice(2,0, 'f','g') 
array_exemplo
//['a', 'b', 'f', 'g', 'c', 'd', 'e']

```


## Funções simples

```js
const animais = ['gato','cachorro','cavalo','vaca','alce']
animais
//['gato','cachorro','cavalo','vaca','alce']
```

#### cria um novo array, pegandos todos os elementos a partir de um indice

```js
let novo_animais = animais.slice(3) //(inicio,fim) -> caso não determine o fim, ele segue até o ultimo elemento do array
novo_animais
//['vaca', 'alce']

const novo_animais = animais.slice(1,3) //(inicio,fim) -> caso determine o fim, ele segue até o indice sem pegar ele
novo_animais
//['cachorro', 'cavalo']

```


## Percorrendo array


### ForEach -> para cada elemento no array, faça algo

```js
const animais = ['gato','cachorro','cavalo','vaca','alce']



animais.forEach(function(nome,indice){ //o parametro indice pode ser oculto e o nome e há um terceiro que é o array completo
    console.log(`${indice}: ${nome}`)
})

/*
0: gato
1: cachorro
2: cavalo
3: vaca
4: alce
*/
```

### Construindo o proprio forEach

```js
const animais = ['gato','cachorro','cavalo','vaca','alce']


//criando função e adicionando como atributo atraves da relacao de prototipo

Array.prototype.forEach2 = function (callback){  //a palavra 'callback' tem como significado, uma função que é chamada varias vezes
    for (let x =0; x < this.length; x++){
        callback(this[x],x,this);
    }
}; 


animais.forEach2(function(nome,indice){ //executando como prototipo
    console.log(`${indice}: ${nome}`)
})
/*
0: gato
1: cachorro
2: cavalo
3: vaca
4: alce
*/
```


### A função map serve para modificar os elementos do array

```js
const numeros = [1,2,3,4,5]

let resultado = numeros.map(function(e){
    return e * 2;
});

resultado
//[2, 4, 6, 8, 10]

resultado = resultado.map(e => e+1).map(e => e/2)
                .map(x => Math.round(x) - 10); //chamada sucessivas, a fução round da biblioteca Math, arredonda numeros

resultado
//[-8, -7, -6, -5, -4]

```



### Desafio Map

```js
const carrinho = [
    '{ "nome": "Borracha", "preco": 3.45 }',
    '{ "nome": "Caderno", "preco": 13.90 }',
    '{ "nome": "Kit de Lapis", "preco": 41.22 }',
    '{ "nome": "Caneta", "preco": 7.50 }'
]

//desafio de retornar array apenas com preços

let tmp = carrinho.map(function(e){
    return JSON.parse(e).preco;
})

tmp
//[3.45, 13.9, 41.22, 7.5]

```




### criando função e adicionando como atributo atraves da relacao de prototipo


```js
function map2(callback){ 
    const new_array = []
    for (let x = 0; x < this.length; x++){
        new_array.push(callback(this[x], x, this));
    }
    return new_array;
}; 


Array.prototype.map2 = map2;


const numeros = [1,2,3,4,5]

let resultado = numeros.map2(function(e){
    return e * 2;
});

resultado
//[2, 4, 6, 8, 10]

```

### filtrando array de acordo com uma logica


```js
const alunos = 
[ 
    {nome: 'aluno1', nota: 10},
    {nome: 'aluno2', nota: 2},
    {nome: 'aluno3', nota: 6},
    {nome: 'aluno4', nota: 3},
    {nome: 'aluno5', nota: 4},
    {nome: 'aluno5', nota: 1}

]

let acima_da_media = alunos.filter(function(e){ //ele adciona ou não no array final, dependendo do retorno falso ou verdadeiro  
    return e.nota >= 6
})
acima_da_media
//[{nome: 'aluno1', nota: 10},{nome: 'aluno3', nota: 6}]

```




### criando função e adicionando como atributo atraves da relacao de prototipo


```js
Array.prototype.filter2 = function(callback){
    const novo_array = []
    for (let x = 0; x < this.length; x++){
        callback(this[x], x, this) ? novo_array.push(this[x]) : ''; //condição ? se verdadeiro : se falso
    }
    return novo_array
};


const alunos = 
[ 
    {nome: 'aluno1', nota: 10},
    {nome: 'aluno2', nota: 2},
    {nome: 'aluno3', nota: 6},
    {nome: 'aluno4', nota: 3},
    {nome: 'aluno5', nota: 4},
    {nome: 'aluno5', nota: 1}

]

let abaixo_da_media = alunos.filter2(function(e){ //ele adciona ou não no array final, dependendo do retorno falso ou verdadeiro  
    return e.nota < 6
})
abaixo_da_media
/*
[
{nome: 'aluno2', nota: 2},
{nome: 'aluno4', nota: 3},
{nome: 'aluno5', nota: 4}, 
{nome: 'aluno5', nota: 1}
]
*/

```

### reduzindo array 


#### A função reduce, reduz um array em um valor final, basicamente ele pega o primeiro valor e a partir dele faz uma operação, onde ele pega o resultado da operação, e realiza ela com o proximo elemento do array, por exemplo uma soma:
#### dado um array -> [1,2,4,2,5,1], eu faço o reduce somando os elementos, resultado+elemento , ai ele pega o primeiro indice realiza a operação , 0+1, e chama a callback de novo agora pega o segundo e soma com o resultado anterior, 1+2 -> 3, e vai até o ultimo, 3+4, 7+2, 9+5, 14+1, por fim retorna o resultado 15


```js
const array_de_numeros = [2,2,4,5,1,3,6]


//Argumentos -> callback (acumulador -> resultado, atual -> valor atual) e há outro parametro que é o valor inicial
let resultado = array_de_numeros.reduce(function(acumulador,atual){ 
    return acumulador * atual
})
resultado
//1440
resultado = array_de_numeros.reduce(function(acumulador,atual){ 
    return acumulador + atual
},20)
resultado
//43 -> sem o valor inicial 20, daria 23
```




### Desafios reduce


```js
const alunos = [
    { nome: 'João', nota: 7.3, bolsista: false },
    { nome: 'Maria', nota: 9.2, bolsista: true },
    { nome: 'Pedro', nota: 9.8, bolsista: false },
    { nome: 'Ana', nota: 8.7, bolsista: true }
]
// Desafio 1: Todos os alunos são bolsista?

let result = alunos.reduce((ac, e) => ac && (e.bolsista == true), true);
result
//false

// Desafio 2: Algum aluno é bolsista?
result = alunos.reduce((ac, e) => ac || (e.bolsista) == true, false);
result
//true

```


#### criando função e adicionando como atributo atraves da relacao de prototipo

```js
Array.prototype.reduce2 = function(callback, init_value){
    let result = init_value === undefined ? this[0] : callback(init_value, this[0]);
    for (let x = 1; x < this.length; x++){
        result = callback(result, this[x], x, this);
    }
    return result
};

const array_de_numeros = [2,2,4,5,1,3,6]


//Argumentos -> callback (acumulador -> resultado, atual -> valor atual) e há outro parametro que é o valor inicial
let resultado = array_de_numeros.reduce2(function(acumulador,atual){ 
    return acumulador * atual
})
resultado
//1440
resultado = array_de_numeros.reduce2(function(acumulador,atual){ 
    return acumulador + atual
},20)
resultado
//43
```


## Função concat

#### ela é usada para juntar dois ou mais arrays em um só

```js
const array1 = [1,2,3]
const array2 = [3,4,5]

const array3 =  array1.concat(array2) 
array3
//[1, 2, 3, 3, 4, 5]
const array3 =  array1.concat(array2, 7,8) //é possivel adicionar elementos também
array3
//[1, 2, 3, 3, 4, 5, 7, 8]

```


# REFERENCIAS



### https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/

### https://chat.openai.com/chat
### https://www.w3schools.com/js/

### https://www.udemy.com/course/curso-web/
