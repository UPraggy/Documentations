# Gulp & Babel

## INDICE 
- **[Introdução](#introducao)**
- **[Update](#update)**
- **[Remove](#remove)**
- **[Lookup](#lookup)**



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











### para visualizar mais formatado no terminal use:
``
/*---------------------------------------------REFERÊNCIAS---------------------------------------------*/


https://www.udemy.com/course/curso-web
https://gulpjs.com/
