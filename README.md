# Task Board

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Teste: Board de Tarefas

* Desenvolver um sistema em Ruby on Rails com um board para cadastro e
controle de histórias, inspirado no mecanismo de colunas e cards do “Trello”.

* A aplicação deve ser acessível apenas para usuários logados, possuir testes
unitários e testes de integração.

* A interface deve utilizar um template do Bootstrap, e deve contar com
recursos que agreguem valor à usabilidade onde relevante: drag and drop,
modais, máscaras de data, etc., a critério do candidato.

* A sequência dos commits deve demonstrar a evolução do projeto; entregar o
projeto todo pronto com apenas um commit no final perde muitos pontos.

## Entregas:

* link do sistema publicado no Heroku, para navegarmos na versão final.

* link do código no Github.

## Regras para o model History

* points: deve aceitar apenas 1, 2, 3, 5, 8 e 13

* status válidos: pending, started, delivered e accepted

* não pode pular direto para um status fora da sequência, ou seja, pode
avançar de pending para started, mas não pode avançar de pending para
delivered

* ao mudar o status de uma história, o sistema deve registrar num histórico de
versionamento o usuário responsável, data e hora e qual alteração foi feita
(ex.; { user_id: 12, status: [:accepted, :pending] })

* os botões/links para avançar status nas views devem mostrar apenas o
próximo status válido

* pode voltar para "pending" a partir de qualquer status

* só deve permitir avançar uma história para “done” se todas as taks estiverem
marcadas como finalizadas

* finished_at / started_at: não pode finalizar numa data menor que a iniciada,
etc.Modelagem sugerida:
