# Objetivo

Este nivelamento tem como objetivo apresentar os principais repositórios
públicos de dados de sequenciamento e demonstrar como localizar,
consultar e obter datasets disponíveis para utilização em pesquisas
científicas. Serão abordadas três importantes plataformas de
disponibilização de dados: o **European Nucleotide Archive (ENA)**, o
**Sequence Read Archive (SRA)**, e o **Gene Expression Omnibus (GEO)**,
destacando suas características, finalidades e os diferentes tipos de
dados que podem ser encontrados em cada uma delas.

Durante o treinamento, serão demonstradas duas abordagens para obtenção
dos dados: o download por meio das interfaces gráficas dos próprios
repositórios e a utilização de ferramentas e comandos via terminal,
permitindo automatizar o processo de busca e transferência de arquivos.

# Quais tipos de dados/arquivos podemos encontrar nesses repositórios?

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Formato</th>
<th style="text-align: left;">O que contém</th>
<th style="text-align: left;">Aplicação</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><code>.fastq.gz</code></td>
<td style="text-align: left;">Reads + qualidade</td>
<td style="text-align: left;">RNA-Seq, WGS, metagenômica, 16S</td>
</tr>
<tr>
<td style="text-align: left;"><code>.fasta</code></td>
<td style="text-align: left;">Sequências de nucleotídeos</td>
<td style="text-align: left;">Referências, contigs e genomas</td>
</tr>
<tr>
<td style="text-align: left;"><code>.fna</code></td>
<td style="text-align: left;">Sequências de DNA</td>
<td style="text-align: left;">Genomas e contigs</td>
</tr>
<tr>
<td style="text-align: left;"><code>.faa</code></td>
<td style="text-align: left;">Sequências de proteínas</td>
<td style="text-align: left;">Análise proteômica e funcional</td>
</tr>
<tr>
<td style="text-align: left;"><code>.bam</code> /
<code>.cram</code></td>
<td style="text-align: left;">Reads alinhados</td>
<td style="text-align: left;">Análises de alinhamento</td>
</tr>
<tr>
<td style="text-align: left;"><code>.gff3</code></td>
<td style="text-align: left;">Anotações genômicas</td>
<td style="text-align: left;">Identificação de genes e regiões</td>
</tr>
<tr>
<td style="text-align: left;"><code>.vcf</code></td>
<td style="text-align: left;">Variantes genéticas</td>
<td style="text-align: left;">SNPs e outras variantes</td>
</tr>
<tr>
<td style="text-align: left;"><code>.embl</code></td>
<td style="text-align: left;">Sequências e anotações</td>
<td style="text-align: left;">Consulta de registros genômicos</td>
</tr>
</tbody>
</table>

**Estrutura dos arquivos FASTQ:**

O principal formato de interesse para análises bioinformáticas é o
`.fastq`, que armazena as sequências obtidas pelo sequenciamento
(*reads*) e seus respectivos valores de qualidade.

Um arquivo FASTQ possui quatro linhas por sequência:

    @SEQ_ID
    GATCTAGCTAGCTAGC
    +
    IIIIIIIIIIIIIIII

**1. Linha 1:** - identificador da sequência (read).

**2. Linha 2:** - sequência de nucleotídeos.

**3. Linha 3:** - separador (+).

**4. Linha 4:** - valores de qualidade de cada base.

Importante: em sequenciamento *paired-end*, geralmente encontramos dois
arquivos por amostra:

- `sample_R1.fastq.gz` – leituras do primeiro sentido (forward).
- `sample_R2.fastq.gz` – leituras do segundo sentido (reverse).

# European Nucleotide Archive (ENA)

O **European Nucleotide Archive (ENA)** é um repositório público de
dados de sequenciamento mantido pelo EMBL-EBI (European Bioinformatics
Institute). Disponibiliza dados de diferentes tecnologias e aplicações,
como **RNA-Seq, Whole Genome Sequencing (WGS), metagenômica shotgun e
sequenciamento de amplicons (16S rRNA)**.

