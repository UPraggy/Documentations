# Gulp & Babel

## INDICE 
- **[Introdução](#introducao)**
- **[Setup Inicial](#setup-inicial)**
- **[Padrão de Projeto Gulp](#padrão-de-projeto-gulp)**
- **[Nota](#nota)**



# INTRODUCAO


### O gulp é um ferramenta para automatizar o processo de organização e preparo do seu projeto, como cópia de arquivos, renomear, mover, entre outras funcionalidades, podendo realiza-las uma em sequencia da outra ou paralelamente.

### Babel é um compilador que adapta seu codigo, para poder ser utilizado em varios navegadores, mesmo que utilize uma tecnologia muito nova, o babel adapta para pode utilizar em tantos browsers quanto possível.

# SETUP INICIAL
Inicie seu projeto no e coloque em seu package.json as seguintes dependencias e instale logo em seguida
```json
"nodemon": "^2.0.20",
"babel-core": "6.26.3",
"babel-preset-env": "1.6.1",
"gulp": "4.0.2",
"gulp-babel": "7.0.1",
"gulp-concat": "2.6.1",
"gulp-sass": "5.0.0",
"gulp-typescript": "4.0.2",
"gulp-uglify": "3.0.0",
"gulp-uglifycss": "1.0.9",
"typescript": "2.8.3"
```

Após isso, instale o cli do gulp globalmente
```cmd
npm i -g gulp-cli
```
O cli é responsavel por executar os comando gulp

Agora crie seu arquivo gulpfile.js e comece a aprender


# PADRÃO DE PROJETO GULP
                                        

```js
//instancie a biblioteca gulp
const gulp = require('gulp');

/*executa comandos e funções em serie
Assim que uma acaba a outra começa
Além também de executar em paralelo,
em que uma função não depende da outra
*/
const {series, parallel} = gulp


/*
Crie sua tarefa e não esqueça de retornar a callback
para que o gulp possa chamar outra tarefa em seguida
*/
function task1(cb){
	console.log("Minha tarefa 1")
	return cb();
}

function task2(cb){
	console.log("Minha tarefa 2")
	return cb();
}

function task3(cb){

	console.log("Minha tarefa 3")
	
	return cb();
}


function task4(cb){
	console.log("Minha tarefa 4")
	return cb();
}

/*Após isso é necessário exportar
as tarefas definindo a sequencia
Vale lembrar que o gulp espera 
uma tarefa chamada 'default', uma forma
de identificar.
*/

module.exports.default = series(
	task1,
	parallel(task2,task3),
	task4
	)
 */
```
#### Nota.: Para executar seu gulpfile digite "gulp" dentro do diretorio


TERMINAL
```cmd
gulp

Minha tarefa 1
Minha tarefa 2
Minha tarefa 3
Minha tarefa 4
```





# PROJETO GULP COM JS
Neste modulo, é possível utilizar outro projeto e arquivos javascript, lembre-se de separar seus codigos em uma pasta e o gulp em outra, caso queira utilizar o do exemplo, use o seguinte

### Arquivo .js dentro da pasta src (onde são organizados os codigos)
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

const cachorro = new Cachorro()
console.log(cachorro)
```

### Com seus projetos e arquivos em mãos, criei seu arquivo gulpfile.js e comece a programar:

```js
const gulp = require('gulp');
const {series, parallel} = gulp;

const concat = require('gulp-concat'); //unir codigos de arquivos
const uglify = require('gulp-uglify'); // compacta o codigo
const babel = require('gulp-babel'); // torna o mais compativel possivel


function task1(cb){
	/*definindo arquivos a serem selecionados
	colocando caminho relativo, o "*.js" refere a todos
	os arquvios com extensão js dentro da referida pasta */
	gulp.src("./*.js")
		.pipe(babel({
			comments: false, //exlui comentarios
			presets: ["env"] //pega o formato mais novo do js
		}))
		.pipe(uglify()) //minifica o codigo (deixa ele mais compacto possivel)
		.pipe(concat("codigofinal.min.js")) //gera um arquivo final com todos os outros 
		.pipe(gulp.dest("build")); //destino do arquivo
	return cb();
}


module.exports.default = series(task1);
```

Ao final, será criada uma pasta chamada build, com o arquivo final com o codigo limpo, compactado e compativel
### ARQUIVO FINAL
```js
"use strict";var _get=function t(e,o,r){null===e&&(e=Function.prototype); ...
```

# NOTA
#### Há diversas bibliotecas para o gulp, abaixo algumas importantes.

### Gulp-htmlmin e Gulp-uglifycss
#### Da mesma forma que tem como compactar o javascript em um arquivo e linha, o htmlmin e uglifycss, compactam o html e css respectivamente.

### Gulp-Watch e Gulp-Webserver
#### Este modulo (Gulp-Webserver) permite a criacao de um servidor de desenvolvimento e o Gulp-Watch permite monitorar os arquivos a cada mudança, ou seja, a cada mudança ele executara os procedimentos de minificar, mover arquivos, subir para o um repositorio, etc.



### REFERÊNCIAS


https://www.udemy.com/course/curso-web<br>
https://gulpjs.com/
