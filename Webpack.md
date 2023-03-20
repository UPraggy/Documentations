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