## Download via interface web do ENA:

Acesso: <https://www.ebi.ac.uk/ena/browser/home>

Na página inicial do ENA, é possível localizar um Dataset/BioProject de
duas maneiras:

- Por termos de busca: digite palavras-chave relacionadas ao estudo no
  campo **“Enter text search terms”**. Por exemplo: *gastric cancer*.

- Pelo identificador do BioProject: caso já conheça o número de acesso
  do projeto, informe-o diretamente no campo **“Enter accession”**. Por
  exemplo: *PRJEB21497*.

Após localizar o BioProject desejado, acesse seus registros e selecione
as amostras que deseja baixar utilizando as caixas de seleção ao lado de
cada registro.

Em seguida, clique em *Download selected files* para acessar as opções
de download dos arquivos selecionados.

## Download via terminal/servidor:

Além do download pela interface web, o ENA permite obter arquivos de
sequenciamento diretamente pelo terminal, utilizando comandos como
`wget`.

Uma funcionalidade bastante útil é a possibilidade de selecionar várias
amostras no ENA e gerar automaticamente um **script Bash (.sh)**
contendo os comandos necessários para baixar todos os arquivos FASTQ
selecionados.

Para demonstrar o processo, utilizaremos como exemplo dados públicos de
um estudo sobre o **microbioma associado ao câncer gástrico**,
disponíveis no BioProject **PRJEB21497**. O estudo utiliza
sequenciamento do gene 16S rRNA para caracterizar comunidades
bacterianas associadas ao câncer gástrico.

A amostra **ERR2014733** será utilizada como exemplo de download.
Trata-se de dados de sequenciamento *paired-end*, disponibilizados em
dois arquivos `.fastq.gz`:

- `ERR2014733_1.fastq.gz`: reads R1.
- `ERR2014733_2.fastq.gz`: reads R2.

Assim, podemos utilizar esse estudo para demonstrar como localizar os
dados de sequenciamento no ENA e realizar o download dos arquivos
diretamente pelo terminal.

**Os comandos para realizar o download são:**

**1. Selecione as amostras:**

Utilizando as caixas de seleção ao lado de cada registro, selecione as
amostras `ERR2014733_1.fastq.gz` e `ERR2014733_2.fastq.gz`.

Em seguida, clique em *Get download script*. Essa opção irá gerar e
baixar um script com os comandos necessários para realizar o download
dos arquivos. O arquivo terá um nome semelhante a:

`ena-file-download-selected-files-20261106-1811.sh`

Abra o arquivo. Ele deverá apresentar comandos semelhantes aos
seguintes:

    wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR201/003/ERR2014733/ERR2014733_2.fastq.gz
    wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR201/003/ERR2014733/ERR2014733_1.fastq.gz

**2. Entre no seu diretório no servidor:**

Acesse o diretório onde deseja armazenar os arquivos FASTQ:

    cd /data/diego/aula_teste

Crie um script para realizar o download:

    nano download_ENA.sh

Abra o arquivo `ena-file-download-selected-files-20261106-1811.sh`,
copie o conteúdo e cole no script `download_ENA.sh`.

Salve e feche o arquivo.

**Entendendo o comando:**

- `wget`: ferramenta utilizada para baixar arquivos da internet.
- `-nc`: *no-clobber*, evita baixar novamente um arquivo que já existe
  com o mesmo nome no diretório atual.
- `ftp://...`: endereço do arquivo armazenado nos servidores do ENA.
- `.fastq.gz`: indica um arquivo FASTQ compactado no formato GZIP.

**3. Execute o script:**

Primeiro, conceda permissão de execução:

    chmod +x download_ENA.sh

Em seguida, execute:

    bash download_ENA.sh

Aguarde a conclusão do download. Os arquivos FASTQ serão armazenados no
diretório atual (`/data/diego/aula_teste`).

