-- criação tabela reproducoes

CREATE TABLE reproducoes (
    id_reproducao SERIAL,
    data_reproducao DATE NOT NULL,
    id_usuario INTEGER NOT NULL,
    id_video INTEGER NOT NULL,
    dispositivo VARCHAR(50),
    duracao_segundos INTEGER,
    PRIMARY KEY (id_reproducao, data_reproducao)
) PARTITION BY RANGE (data_reproducao);
