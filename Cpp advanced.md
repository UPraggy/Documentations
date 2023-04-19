# Java

## INDICE 

- **[Introdução](#introdução)**


- **[Recursão Exemplo](#recursão-exemplo---fatorial)**
- **[Pilha](#pilha)**
- **[Fila](#fila)**
- **[Lista](#lista)**
- **[Struct](#struct)**
- **[Ponteiros](#ponteiros)**
- **[Alocação Dinâmica](#alocação-dinamica)**
- **[Vector](#vector)**
- **[Struct Avançado e Bilbiotecas Externas](#struct-avançado-e-bilbiotecas-externas)**
- **[New e Delete](#new-e-delete)**
- **[Classe](#classe)**
- **[Virtual](#virtual)**
- **[Virtual](#virtual)**
- **[Herança de Classe](#herança-de-classe)**
- **[Tratamento de Erro (try e Catch)](#tratamento-de-erro---try-e-catch)**
- **[For Range](#for-range)**
- **[Auto](#auto)**
- **[Funções Lambda](#funções-lambda)**
- **[Map](#map)**
- **[Ponteiro Inteligente](#ponteiro-inteligente)**























# RECURSÃO EXEMPLO - FATORIAL 

```cpp
#include <iostream>

using namespace std;

int fatorial(int n);

int main()
{
    int num;
    cout <<  "Insira o numero que deseja calcular o fatorial: ";
    cin >> num;
    cout << fatorial(num);
    

    return 0;
}

int fatorial(int n){
    int actual_number;
    if (n > 0){
        actual_number = n * fatorial(n-1);
        return actual_number;
    }
    return 1;
}

void fibonachi(int n){
    
    int num1=1, num2=1, result;
    if (n > 0){
        if (n > 2){
            n = n-2;
            cout << "0 1 1 ";
            for (int x = 0; x < n; x++){
                result = num1 + num2;
                num1 = num2;
                num2 = result;
                cout << result << " ";
            }
        }
        else if (n == 2){
            cout << "0 1 1";
        }
        else{
           cout << "0 1"; 
        }
        
    }else{
        cout << 0;
    }
}
```

# PILHA 

### PRIMEIRO A ENTRAR ULTIMO A SAIR - FILO

#### utilize a biblioteca stack. <br>Exemplo:

```cpp
#include <iostream>
#include <stack>

using namespace std;
int main()
{
    stack <string> animals;

    // INSERINDO NA PILHA
    animals.push("lion");
    animals.push("horse");
    // IMPRIMINDO O ITEM NO TOPO
    cout << "Top Item: " << animals.top() << "\n";
    // IMPRIMINDO O TAMANHO
    cout << "stack size: " << animals.size() << "\n";
    // RETIRANDO DA PILHA
    animals.pop();
    animals.pop();
    // PILHA VAZIA?
    cout << "stack empty? " << animals.empty() << "\n";
    return 0;
}
```

# FILA 

### PRIMEIRO A ENTRAR PRIMEIRO A SAIR - FIFO
#### Utilize a biblioteca queue.<br>Exemplo:



```cpp
#include <iostream>
#include <queue>

using namespace std;
int main()
{
    queue <string> animals;

    // INSERINDO NA FILA
    animals.push("lion");
    animals.push("horse");
    // IMPRIMINDO O ITEMS NA FRENTE E ATRAS
    cout << "item que está na frente da fila: " << animals.front() << "\n";
    cout << "item que está atrás da fila (ultimo): " << animals.back() << "\n";
    // IMPRIMINDO O TAMANHO
    cout << "stack size: " << animals.size() << "\n";
    // RETIRANDO DA FILA
    animals.pop();
    animals.pop();
    // FILA VAZIA?
    cout << "stack empty? " << animals.empty() << "\n";
    return 0;
}

```




# LISTA 

### NÃO TRABALHA COM ORDEM COMO OS ACIMA
#### Utilize a biblioteca list.<br>Exemplo:


```cpp
#include <iostream>
#include <list>

using namespace std;
int main(){
    list <int> components, lista2; // list <int> components(50); forma de definir tamanho

    list<int>::iterator it; // usado para auxiliar a localização dos elementos em uma lista
    
    /* INSERINDO NA LISTA
    components.push_front(atributo); insere do fim da lista até o inicio
    components.push_back(atributo); insere do inicio da lista até o fim*/
    components.push_front(0);
    components.push_front(1);
    components.push_front(2);
    components.push_front(3);
    components.push_front(4);
    // lista = [4,3,2,1,0]
    
    it = components.begin(); // posicionando iterator no inicio da lista
    advance(it, 3); // iterator aponta agora para 3 posições a frente na lista

    components.insert(it,100); // .insert(posição/iterator, componente a ser inserido)
    // lista = [4,3,2,100,1,0]

    // IMPRIMINDO O TAMANHO
    cout << "list size: " << components.size() << "\n";
    
    // ORDENANDO LISTA
    components.sort(); //ordena componentes de forma crescente/ascendente
    components.reverse(); //ordena componentes de forma decrescente/descendente

    // RETIRANDO DA LISTA
    components.pop_front(); //retira o elemento a frente (ultimo elemento) .pop_back() faz ao contrario
    //components.erase(it) remove o elemento da lista uma posição depois da informada no iterator
    components.erase(--it); //decrementar um do iterator ajusta o problema do erase apagar uma posição depois da desejada

    //ESVAZIAR LISTA
    components.clear();

    //JUNTANDO LISTAS
    lista2.push_front(3);
    lista2.push_front(4);
    components.merge(lista2); // Insere os elementos da lista dois ao final da lista components
    return 0;
}
```





# STRUCT


#### Structs são usados normalmente para definir uma estrutura, ou seja, um conjunto que agrupa varias caracteristicas, que podem ser funções e atributos (variaveis)

```cpp
#include <iostream>
#include <string> //biblioteca para strings

using namespace std;

struct Estrutura{ //Priorizar pela inicial maiuscula ao criar o struct
    string nome; //definimos os atributos da estrutura
    string cor;
    int quantidade;
    
    Estrutura(){ // Usado para inicializar os atributos (necessario para a função Estruct(atributos))
        this->nome = "";
        this->cor = "";
        this->quantidade = 0;
    }
    
    Estrutura(string nome,string cor, int quantidade){ // Usado para criar uma nova estrutura com ponteiro 
        this->nome = nome;
        this->cor = cor;
        this->quantidade = quantidade;
    }

    void mostra_atributos(){
        //this se refere a "esse", ou seja,  a estrutura que está chamando a função
        cout << "\nNome " << this->nome << " cor " << this->cor << " quantidade " << this->quantidade;
    }
};

int main(){

    //declarando a estrutura (inicializando)

    Estrutura est1;
    Estrutura *est2; //estrutura com ponteiro (proximo topico)
    /*
    criando um array de estruturas
    Estrutura *ests = new ests[5]; foram criadas 5 estruturas
    */

    est1.nome = "estrutura primeira";
    est1.cor = "vermelho";
    est1.quantidade = 1;

    est2 = new Estrutura("estrutura segunda","azul",1); //criação de estrutura ideal para ponteiros // EXEMPLO NO CAPITULO DE BIBLIOTECAS .HPP

    cout << "Nome " << est1.nome << " cor " << est1.cor << " quantidade " << est1.quantidade;

    est2->mostra_atributos();

    return 0;
}
```









# PONTEIROS 





#### Ponteiros são usados para apontar/referenciar uma variavel, seu funcionamento é semelhante a uma ponte, em que se pode acessar o valor da variavel em que ele está apontado, de acordo com o endereço armazenado, amplamente usado, e normalmente usado em arrays e listas, possibilitando seu crescimento Ele também é usado em funções, dado a necessidade de alterar o valor de variaveis sem a necessidade de retorno na função.

```cpp

#include <iostream>
#include <string> //biblioteca para strings

using namespace std;

int main(){

    // declarando ponteiro e variavel a ser apontada
    string movel = "sofá";

    string *ponteiro = nullptr; // declaração do ponteiro, não esquecer o '*' que simboliza o ponteiro
    // Obs.: o ponteiro precisa ser do mesmo tipo da variavel apontada.

    ponteiro = &movel; // armazenando o endereço da variavel a ser apontada


    cout << ponteiro; // imprime a posição armazenada

    cout << *ponteiro; // imprime o valor dentro do endereço, ou seja, o valor da variavel movel


    *ponteiro = "Novo valor"; // Alterando o valor da variavel 'movel' atraves do ponteiro

    cout << movel; // Imprime "Novo Valor"

    //------------------------------- PONTEIRO COM VETOR --------------------------------------


    int *p = nullptr;
    int vetor[5] = {1,2,3,4,5};
    p = vetor; // a variavel vetor já é a posição do vetor, para valores é usado vetor[indice] para acessa-los

    // Imprimindo valores através do ponteiro
    //sizeof pega o tamanho do vetor em bytes, e para descobrir a quantidade de elementos basta dividir pelo tipo do vetor
    for (int i = 0; i < (sizeof(vetor)/sizeof(int)); i++){ 
        cout << *(p+i); 
        //essa notação se chama 'ponteiro deslocamento', como é um vetor, as posições estão 
        //em ordem, uma após a outra na memoria, então ao somar uma unidade, é possivel ir acessando os indices
    }


    //------------------------------- PONTEIRO DE PONTEIRO --------------------------------------

    int **p_p = nullptr;

    **p_p = &p;

    cout << "\nENDEREÇO DO PONTEIRO p: " << (p_p) << endl;

    cout << "\nVALOR DO PONTEIRO p: " << (*p_p) << endl;

    cout << "\nVALOR GUARDADO NO PONTEIRO p: " << (**p_p) << endl;

    return 0;
}

```






# Alocação dinamica





#### Neste topico será usado o rescurso, malloc, que é usado para alocar memoria para determinada variavel, a seguir um exemplo util usando vetores. <br>Obs.: Vale resaltar que por mais que o vetor funcione sem malloc:<br>1 - a quantidade de elementos é menor doque ele suporta _ ele ou vai ocupar espaços de memoria a menos, por exemplo, um vetor char de 10 espaços, armazena a palavra 'maçã', 6 espaços vão ficar em branco, ou seja, não serão usados, tornando o programa lento, caso isso seja repetido diversas vezes.<br>2- a quantidade de elementos é maio doque ele suporta _ ele ou vai ocupar espaços de memoria a menos, logo, ocupará espaços que não foram 'endereçados ou reservados' á aquele vetor, que consequentemente pode sobrepor os valores de uma outra variavel, dando pane no programa. 

```cpp
#include <iostream>
#include <stdio.h> //gets
#include <stdlib.h> //malloc

using namespace std;

int main(){

    char *vetor;

    vetor = (char *) malloc(sizeof(char)+1); //alocando espaço

    gets(vetor); //gets serve para receber toda a string digitada, o 'cin' não aceita espaços

    cout << vetor;
}

```





# VECTOR 

#### Semelhante ao list, porém seu custo de processamento, além da facilidade de localizar valores, superam o list, sendo recomendado seu uso, a não ser que tenha um motivo para usar list ou array vector != vetor



```cpp
#include <iostream>
#include <vector>

using namespace std;
int main(){
    vector<int> components;
    int tamanho;


    /* INSERINDO NA LISTA
    components.push_front(atributo); insere do fim da vector até o inicio
    components.push_back(atributo); insere do inicio da vector até o fim*/
    components.push_back(0);
    components.push_back(1);
    components.push_back(2);
    components.push_back(3);
    components.push_back(4);
    // vector = [0,1,2,3,4]

    // Atualizando valores
    components[1] = 100;
    // vector = [0,100,2,3,4]

    tamanho = components.size(); // pegando tamanho do vector

    components.insert(components.begin()+4,5); // vector = [0,100,2,3,5]
    // .insert(inicio do vector + posição, componente a ser inserido) | não é necessario advance ou iterator
    // a soma do valor com o vector.begin() já é o 'advance'

    // IMPRIMINDO OS VALORES
    for (int x=0; x < tamanho; x++){
        cout << components[x] << " ";
    }

    //components.erase(it) remove o elemento da vector uma posição depois da informada no iterator
    components.erase(components.begin()+2); // vector = [0,100,3,5] | lembre-se de atualizar a variavel 'tamanho'
    //pois ao imprimir sem atualizar irá acessar uma posição invalida

    //ESVAZIAR vector
    components.clear(); //lembre-se de atualizar a variavel 'tamanho'

    return 0;
}
```











# STRUCT AVANÇADO E BILBIOTECAS EXTERNAS 


#### Neste topico, será descrito formas de como criar sua propria biblioteca, além de utilizar structs <br>Obs.: neste tópico terá marcações indicando arquivos diferentes.



### ARQUIVO PONTO2D.hpp

#### Arquivos .hpp normalmente servem para armanezar structs e classes

#### ifndef (significado -> se não definido) serve para que não haja duplicidade, ao definir a biblioteca em mais de um arquivo, assim que inserido ele entende que a "variavel" já foi definida, então ele não lê oque está dentro dele. Caso não fique claro: https://www.youtube.com/watch?v=wRq8pxJEpfc


```cpp
#ifndef PONTO2D_H
/*
Neste exemplo foi definido a variavel PONTO2D_H (seguindo o nome do arquivo), necessario para 
que o ifndef entenda a execução
*/
#define PONTO2D_H
#include <iostream>
struct Ponto2D{
    double x,y;

    Ponto2D(){
        this->x = 0;
        this->y = 0;
    }
    /* com a relação de arquivos de biblioteca é possivel simplificar a declaração de funções
    de forma a ter uma visão mais limpa dos atributos do struct ou classe, as funções podem 
    ser definidas apenas colocando sua entradas e nome (o codigo que a função executa será
    colocado no outro arquivo)*/
    Ponto2D(double x, double y); 
    double calcular_distancia(Ponto2D* ponto);
};
#endif // PONTO2D_H
```

### ARQUIVO PONTO2D.cpp

#### Arquivos .cpp com o mesmo nome do .hpp servem para armanezar funções daquela biblioteca, Como neste exemplo, em que as funções Ponto2D e calcular_distancia referente ao struct Ponto2D, foram definidas neste arquivo. <br>Não esqueça de incluir a biblioteca .hpp



```cpp
#include "Ponto2D.hpp"
#include <cmath> // biblioteca para operações matematicas
// Coloque o nome do struct::Função, para referenciar a função declarada no arquivo .hpp
Ponto2D::Ponto2D(double x, double y){
    this->x = x;
    this->y = y;
}

double Ponto2D::calcular_distancia(Ponto2D* ponto){
        // sqrt -> raiz | quadrada por padrão
        return sqrt(((this->x - ponto->x)*(this->x - ponto->x)) +  ((ponto->y - this->y)*(ponto->y - this->y)));
}
```



### ARQUIVO main.cpp

```cpp
#include <iostream>

#include "Ponto2D.cpp" //em alguns programas em que não identifica a biblioteca
//tente colocar Ponto2D.cpp funciona, porém é prefirivel colocar .hpp

using namespace std;

int main() {

    Ponto2D _ponto1, _ponto2;
    _ponto1 = Ponto2D(0.0, 0.0);
    _ponto2 = Ponto2D(0.0, 3.0);

    cout << _ponto1.calcular_distancia(&_ponto2);

    return 0;
}
```







# NEW E DELETE 


#### De forma resumida o operador 'new' 'estancia' uma classe,struct... de forma a permanecer na memoria, pois sempre que uma variavel deixa a função, ela é automaticamente excluida da memoria (STACK OU PILHA), já com o 'new' ela é forçada a ficar na memoria, o nome dessa memoria é HEAP. O HEAP é onde apenas o programador controla a entrada e saida de variaveis. E o stack ou pilha é o programa que administra a saida e entrada


```cpp
#include <iostream>

using namespace std;


struct Exemplo{
    string nome;

    Exemplo(){
        this->nome = "";
    }
    void imprime_nome(){
        cout << this->nome  << "\n" << "Posicao na memoria " << this << "\n" << endl;
    }
};

Exemplo* funcao_sem_new(){
    Exemplo variavel_volatil;
    variavel_volatil.nome = "Variavel sem New";
    cout << "Dentro da Funcao\n";
    variavel_volatil.imprime_nome();
    return &variavel_volatil;

}

Exemplo* funcao_com_new(){
    Exemplo *variavel_com_new = new Exemplo();
    variavel_com_new->nome = "Variavel com New";
    cout << "Dentro da Funcao\n";
    variavel_com_new->imprime_nome();
    return variavel_com_new;
}

int main(){
    Exemplo *v1, *v2;

    v1 = funcao_com_new(); // retorna uma posição de memoria com o struct
    cout << "Fora da Funcao\n";
    v1->imprime_nome();
    /* Imprime a variavel apontada, pois ela permanece na memoria, que independe de
    uma função, a variavel ao ser criada com o new permanece na memoria chamada HEAP até que o programa acabe
    ou até que o programador a delete*/



    cout << "\n-----------variavel SEM NEW -----------\n";

    v2 = funcao_sem_new(); // retorna nada
    cout << "Fora da Funcao\n";
    cout << v2;
    /* Não imprime em vez disso dá erro:
    ERRO -> warning: address of local variable 'variavel_volatil' returned [-Wreturn-local-addr]

    Isso acontece pois ao sair da função, a posição de memoria apontada é limpa e
    a variavel deixa a memoria*/




    //DELETANDO VARIAVEL CRIADA COM 'NEW'
    delete v1; // PARA DELETAR, APENAS DELETE A POSIÇÃO DE MEMORIA

    /*Obs.: Sempre que puder, delete a variavel, caso não vá mais usa-la,
    pois ela terá um custo de processamento desnecessario caso não a utilize*/
    return 0;
}
```






# CLASSE 


#### Classe é basicamente uma struct turbinada, ela oferece mais opções e segurança 


### ARQUIVO PONTO2D.hpp

#### Arquivos .hpp normalmente servem para armanezar structs e classes

```cpp
#ifndef PONTO2D_H
#define PONTO2D_H
#include <iostream>
class Ponto2D{
    /*Todos atributos ou funções neste arquivo, estarão disponiveis, para acesso
    apenas por funções dentro da classe */
    private: 
        double x,y;

        Ponto2D(){
            this->x = 0;
            this->y = 0;
        }

    /*Todos atributos ou funções neste arquivo, estarão disponiveis, 
    para acesso fora da classe */
    public:
        Ponto2D(double x, double y); 
        double calcular_distancia(Ponto2D* ponto);


    /* Ainda há tambem o 'protected', ele funciona como o private, porém ele pode ser acessado por outras classes ao
    herdar a classe principal*/
};
#endif // PONTO2D_H
```

### ARQUIVO PONTO2D.cpp


```cpp
#include "Ponto2D.hpp"
#include <cmath> 
Ponto2D::Ponto2D(double x, double y){
    this->x = x;
    this->y = y;
}

double Ponto2D::calcular_distancia(Ponto2D* ponto){
        return sqrt(((this->x - ponto->x)*(this->x - ponto->x)) +  ((ponto->y - this->y)*(ponto->y - this->y)));
}
```


### ARQUIVO main.cpp

```cpp
#include <iostream>

#include "Ponto2D.cpp" //em alguns programas em que não identifica a biblioteca
//tente colocar Ponto2D.cpp funciona, porém é prefirivel colocar .hpp

using namespace std;

int main() {

    Ponto2D *_ponto1 = new Ponto2D(); // como especificação é necessário criar a variavel como ponteiro
    Ponto2D *_ponto2 = new Ponto2D();
    _ponto1 = Ponto2D(0.0, 0.0);
    _ponto2 = Ponto2D(0.0, 3.0);

    cout << _ponto1.calcular_distancia(&_ponto2);

    return 0;
}
```





# HERANÇA DE CLASSE 

```cpp
#include <iostream>

using namespace std;

class Animais{
    protected: /* Usando 'protected' para possibilitar acesso aos atributos, pelas classes que vão herda-la */
        string nome, tipo, especie;

        Animais(){
            this->nome = ' ';
            this->tipo = ' ';
            this->especie = ' ';
        }

    public:
        Animais(string nome, string tipo,string especie);
};

Animais::Animais(string nome, string tipo,string especie){
    this->nome = nome;
    this->tipo = tipo;
    this->especie = especie;

}


class Gato:public Animais{ /* Para mais de uma herança, basta colocar virgula EX.: class Gato:public Animais, public SeresVivos*/
    private:
        string cor;
        int idade;
    Gato(){
            this->cor = ' ';
            this->idade = 0;
            tipo = "mamifero";
            especie = "felino";
        }

    public:
        Gato(string nome, string cor, int idade);
        void imprime_gato();
};

Gato::Gato(string nome, string cor, int idade){
    this->cor = cor;
    this->idade = idade;
    this->nome = nome;
    this->tipo = "mamifero";
    this->especie = "gato";
}


void Gato::imprime_gato(){
    cout << "Nome: " << nome << "\nTipo: " << tipo << "\nEspecie: " << especie << "\nCor: " << cor << "\nIdade: " << idade << " Anos";
}


int main() {

    Gato *gato1 = new Gato("Rogerio","preta",12);

    gato1->imprime_gato();

    return 0;
}
```







# VIRTUAL 


```cpp
#include <iostream>

using namespace std;


class Base{
  public:
  virtual void imprime();
  void imprime2();
};

void Base::imprime(){
    cout << "classe Base" << endl;
}
void Base::imprime2(){
    cout << "classe Base" << endl;
}

class Nova_Classe:public Base
{
  public:
  void imprime();
  void imprime2();

  ~Nova_Classe();
};

void Nova_Classe::imprime(){
    cout << "classe Nova_Classe" << endl;
}
void Nova_Classe::imprime2(){
    cout << "classe Nova_Classe" << endl;
}

int main(){
    Base* base = new Nova_Classe();
    base->imprime();  //chama a função f na classe Foo
    base->imprime2();


    return 0;
}
```







# TRATAMENTO DE ERRO - TRY e CATCH 


#### Geralmente usado para pegar erros já conhecidos e trata-los da melhor forma*/

```cpp
#include <iostream>
#include <vector>
#include <stdexcept> // biblioteca para o try e catch
using namespace std;

int main() {
    vector<int> num(3);
    int numerador = 5;

    try{
        if (numerador > 4){
        throw "ERRO: numerador maior que 4\n"; // usado para retornar um 'erro'/exceção personalizada
        }
    }catch(const char* e){
        cout << e;
    }

    cout << "\nOUTRO TRY CATCH\n";

    try{
        num.at(3) = 10;
        cout << num[3]; // Caso dê erro, o programa para de executar tudo dentro do try, e redireciona para o catch
    }catch(exception& e){
        cout << "Erro: " << e.what();
    }


    return 0;
}
```







# FOR RANGE 

#### FOR PERSONALIZADO, de forma a não precisar de muito codigo para iterar 

```cpp
#include <iostream>
#include <vector>
using namespace std;


int main() {
    vector<int> num;

    for(int x=0; x < 9; x++){
            num.push_back(x);
    }
     for(int x=0; x < 9; x++){ //FOR NORMAL
            cout << num[x] << " ";
    }
    cout << "\n\n";
    for (int i:num){ //FOR RANGE
         cout << i << " ";
    }
    return 0;
}

```






# AUTO 

```cpp
#include <iostream>
using namespace std;


int main() {

    int num = 10;
    float num2 = 5.5;
    auto var = num; 
    /*o tipo auto pode tanto receber num como num2, pois ele 
    não tem um tipo definido, ele pode receber qualquer tipo de variavel,
    porém ao receber e ser inicializado com esse tipo, não há como 
    modifica-lo depois
    */
    cout << var << endl;

    return 0;
}
```




# TEMPLATE 

#### Quando uma funcao nao tem um tipo definido de entrada, declarar um template e a melhor forma de ser feito, podendo ser mais eficaz doque o 'auto' 

```cpp
#include <iostream>
#include <cstring>
using namespace std;


template <class TodosTipos>

void print(TodosTipos msg){
    cout << msg << endl;
}

template <class OutroTipo> /* Aparentemente para e preciso declarar novamente para usar em outra funcao */

OutroTipo soma(OutroTipo param1, OutroTipo param2){
        return param1 + param2;
}

int main(){
    
    print("hello");
    print('h');
    print(true);
    print(5);
    print(10.0);
    
    print(soma<int>(8,10)); /* E possivel definir o tipo de retorno*/
    print(soma<int>(20.5,2.3));
    print(soma<string>("Hello ","World!"));




    return 0;
}
```




# FUNÇÕES LAMBDA 


#### Funções mais simples de declarar, funciona no c++ 11 ou superior.<br>Estrutura:

``` [ area de captura ](parametros){funcao a ser escrita}; ```


```cpp
#include <iostream>
using namespace std;

int main() {

    /* A estrutura comum é usar:
    auto nome_funcao=[]()->tipo_de_retorno{};*/

    auto media_de_3=[](float x, float y, float z)->float{
        return ((x+y+z)/3);
    };
    cout << "----Funcao media_de_3----\n      " << media_de_3(3,1.5,3) << endl;

    //-------------------------------------------------------------------------------------------------

    
    int var1 = 5, var2 = 9, var3 = 20;

    auto media=[var1,var2]()->int{ // Dessa forma ele pegara, as variaveis especificadas, a partir do escopo
        return (var1+var2)/2;
    };
    cout << "----Funcao media----\n      " << media() << endl;


    //-------------------------------------------------------------------------------------------------

    
    auto media_x=[=]()->int{ // Utilizando o igual, o programa pegará todas as variaveis do escopo
        return (var1+var2+var3)/3;
    };
    cout << "----Funcao media_x----\n      " << media_x() << endl;


    //-------------------------------------------------------------------------------------------------

    

    auto soma=[=](int x, int y)->int{ // É possivel utilizar ambos
        return (var1+var2+var3+x+y);
    };
    cout << "----Funcao soma----\n      " << soma(100,112) << endl;

    return 0;
}

```





# MAP 



```cpp
#include <iostream>
#include <map> //biblioteca para o map
using namespace std;

int main() {

    //map<tipo,tipo> os tipos podem variar
    map<int,string> animais;

    animais[0] = "cavalo"; //map[chave_do_tipo_declarado] = valor;
    animais[1] = "gato";
    animais[2] = "cachorro";
    animais[35] = "avestruz"; /*Não importa o indice, porém é recomendavel não colocar, sem uma ordem,
    pois pode provocar erro*/
    for(auto i:animais){
        cout << i.first << "->" << i.second << " // "; // first imprime chave, second imprime valor
    }
    cout << "\n\n\n-------PROVOCANDO ERRO----------\n\n";
    for(int i=0; i<=35; i++){ //
        cout << animais[i] << " ";
        /* ao tentar imprimir dessa forma, ao chamar map[posicao]
        e possivel acessar uma posicao que nao existe que por consequencia, cria essa chave,
        uma boa ordenacao, pode corrigir/previnir esse erro*/
    }
    cout << "\n\n\n-------MOSTRANDO ERRO----------\n\n";

    for(auto i:animais){ //erro provocado por colocar um indice alto
        cout << i.first << "->" << i.second << " // ";
    }

    cout << "\n\n\n-------APAGANDO CHAVES----------\n\n";
    //APAGANDO CHAVES
    for(int i=3; i<=35; i++){
        animais.erase(i);
    }

    for(auto i:animais){
        cout << i.first << "->" << i.second << " // ";
    }
    
    //para apagar todo o map, use o map.clear()
    animais.clear();

    return 0;
}
```



# PONTEIRO INTELIGENTE 


#### Tipo de ponteiro, que ao sair do escopo ele é retirado do heap automaticamente 

```cpp
#include <iostream>
#include <memory>

using namespace std;

class Animais{
    protected:
        string nome;
    public:
        Animais(){
            this->nome = ' ';
        }
        ~Animais(){ // destrutor, ele é chamado quando a classe e removida do Heap
            cout << "removido da memoria\n";
        }
        Animais(string nome);
        void print();
};

Animais::Animais(string nome){
    this->nome = nome;
}

void Animais::print(){
    cout << this->nome << endl;
}

int main(){


    {
    unique_ptr<Animais> ptr_unq1(new Animais("Gato"));
    unique_ptr<Animais> ptr_unq2;

    ptr_unq1->print();

    /*ptr_unq2 = ptr_unq1; #ERRO
    ponteiro unique não pode ser copiado ou apontado por mais de um ponteiro,
    caso tente, o retorno dara erro*/

    } // simulado "escopo de uma funcao"

    {


    shared_ptr<Animais> ptr_shr1(new Animais("Cachorro"));
    shared_ptr<Animais> ptr_shr2;

    ptr_shr1->print();

    ptr_shr2 = ptr_shr1; //shared_ptr como o nome diz, permite compartilhar o ponteiro

    ptr_shr2->print();
    }
    return 0;
}

```



# REFERENCIAS
[PLAYLIST CPP CFB](https://www.youtube.com/watch?v=nUQKr-ey86Y&list=PLx4x_zx8csUjczg1qPHavU1vw1IkBcm40)