# Sequence Read Archive (SRA)

O **Sequence Read Archive (SRA)** é um repositório público de dados de
sequenciamento mantido pelo **National Center for Biotechnology
Information (NCBI)**, nos Estados Unidos. A plataforma armazena e
disponibiliza dados brutos de sequenciamento de diferentes tecnologias e
aplicações, incluindo **RNA-Seq, WGS, WES, metagenômica shotgun e
sequenciamento de amplicons (16S rRNA)**.

O SRA permite acessar dados de estudos publicados e projetos de pesquisa
depositados por diferentes instituições ao redor do mundo. Entre os
principais arquivos disponibilizados estão os dados brutos de
sequenciamento (*raw reads*), geralmente armazenados no formato `.sra` e
podendo ser convertidos para `.fastq` para utilização em análises
bioinformáticas.

O acesso aos dados pode ser realizado diretamente pela interface web do
NCBI ou por ferramentas via terminal, como o **SRA Toolkit**, que
permite consultar, baixar e converter arquivos de sequenciamento.

Durante esta etapa do treinamento, vamos explorar como localizar estudos
de interesse no NCBI SRA e realizar o download de datasets via terminal.

## Acesso aos dados pelo SRA Run Selector:

Uma das formas mais práticas de acessar os arquivos de sequenciamento
disponíveis no NCBI SRA é por meio da ferramenta **SRA Run Selector**.
Ela permite selecionar corridas de sequenciamento (Runs) provenientes de
um ou mais estudos, facilitando a obtenção de listas de amostras e
arquivos necessários para análises posteriores.

**Acesso:** <https://www.ncbi.nlm.nih.gov/Traces/study/>

Para acessar os dados, basta informar um identificador de acesso
(accession) correspondente ao estudo, à amostra ou ao experimento.

**Os principais identificadores utilizados são:**

- Project accession: identifica o projeto de pesquisa (ex.: SRP000002,
  PRJNA111397).

- Sample accession: identifica uma amostra biológica (ex.: SAMN00000013,
  SAMEA774460).

É possível consultar mais de um estudo simultaneamente, utilizando uma
lista de identificadores separados por vírgulas.

## Obtenção dos *Run Accessions*:

Os *Run Accessions* são identificadores únicos utilizados para localizar
e baixar os dados brutos de sequenciamento armazenados no NCBI SRA. Cada
identificador corresponde a uma corrida de sequenciamento (Run),
geralmente representada pelo prefixo `SRR`.

Para demonstrar o processo, utilizaremos como exemplo o BioProject
**PRJNA239281**, que contém dados de um estudo de sequenciamento do gene
16S rRNA em biópsias gástricas, com o objetivo de caracterizar as
comunidades bacterianas associadas ao estômago. Utilizaremos apenas duas
(2/31) corridas de sequenciamento (Runs) pertencentes a esse BioProject:

- SRR1176848

- SRR1176849

Após realizar a busca pelo estudo de interesse no SRA Run Selector, é
possível obter uma lista dos Run Accessions das amostras selecionadas.

**Para isso:**

- Selecione as corridas (Runs) que deseja utilizar.

- Localize a opção de download da lista de acessos (Accession List).

- Baixe o arquivo contendo os identificadores selecionados.

O arquivo gerado, geralmente denominado `SraAccList.txt`, contém os
identificadores das corridas, organizados um por linha.

**Exemplo do conteúdo do arquivo `SraAccList.txt`:**

    SRR1176848 
    SRR1176849 

Essa lista será utilizada posteriormente pelo SRA Toolkit para
automatizar o download de múltiplas corridas de sequenciamento, sem a
necessidade de informar cada identificador individualmente.

**Importante:** para recuperar os dados de sequenciamento por meio do
SRA Toolkit, é necessário instalar previamente essa ferramenta. Ela
permite baixar os arquivos no formato `.sra` e convertê-los para
`.fastq`, que será utilizado nas análises bioinformáticas.

