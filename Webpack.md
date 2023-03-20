# WebPack

## INDICE 
- **[Introdução](#introducao)**
- **[Setup Inicial](#setup-inicial)**
- **[Padrão de Projeto Gulp](#padrão-de-projeto-gulp)**
- **[Nota](#nota)**



# INTRODUCAO


### WebPack é semelhante ao gulp, pois ambos são voltados na automatização do build do projeto, porém sua diferença é na organização em que o gulp utiliza de tasks que chamam outras e o WebPack que se baseia em módulos. O sitema comum de módulos, é o module.export, require, etc, onde o Node se baseia, já o WebPack se baseia no sistema com export e import que veio com o ECMA Script 2015, 



# SETUP INICIAL
Inicie seu projeto no e coloque em seu package.json as seguintes dependencias e instale logo em seguida
```json
"scripts": {
    "start" : "webpack",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
"dependencies": {
    "webpack": "4.8.1",
    "webpack-cli": "2.1.3",
  }
```

Após isso, instale as dependencias


# PRIMEIRO PROJETO
                                        
#### Para este exemplo criaremos uma classe exemplo, e a executaremos usando webpack


### Pasta src

#### Criando e exportando classe exemplo
#### ------------ Arquivo dog.js ------------
```js
/*utilizando export default,
possibilitamos o acesso externo da classe
*/
export default class Cachorro{ 
	falar(){
		return "Au! Au!"
	}
} 
```

#### ------------ Arquivo principal.js ------------
```js
import DOG from './dog' //importando classe

const cachorro = new DOG; //instanciando

console.log(cachorro.falar()) //executando
```

### Pasta Inicial

#### configurando WebPack

#### ------------ Arquivo webpack.config.js ------------
```js
const webpack = require("webpack"); //importando

module.exports = { // setando modo e arquivo main
	mode: "development", //caso set para production, o codigo resultando será minificado
	entry: "./src/principal.js"
}
```


### Executando WebPack
#### Após criar os arquivos e configurar o webpack basta executa-lo,através do comando:

```terminal
npm start
```
#### Feito isso, será gerado um arquivo dentro da pasta dist com nome "main.js", onde conterá todo o código, podendo ser interpretado pelo browser, caso queira. Texte executar o arquivo main.js:

```terminal
npm start && node dist/main.js

SAIDA

Au! Au!
```


### Outras configurações opcionais
#### É possível configurar o nome e para onde o arquivo gerado vai ir:
#### ------------ Arquivo webpack.config.js ------------
```js
const webpack = require("webpack"); //importando

module.exports = {
	mode: "development", 
	entry: "./src/principal.js",
	output: {
		filename: "arquivoGerado.js", //modifique o nome do seu arquivo de saida
		path : __dirname + "/destino" //use __dirname, para setar o caminho da pasta atual, e adicione a pasta desejada
	}
}
```


# IMPORTANDO CSS
#### No webpack para que ele reconheça arquivos de extensão css, ele utiliza modulos e plugins que auxiliam nessa leitura ou parse. Abaixo as dependêcias utilizadas:
#### mini-css-extract-plugin -> gerar um arquivo de estilo final<br>style-loader -> Em vez de gerar um arquivo .css, ele insere o css atraves de uma DOM, dentro do arquivo main.js<br>css-loader -> responsável por ler e interpretar urls e imports.

```json
"dependencies": {
    "webpack": "4.8.1",
    "mini-css-extract-plugin" : "0.4.0",
    "css-loader" : "0.28.11",
    "style-loader" : "0.21.0",
    "webpack-cli": "2.1.3"
  }
```

#### ------------ Arquivo webpack.config.js ------------
```js
const webpack = require("webpack"); 

module.exports = { 
	mode: "development", 
	entry: "./src/principal.js",
	
}
```

### Para este exemplo crie um arquivo .css de exemplo


#### ------------ Arquivo teste.css ------------
```css
body{
background-color : #BAD;
}
```

#### ------------ Arquivo principal.js ------------
```js
import DOG from './dog' //importando classe
import "./teste.css"
const cachorro = new DOG; //instanciando

console.log(cachorro.falar()) //executando
```