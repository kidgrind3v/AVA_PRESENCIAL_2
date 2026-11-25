programa {

    const inteiro LIMITE = 100

    inteiro vCodigo[100]
    cadeia vDescricao[100]
    inteiro vPrioridade[100]
    inteiro vTempo[100]
    inteiro vStatus[100]

    inteiro total = 0

    // ========== FUNCOES AUXILIARES ==========

    funcao cadeia nomeStatus(inteiro s) {
        se (s == 1) {
            retorne "Aberta"
        } senao se (s == 2) {
            retorne "Em andamento"
        } senao se (s == 3) {
            retorne "Concluída"
        }
        retorne "Desconhecido"
    }

    funcao cadeia nomePrioridade(inteiro p) {
        se (p == 1) {
            retorne "Baixa"
        } senao se (p == 2) {
            retorne "Média"
        } senao se (p == 3) {
            retorne "Alta"
        }
        retorne "Desconhecida"
    }

    funcao inteiro buscarPosicao(inteiro cod) {
        para (inteiro i = 0; i < total; i++) {
            se (vCodigo[i] == cod) {
                retorne i
            }
        }
        retorne -1
    }

    funcao vazio mostrarOS(inteiro p) {
        escreva("Código: ", vCodigo[p], "\n")
        escreva("Descrição: ", vDescricao[p], "\n")
        escreva("Prioridade: ", vPrioridade[p], " (", nomePrioridade(vPrioridade[p]), ")\n")
        escreva("Tempo estimado: ", vTempo[p], " min\n")
        escreva("Status: ", nomeStatus(vStatus[p]), "\n")
        escreva("------------------------\n")
    }

    // ========== 1 - CADASTRAR ==========

    funcao vazio cadastrarOS() {
        se (total >= LIMITE) {
            escreva("O limite de OS foi atingido.\n")
            retorne
        }

        escreva("Qual a descrição do problema? ")
        leia(vDescricao[total])
        enquanto (vDescricao[total] == "") {
            escreva("Você não escreveu nada. Digite novamente: ")
            leia(vDescricao[total])
        }

        vCodigo[total] = 101 + total
        vStatus[total] = 1

        escreva("Qual é a prioridade? 1 (baixa), 2 (média) ou 3 (alta): ")
        leia(vPrioridade[total])
        enquanto (vPrioridade[total] < 1 ou vPrioridade[total] > 3) {
            escreva("Valor inválido! Digite 1 (baixa), 2 (média) ou 3 (alta): ")
            leia(vPrioridade[total])
        }

        escreva("Quanto tempo vai ser necessário (em minutos)? ")
        leia(vTempo[total])
        enquanto (vTempo[total] <= 0) {
            escreva("Valor inválido! Digite novamente: ")
            leia(vTempo[total])
        }

        escreva("OS ", vCodigo[total], " cadastrada com sucesso!\n")
        total = total + 1
    }

    // ========== 2 - LISTAR ==========

    funcao vazio listarOS() {
        se (total == 0) {
            escreva("Nenhuma OS cadastrada.\n")
        } senao {
            para (inteiro i = 0; i < total; i++) {
                mostrarOS(i)
            }
        }
    }

    // ========== 3 - BUSCAR ==========

    funcao vazio buscarOS() {
        inteiro cod, p
        escreva("Código da OS: ")
        leia(cod)
        p = buscarPosicao(cod)
        se (p == -1) {
            escreva("OS ", cod, " não encontrada.\n")
        } senao {
            mostrarOS(p)
        }
    }

    // ========== 4 - ORDENAR ==========

    // troca a posição j com a j+1 em TODOS os vetores
    funcao vazio trocar(inteiro j) {
        inteiro guardaNumero
        cadeia guardaTexto

        guardaNumero = vCodigo[j]
        vCodigo[j] = vCodigo[j + 1]
        vCodigo[j + 1] = guardaNumero

        guardaTexto = vDescricao[j]
        vDescricao[j] = vDescricao[j + 1]
        vDescricao[j + 1] = guardaTexto

        guardaNumero = vPrioridade[j]
        vPrioridade[j] = vPrioridade[j + 1]
        vPrioridade[j + 1] = guardaNumero

        guardaNumero = vTempo[j]
        vTempo[j] = vTempo[j + 1]
        vTempo[j + 1] = guardaNumero

        guardaNumero = vStatus[j]
        vStatus[j] = vStatus[j + 1]
        vStatus[j + 1] = guardaNumero
    }

    funcao vazio ordenarPorCodigo() {
        para (inteiro i = 0; i < total - 1; i++) {
            para (inteiro j = 0; j < total - 1 - i; j++) {
                se (vCodigo[j] > vCodigo[j + 1]) {
                    trocar(j)
                }
            }
        }
    }

    funcao vazio ordenarPorPrioridade() {
        para (inteiro i = 0; i < total - 1; i++) {
            para (inteiro j = 0; j < total - 1 - i; j++) {
                se (vPrioridade[j] > vPrioridade[j + 1]) {
                    trocar(j)
                }
            }
        }
    }

    funcao vazio ordenarOS() {
        inteiro criterio

        se (total < 2) {
            escreva("É preciso ter pelo menos 2 OS para ordenar.\n")
            retorne
        }

        escreva("1 - Ordenar por código\n")
        escreva("2 - Ordenar por prioridade\n")
        escreva("Escolha: ")
        leia(criterio)

        escolha (criterio) {
            caso 1:
                ordenarPorCodigo()
                escreva("Ordenado por código!\n")
                pare
            caso 2:
                ordenarPorPrioridade()
                escreva("Ordenado por prioridade!\n")
                pare
            caso contrario:
                escreva("Opção inválida.\n")
        }
    }

    // ========== 5 - ATUALIZAR STATUS ==========

    funcao vazio atualizarStatus() {
        inteiro cod, p, novo
        escreva("Código da OS: ")
        leia(cod)
        p = buscarPosicao(cod)
        se (p == -1) {
            escreva("OS ", cod, " não encontrada.\n")
        } senao {
            escreva("Status atual: ", nomeStatus(vStatus[p]), "\n")
            escreva("1-Aberta  2-Em andamento  3-Concluída\n")
            escreva("Novo status: ")
            leia(novo)
            se (novo >= 1 e novo <= 3) {
                vStatus[p] = novo
                escreva("OS ", cod, " atualizada para ", nomeStatus(novo), ".\n")
            } senao {
                escreva("Status inválido.\n")
            }
        }
    }

    // ========== MENU PRINCIPAL ==========

    funcao inicio() {
        inteiro opcao

        faca {
            escreva("\n===== SISTEMA DE OS =====\n")
            escreva("1 - Cadastrar OS\n")
            escreva("2 - Listar OS\n")
            escreva("3 - Buscar OS\n")
            escreva("4 - Ordenar OS\n")
            escreva("5 - Atualizar status\n")
            escreva("6 - Sair\n")
            escreva("Escolha: ")
            leia(opcao)

            escolha (opcao) {
                caso 1:
                    cadastrarOS()
                    pare
                caso 2:
                    listarOS()
                    pare
                caso 3:
                    buscarOS()
                    pare
                caso 4:
                    ordenarOS()
                    pare
                caso 5:
                    atualizarStatus()
                    pare
                caso 6:
                    escreva("Encerrando...\n")
                    pare
                caso contrario:
                    escreva("Opção inválida!\n")
            }
        } enquanto (opcao != 6)
    }
}