## Instalando o SRA Toolkit no terminal/servidor:

O ideal é instalar o SRA Toolkit em um ambiente Conda separado, evitando
conflitos com outras ferramentas de bioinformática instaladas no
servidor.

Vamos criar um ambiente chamado `sra_env` e instalar o pacote pelo canal
`Bioconda`.

**1. Criando o ambiente Conda:**

Primeiro, acesse o terminal do servidor no seu usuário e execute:

    conda create -n sra_env -c conda-forge -c bioconda sra-tools -y

Esse comando realiza três operações:

- `conda create`: cria um novo ambiente.
- `-n sra_env`: define o nome do ambiente.
- `-c conda-forge -c bioconda`: informa os canais de instalação.
- `sra-tools`: pacote que contém o SRA Toolkit.
- `-y`: confirma automaticamente a instalação.

**2. Ativando o ambiente**

Após a criação, ative o ambiente:

    conda activate sra_env

O nome do ambiente aparecerá no início da linha do terminal:

    (sra_env) usuario@nobel:~$

**3. Verificando a instalação:**

Confira a versão instalada:

    prefetch --version
    fasterq-dump --version
    fastq-dump --version

**4. Resumo dos principais programas:**

<table>
<thead>
<tr>
<th style="text-align: left;">Programa</th>
<th style="text-align: left;">Função</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><code>prefetch</code></td>
<td style="text-align: left;">Baixa arquivos SRA do NCBI</td>
</tr>
<tr>
<td style="text-align: left;"><code>fasterq-dump</code></td>
<td style="text-align: left;">Converte arquivos SRA em FASTQ</td>
</tr>
<tr>
<td style="text-align: left;"><code>fastq-dump</code></td>
<td style="text-align: left;">Conversão de SRA para FASTQ (versão
anterior)</td>
</tr>
<tr>
<td style="text-align: left;"><code>vdb-config</code></td>
<td style="text-align: left;">Configura o SRA Toolkit</td>
</tr>
<tr>
<td style="text-align: left;"><code>vdb-validate</code></td>
<td style="text-align: left;">Verifica a integridade dos arquivos
SRA</td>
</tr>
<tr>
<td style="text-align: left;"><code>sra-stat</code></td>
<td style="text-align: left;">Exibe estatísticas dos arquivos SRA</td>
</tr>
</tbody>
</table>

Como próximo passo, vamos aprender a utilizar `prefetch` e
`fasterq-dump` para baixar um conjunto de dados do SRA e convertê-lo em
arquivos FASTQ.

## Baixando arquivos do NCBI SRA:

**1. Criando os diretórios de trabalho:**

Primeiro, crie diretórios para organizar os arquivos baixados, os FASTQ
e os arquivos temporários.

Exemplo:

    mkdir -p SRA_PROJECT/{SRA,FASTQ,TEMP}

A estrutura ficará assim:

    SRA_PROJECT/
    ├── SRA/
    ├── FASTQ/
    └── TEMP/

**2. Baixando os arquivos com prefetch:**

O programa `prefetch` é responsável por baixar os arquivos SRA
diretamente do NCBI.

Com o ambiente `sra_env` já ativado, execute:

    prefetch SRR1176848 \
        --output-directory SRA

    prefetch SRR1176849 \
        --output-directory SRA

Cada acesso será armazenado em seu próprio diretório:

    SRA/
    ├── SRR1176848/
    │   └── SRR1176848.sra
    └── SRR1176849/
        └── SRR1176849.sra

O prefetch baixa os arquivos originais no formato SRA, preservando os
dados de sequenciamento disponibilizados pelo NCBI.

**3. Verificando a integridade dos arquivos SRA:**

Após o download, podemos verificar se os arquivos foram baixados
corretamente utilizando `vdb-validate`.

    vdb-validate SRR1176848/SRR1176848.sra

    vdb-validate SRR1176849/SRR1176849.sra

