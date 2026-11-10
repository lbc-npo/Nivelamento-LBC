# 🧬 Nivelamento - Laboratório de Biologia Computacional (LBC)

Este repositório contém os materiais das aulas e treinamentos semanais realizados pelos membros e professor do LBC.

## Objetivo
O programa de nivelamento tem como objetivo dar suporte aos novos ingressantes, alinhar conceitos fundamentais e preencher possíveis lacunas técnicas entre os integrantes do laboratório.

## Cronograma
As aulas ocorrem semanalmente, preferencialmente às **segundas-feiras**, sendo ministradas por um membro do laboratório mais habituado ao tema. 

| Data | Tema | Responsável | Material / Link |
| :--- | :---: | :---: | :---: |
| 28/10/26 | Linux e Conda | [Ana Paula](https://github.com/anapfreits) | [Acessar](1_linux_conda) |
| 04/11/26 | Git e GitHub | [Polyana Silva](https://github.com/polyanasilva) | [Acessar](2_git_github) |
| 09/11/26 | Download de dados públicos | [Diego Pereira](https://github.com/armsdidi) | *Em andamento* |
| 16/11/26 | Pré-processamento RNA-seq | [Valéria Santos](https://github.com/vcristianne) | *Em andamento* |
| 23/11/26 | Nextflow | [Fabiano Moreira](https://github.com/MoreiraFC) | *Em andamento* |
| 30/11/26 | Manipulação de dados em R | [Sérgio Ramos](https://github.com/sergioramos1202) | *Em andamento* |
| 07/12/26 | Análise de Variante no R | [Rubem Silva](https://github.com/rubiscoz) | *Em andamento* |
| 14/12/26 | Expressão Diferencial em R | [Kauê Sant'ana](https://github.com/) | *Em andamento* |
| 21/12/26 | Análise de Microbioma | [Diego Pereira](https://github.com/armsdidi) | *Em andamento* |

## Como adicionar um novo material ao repositório

Um breve tutorial para os integrantes do laboratório que colocarão seu material nesse repositório. O primeiro passo é clonar o repositório para o seu computador. Para isso, abra o terminal e execute:

```bash
git clone https://github.com/lbc-npo/Nivelamento-LBC.git
cd Nivelamento-LBC/
``` 

🔑 Permissões de colaboração: Para conseguir enviar alterações direto para o repositório, você precisa ser adicionado como colaborador. Sem isso, você consegue clonar e ver, mas não dar push. (Todos os membros que ministrarão as aulas já foram adicionados como colaboradores)

Depois de clonar, o fluxo saudável é trabalhar em uma branch separada, não direto na main:

```bash
git switch -c first-lesson   # cria e entra numa branch nova

mkdir 1_linux_conda          # cria uma pasta para colocar sua aula
# dentro dessa pasta você adiciona o material da sua aula (arquivos .md, .html, ...)

# agora é só adicionar suas alterações ao git
git add .
git commit -m "add first lesson"
git push -u origin first-lesson   # sobe a sua branch pro GitHub
```
Obs: first-lesson, 1_linux_conda são apenas exemplos de nome de branch e nome de pasta, adapte a sua aula

🔀 E aí, como junta com a main?

Depois de subir a sua branch, você consegue abrir um Pull Request (PR) no repositório no GitHub. O PR é justamente a proposta de mesclar sua linha do tempo na main (aqui outras pessoas conseguem revisar, comentar e, se estiver tudo certo, aprovar o merge). Depois de aprovado, pronto, sua aula já está no repositório do nivelamente 🎉

---
*Laboratório de Biologia Computacional (LBC)*