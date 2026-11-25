<div align="center">

# 🛠️ Gestão de Ordens de Serviço

### Sistema de manutenção industrial em **Portugol**

![Linguagem](https://img.shields.io/badge/linguagem-Portugol-blue?style=for-the-badge)
![Curso](https://img.shields.io/badge/SENAI-Desenvolvimento%20de%20Sistemas-red?style=for-the-badge)
![UC](https://img.shields.io/badge/UC-Lógica%20de%20Programação-success?style=for-the-badge)
![Status](https://img.shields.io/badge/status-concluído-brightgreen?style=for-the-badge)

*Cadastre, consulte, busque, ordene e atualize ordens de serviço de forma simples, padronizada e organizada.*

</div>

---

## 📑 Sumário

- [Sobre o projeto](#-sobre-o-projeto)
- [Contexto do desafio](#-contexto-do-desafio)
- [Funcionalidades](#-funcionalidades)
- [Estrutura de dados](#-estrutura-de-dados)
- [Modularização](#-modularização)
- [Fluxo principal](#-fluxo-principal)
- [Como executar](#-como-executar)
- [Casos de teste](#-casos-de-teste)
- [Padrões adotados](#-padrões-adotados)
- [Objetivos de aprendizagem](#-objetivos-de-aprendizagem)
- [Equipe](#-equipe)
- [Estrutura do repositório](#-estrutura-do-repositório)

---

## 📌 Sobre o projeto

Projeto desenvolvido no **Curso Técnico em Desenvolvimento de Sistemas (SENAI)**, na Unidade Curricular **Lógica de Programação**.

> **Situação de Aprendizagem 1 – Momento Prático 1**
> Estrutura de Algoritmos em VisuAlg: **Gestão de Ordens de Serviço**

| Item | Detalhe |
|---|---|
| 🎓 Curso | Técnico em Desenvolvimento de Sistemas |
| 📚 UC | Lógica de Programação |
| ⏱️ Carga horária | 4h |
| 👥 Dinâmica | Em grupo (3 estudantes) |
| 📦 Entrega | Arquivo do algoritmo em Portugol (`.por`) + relatório curto + demonstração presencial |

---

## 🏭 Contexto do desafio

Uma equipe de desenvolvimento apoia o **setor de manutenção de uma planta industrial**. O time recebeu a solicitação de um pequeno sistema, em forma de algoritmo, para organizar as **ordens de serviço (OS)** registradas ao longo do turno.

Os dados precisam ficar **legíveis, padronizados e fáceis de manter**, pois diferentes técnicos e analistas irão consultar e atualizar as informações.

---

## ✨ Funcionalidades

O sistema funciona por **menu de opções**, que se repete até o usuário escolher sair:

```text
===== SISTEMA DE OS =====
1 - Cadastrar OS
2 - Listar OS
3 - Buscar OS
4 - Ordenar OS
5 - Atualizar status
6 - Sair
Escolha:
```

| # | Funcionalidade | O que faz |
|---|---|---|
| 1 | ➕ **Cadastrar** | Registra uma nova OS com validação dos dados. O código é gerado automaticamente (101, 102, 103...) |
| 2 | 📋 **Listar** | Exibe todas as OS cadastradas |
| 3 | 🔎 **Buscar** | Encontra uma OS pelo código |
| 4 | 🔢 **Ordenar** | Pergunta o critério e organiza por código ou por prioridade |
| 5 | 🔄 **Atualizar status** | Altera o status de uma OS existente |
| 6 | 🚪 **Sair** | Encerra o programa |

---

## 🗂️ Estrutura de dados

As OS são armazenadas em **cinco vetores paralelos**, com capacidade de **100 OS** (constante `LIMITE`). A mesma posição em todos os vetores pertence à mesma OS: a posição `0` guarda todos os dados da primeira OS, a posição `1` os da segunda, e assim por diante. A variável `total` guarda quantas OS já foram cadastradas.

| Vetor | Tipo | Regra |
|---|---|---|
| `vCodigo` | Inteiro | Identificador da OS, gerado automaticamente (`101 + total`) |
| `vDescricao` | Texto | Descrição do serviço (não pode ficar vazia) |
| `vPrioridade` | Inteiro | Aceita apenas **1 a 3** |
| `vTempo` | Inteiro | Tempo estimado, em **minutos** (deve ser maior que 0) |
| `vStatus` | Inteiro | `1` = Aberta, `2` = Em andamento, `3` = Concluída |

Toda OS nova começa com o status **Aberta**. A função `nomeStatus` converte o número do status no texto que aparece na tela.

**Prioridades**

| Valor | Significado |
|:---:|---|
| 🟢 1 | Baixa |
| 🟡 2 | Média |
| 🔴 3 | Alta |

---

## 🧩 Modularização

O código é dividido em **funções**, cada uma com uma única tarefa:

| Módulo | Responsabilidade |
|---|---|
| `inicio` | Mostra o menu principal e chama a função da opção escolhida |
| `cadastrarOS` | Lê, valida e guarda uma nova OS |
| `listarOS` | Mostra todas as OS cadastradas |
| `buscarOS` | Pede o código e mostra a OS encontrada |
| `buscarPosicao` | Busca sequencial: devolve a posição do código no vetor, ou `-1` se não existir |
| `mostrarOS` | Mostra na tela os dados de uma OS |
| `ordenarOS` | Pergunta o critério de ordenação e chama a função certa |
| `ordenarPorCodigo` | Ordena pelo código (Bubble Sort) |
| `ordenarPorPrioridade` | Ordena pela prioridade (Bubble Sort) |
| `trocar` | Troca duas OS vizinhas nos **cinco vetores** de uma vez, para os dados não se misturarem |
| `atualizarStatus` | Muda o status de uma OS |
| `nomeStatus` | Converte o número do status em texto |
| `nomePrioridade` | Converte o número da prioridade em texto |

---

## 🔁 Fluxo principal

```mermaid
flowchart TD
    A([Início]) --> B[Exibir menu]
    B --> C[/Ler opção/]
    C --> D{Opção?}
    D -- 1 --> E[Cadastrar OS]
    D -- 2 --> F[Listar OS]
    D -- 3 --> G[Buscar por código]
    D -- 4 --> H[Ordenar OS]
    D -- 5 --> I[Atualizar status]
    D -- 6 --> J([Fim])
    D -- Outra --> K[Mostrar opção inválida]
    E --> B
    F --> B
    G --> B
    H --> B
    I --> B
    K --> B
```

**Entrada → Processamento → Saída**

- 📥 **Entrada:** opção do menu e dados da OS digitados pelo usuário
- ⚙️ **Processamento:** validações, busca, ordenação e atualização
- 📤 **Saída:** mensagens e listagem formatada na tela

---

## ▶️ Como executar

1. Baixe e instale o **Portugol Studio**.
2. Clone este repositório:
   ```bash
   git clone https://github.com/kidgrind3v/AVA_PRESENCIAL_2.git
   ```
3. Abra o arquivo `sistema_os.por` no Portugol Studio.
4. Clique em **Executar** (botão de play, ou tecla **F5**).
5. Use o menu para testar as opções.

---

## 🧪 Casos de teste

> ✏️ *Adicione prints dos testes na pasta `docs/`.*

### ✅ Teste 1 – Cadastro e listagem

| Entrada | Saída esperada |
|---|---|
| Opção `1` → descrição `Troca de rolamento`, prioridade `2`, tempo `90` | `OS 101 cadastrada com sucesso!` |
| Opção `2` | Lista mostra a OS `101` com status **Aberta** |

### ✅ Teste 2 – Validação de dados

| Entrada | Saída esperada |
|---|---|
| Opção `1` → prioridade `5` | `Valor inválido! Digite 1 (baixa), 2 (média) ou 3 (alta):` e nova solicitação do dado |
| Opção `1` → tempo `0` | `Valor inválido! Digite novamente:` e nova solicitação do dado |
| Opção `1` → descrição em branco | `Você não escreveu nada. Digite novamente:` |

### ✅ Teste 3 – Busca e atualização de status

| Entrada | Saída esperada |
|---|---|
| Opção `3` → código `101` | Exibe os dados da OS `101` |
| Opção `5` → código `101` → novo status `3` | `OS 101 atualizada para Concluída.` |
| Opção `3` → código `999` | `OS 999 não encontrada.` |

### ✅ Teste 4 – Ordenação

| Entrada | Saída esperada |
|---|---|
| Cadastrar 3 OS com prioridades `3`, `1` e `2`, depois opção `4` → critério `2` | `Ordenado por prioridade!` |
| Opção `2` | OS listadas da prioridade `1` para a `3`, cada uma com a sua descrição e tempo (os dados não se misturam) |
| Opção `4` com menos de 2 OS cadastradas | `É preciso ter pelo menos 2 OS para ordenar.` |

---

## 🧼 Padrões adotados

- **Indentação** consistente em todos os blocos
- **Comentários** separando cada parte do programa (cadastrar, listar, buscar, ordenar, atualizar e menu)
- **Nomenclatura** clara, em `camelCase`, com nomes que dizem o que a variável ou função faz (os vetores começam com `v`)
- **Constante** `LIMITE` para o tamanho máximo dos vetores
- **Estruturas de decisão** (`se / senao`, `escolha / caso`) e **repetição** (`para`, `enquanto`, `faca / enquanto`) usadas em cada situação adequada
- **Expressões** aritméticas, relacionais e lógicas aplicadas nas validações

---

## 🎯 Objetivos de aprendizagem

- [x] Aplicar lógica de programação e abstração para estruturar a solução
- [x] Representar o algoritmo com pseudocódigo e fluxograma
- [x] Usar tipos de dados, variáveis e constantes adequados
- [x] Empregar expressões aritméticas, relacionais e lógicas
- [x] Utilizar corretamente estruturas de decisão e repetição
- [x] Codificar de forma legível e padronizada
- [x] Aplicar técnicas de **busca** e **ordenação**
- [x] Trabalhar com organização, ética e método

---

## 👥 Equipe

| Integrante | Responsabilidade |
|---|---|
| **Nome 1** | Cadastro, validação e controle da quantidade de OS |
| **Nome 2** | Listagem, busca por código e atualização de status |
| **Nome 3** | Ordenação, menu principal, integração e testes gerais |

> ✏️ *Troque os nomes e, se quiser, adicione links para os perfis do GitHub.*

---

## 📁 Estrutura do repositório

```text
📦 AVA_PRESENCIAL_2
 ┣ 📜 sistema_os.por       # Algoritmo em Portugol
 ┣ 📁 docs
 ┃ ┣ 📄 relatorio.pdf      # Relatório curto (pseudocódigo/fluxograma + testes)
 ┃ ┗ 🖼️ prints/            # Evidências dos casos de teste
 ┗ 📄 README.md
```

---

<div align="center">

Feito com 💻 e muito teste de mesa no **SENAI** · Curitiba, 2026

</div>