Se os arquivos estiverem íntegros, o programa indicará que a validação
foi concluída com sucesso.

## Convertendo arquivos SRA para FASTQ:

**1. Utilizando fasterq-dump:**

O fasterq-dump converte os arquivos SRA em arquivos FASTQ, permitindo
que sejam utilizados em ferramentas de análise de bioinformática.

Para converter a primeira corrida:

    fasterq-dump \
        SRR1176848/SRR1176848.sra \
        --split-files \
        --threads 8 \
        --temp TEMP \
        --outdir FASTQ

Repita para a segunda corrida:

    fasterq-dump \
        SRR1176849/SRR1176849.sra \
        --split-files \
        --threads 8 \
        --temp TEMP \
        --outdir FASTQ

**2. Entendendo os parâmetros:**

<table>
<colgroup>
<col style="width: 36%" />
<col style="width: 63%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Parâmetro</th>
<th style="text-align: left;">Função</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><code>--split-files</code></td>
<td style="text-align: left;">Separa os reads pareados em arquivos
distintos (R1 e R2)</td>
</tr>
<tr>
<td style="text-align: left;"><code>--threads 8</code></td>
<td style="text-align: left;">Utiliza 8 threads durante a conversão</td>
</tr>
<tr>
<td style="text-align: left;"><code>--temp</code></td>
<td style="text-align: left;">Define o diretório para arquivos
temporários</td>
</tr>
<tr>
<td style="text-align: left;"><code>--outdir</code></td>
<td style="text-align: left;">Define onde os arquivos FASTQ serão
salvos</td>
</tr>
</tbody>
</table>

**3. Comprimindo os arquivos FASTQ:**

O fasterq-dump gera arquivos FASTQ sem compressão. Para economizar
espaço em disco, podemos utilizar o gzip.

    gzip *.fastq

Os arquivos passarão a ter a extensão `.fastq.gz`.

**4. Resultado esperado:**

Considerando que as duas corridas sejam paired-end, a estrutura final
será:

    SRA_PROJECT/
    ├── SRA/
    │   ├── SRR1176848/
    │   │   └── SRR1176848.sra
    │   └── SRR1176849/
    │       └── SRR1176849.sra
    │
    ├── FASTQ/
    │   ├── SRR1176848_1.fastq.gz
    │   ├── SRR1176848_2.fastq.gz
    │   ├── SRR1176849_1.fastq.gz
    │   └── SRR1176849_2.fastq.gz
    │
    └── TEMP/

- `_1.fastq.gz`: reads forward (R1).

- `_2.fastq.gz`: reads reverse (R2).

**Observação importante:** o `fasterq-dump` pode exigir bastante espaço
temporário durante a conversão. Recomendo verificar o espaço disponível
no servidor antes de processar grandes conjuntos de dados.

# Gene Expression Omnibus (GEO)

O **Gene Expression Omnibus (GEO)** é um repositório público de dados de
expressão gênica mantido pelo National Center for Biotechnology
Information (NCBI), nos Estados Unidos. A plataforma armazena e
disponibiliza dados de estudos de expressão gênica provenientes de
diferentes tecnologias e aplicações, incluindo **Microarrays, RNA-Seq
bulk e Single-Cell (scRNA-Seq), ChIP-Seq e outros ensaios de alto
rendimento (high-throughput sequencing)**.

O GEO permite acessar dados de estudos publicados e projetos de pesquisa
depositados por diferentes instituições ao redor do mundo. Entre os
principais arquivos disponibilizados estão as **matrizes de expressão
gênica**, que contêm valores de expressão de genes ou transcritos em
diferentes amostras, além de arquivos de metadados com informações sobre
os experimentos, características das amostras e condições biológicas
avaliadas.

