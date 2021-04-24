Feature: Botao Contador

    Como um usuario
    Eu quero tocar no botão de adicao
    Para que eu possa ver o incremento do contador

    Scenario: O usuario toca no botao do contador
        Given o usuario esta no painel de controle
        And o valor do contador esta em 0
        When o usuario toca no botao de adicao
        Then o valor do contador esta em 1