Para estudos de RNA-Seq, também é possível encontrar **dados brutos de
sequenciamento (raw reads)**, geralmente disponibilizados por meio de
links para o Sequence Read Archive (SRA). Dependendo do estudo, o GEO
pode disponibilizar arquivos processados, como matrizes de contagens
(count matrices) e valores de expressão normalizados, que podem ser
utilizados diretamente em análises bioinformáticas.

Durante esta etapa do treinamento, vamos explorar como localizar estudos
de interesse no NCBI GEO, identificar os diferentes tipos de arquivos
disponibilizados e realizar o download de datasets para análises de
expressão gênica.

## Download via interface web do GEO:

Para demonstrar o download pela interface web do GEO, podemos utilizar o
estudo **GSE193453**, que investiga a expressão de mRNAs, lncRNAs e
circRNAs em tecidos de câncer gástrico e tecidos adjacentes não
tumorais. Esse estudo apresenta 12 amostras, incluindo tecidos tumorais
e não tumorais pareados, obtidos por RNA-Seq na plataforma Illumina
HiSeq 4000.

**1. Acesse o NCBI GEO:**

**Acesso:** <https://www.ncbi.nlm.nih.gov/geo/>

Na caixa de pesquisa, digite o identificador do estudo: *GSE193453*

**2. Explore as informações do estudo:**

Na página do GSE193453, você encontrará informações importantes:

- **Title**: título do estudo.
- **Organism**: organismo estudado (Homo sapiens).
- **Experiment type**: Expression profiling by high throughput
  sequencing.
- **Summary**: resumo dos objetivos e procedimentos experimentais.
- **Overall design**: descrição do desenho experimental.
- **Samples**: lista das amostras incluídas no estudo. Nesse exemplo,
  foram analisadas amostras de câncer gástrico e tecidos adjacentes não
  tumorais.

A lista apresenta seis pares de amostras, totalizando 12 amostras.

**3. Identifique arquivos adicionais disponíveis para download:**

Na parte inferior da página, localize a seção **Download family**.

Nessa região, o GEO disponibiliza diferentes opções de arquivos:

<table>
<colgroup>
<col style="width: 36%" />
<col style="width: 63%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Arquivo</th>
<th style="text-align: left;">Conteúdo</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">SOFT formatted family</td>
<td style="text-align: left;">Informações completas do estudo e das
amostras em formato SOFT</td>
</tr>
<tr>
<td style="text-align: left;">MINiML formatted family</td>
<td style="text-align: left;">Metadados estruturados em formato XML</td>
</tr>
<tr>
<td style="text-align: left;">Series Matrix File(s)</td>
<td style="text-align: left;">Informações e dados organizados em uma
matriz por amostra, quando disponibilizados</td>
</tr>
<tr>
<td style="text-align: left;">Supplementary file</td>
<td style="text-align: left;">Arquivos adicionais enviados pelos
pesquisadores</td>
</tr>
<tr>
<td style="text-align: left;">SRA Run Selector</td>
<td style="text-align: left;">Acesso aos dados brutos de
sequenciamento</td>
</tr>
</tbody>
</table>

**4. Baixe os dados de expressão gênica:**

Na página do estudo, localize a opção **Download RNA-seq counts** e
clique nela.

Essa opção direciona para uma página que apresenta os dados
disponibilizados pelos pesquisadores e as matrizes de expressão geradas
pelo próprio NCBI.

Na página seguinte, serão apresentadas duas seções principais:

- **Submitter-supplied data**: arquivos enviados diretamente pelos
  pesquisadores responsáveis pelo estudo.

- **NCBI-generated data**: arquivos de expressão processados e
  disponibilizados pelo NCBI.

Na seção **NCBI-generated data**, encontramos três tipos de matrizes:

<table>
<colgroup>
<col style="width: 36%" />
<col style="width: 63%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Arquivo</th>
<th style="text-align: left;">Descrição</th>
</tr>
</thead>
<tbody>
<tr>
<td
style="text-align: left;"><code>GSE193453_raw_counts_GRCh38.p13_NCBI.tsv.gz</code></td>
<td style="text-align: left;">Matriz de contagens brutas (<em>raw
counts</em>)</td>
</tr>
<tr>
<td
style="text-align: left;"><code>GSE193453_norm_counts_FPKM_GRCh38.p13_NCBI.tsv.gz</code></td>
<td style="text-align: left;">Matriz normalizada por FPKM</td>
</tr>
<tr>
<td
style="text-align: left;"><code>GSE193453_norm_counts_TPM_GRCh38.p13_NCBI.tsv.gz</code></td>
<td style="text-align: left;">Matriz normalizada por TPM</td>
</tr>
</tbody>
</table>

Para baixar a matriz de contagens brutas, localize a seção **Series
RNA-seq raw counts matrix** e clique no arquivo:
`GSE193453_raw_counts_GRCh38.p13_NCBI.tsv.gz`.

Para baixar as matrizes normalizadas, acesse a seção **Series RNA-seq
normalized counts matrix** e selecione os arquivos FPKM ou TPM, conforme
o objetivo da análise.

Os arquivos serão baixados no formato `.tsv.gz`, que corresponde a uma
tabela delimitada por tabulações e compactada com GZIP.

Após o download, descompacte o arquivo. O arquivo `.tsv` poderá ser
importado no R ou em outras ferramentas de análise bioinformática.

**5. Entenda qual matriz utilizar:**

- **Raw counts**: utilizada como entrada para análises de expressão
  diferencial com ferramentas como DESeq2 e edgeR.

- **FPKM**: valores de expressão normalizados pelo comprimento dos genes
  e pela profundidade de sequenciamento.

- **TPM**: valores de expressão normalizados pelo comprimento dos
  transcritos e pela soma das abundâncias na amostra.

É importante destacar que as matrizes FPKM e TPM não devem ser
utilizadas diretamente como entrada do DESeq2, que requer contagens
brutas.

**Referências:**

1.  EUROPEAN BIOINFORMATICS INSTITUTE (EMBL-EBI). European Nucleotide
    Archive (ENA) – Documentation. Disponível em:
    <https://ena-docs.readthedocs.io/en/latest/>.

2.  EUROPEAN BIOINFORMATICS INSTITUTE (EMBL-EBI). How to Download Data
    Files – ENA Documentation. Disponível em:
    <https://ena-docs.readthedocs.io/en/latest/retrieval/file-download.html>.

3.  NATIONAL CENTER FOR BIOTECHNOLOGY INFORMATION (NCBI). Sequence Read
    Archive (SRA). Disponível em: <https://www.ncbi.nlm.nih.gov/sra>.

4.  NATIONAL CENTER FOR BIOTECHNOLOGY INFORMATION (NCBI). SRA Toolkit.
    Disponível em: <https://github.com/ncbi/sra-tools>.

5.  NATIONAL CENTER FOR BIOTECHNOLOGY INFORMATION (NCBI). Gene
    Expression Omnibus (GEO). Disponível em:
    <https://www.ncbi.nlm.nih.gov/geo/>.

6.  NATIONAL CENTER FOR BIOTECHNOLOGY INFORMATION (NCBI). NCBI-generated
    RNA-seq count data. Disponível em:
    <https://www.ncbi.nlm.nih.gov/geo/info/rnaseqcounts.html>.

7.  GNU PROJECT. GNU Wget Manual. Disponível em:
    <https://www.gnu.org/software/wget/manual/wget.html>.

8.  NATIONAL CENTER FOR BIOTECHNOLOGY INFORMATION (NCBI). GSE193453:
    Profiling of mRNAs, long chain non-coding RNAs and circular RNAs in
    gastric cancer tissues and adjacent normal tissues. Gene Expression
    Omnibus, 2022. Disponível em:
    <https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE193453>.

**Contatos:**

- E-mail: <diego-pereira20@outlook.com>

- Github: <https://github.com/armsdidi>
