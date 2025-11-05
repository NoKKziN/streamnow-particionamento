-- select teste

-- Verificar se as partições foram criadas corretamente
SELECT
    inhrelid::regclass AS particao,
    inhparent::regclass AS tabela_pai
FROM pg_inherits
WHERE inhparent = 'reproducoes'::regclass;

-- Contagem total de registros por partição
SELECT
    'reproducoes_2024' AS particao, COUNT(*) AS total_registros FROM reproducoes_2024
UNION ALL
SELECT
    'reproducoes_2025', COUNT(*) FROM reproducoes_2025;

-- Contagem total de reproduções por ano
SELECT
    EXTRACT(YEAR FROM data_reproducao) AS ano,
    COUNT(*) AS total_reproducoes
FROM reproducoes
GROUP BY ano
ORDER BY ano;

-- Tempo total assistido (em horas) por ano
SELECT
    EXTRACT(YEAR FROM data_reproducao) AS ano,
    ROUND(SUM(duracao_segundos)/3600.0, 2) AS horas_assistidas
FROM reproducoes
GROUP BY ano
ORDER BY ano;

-- Média de duração por dispositivo e ano
SELECT
    EXTRACT(YEAR FROM data_reproducao) AS ano,
    dispositivo,
    ROUND(AVG(duracao_segundos), 2) AS duracao_media_segundos,
    COUNT(*) AS total_reproducoes
FROM reproducoes
GROUP BY ano, dispositivo
ORDER BY ano, duracao_media_segundos DESC;

-- Top 10 usuários com mais tempo total assistido
SELECT
    id_usuario,
    ROUND(SUM(duracao_segundos)/60.0, 2) AS minutos_totais,
    COUNT(*) AS qtd_reproducoes
FROM reproducoes
GROUP BY id_usuario
ORDER BY minutos_totais DESC
LIMIT 10;

-- Distribuição de reproduções por mês (análise temporal)
SELECT
    TO_CHAR(data_reproducao, 'YYYY-MM') AS mes,
    COUNT(*) AS reproducoes_mes,
    ROUND(SUM(duracao_segundos)/3600.0, 2) AS horas_totais
FROM reproducoes
GROUP BY mes
ORDER BY mes;

-- Consulta combinada geral (visualização ampla)
SELECT
    EXTRACT(YEAR FROM data_reproducao) AS ano,
    dispositivo,
    COUNT(*) AS total_reproducoes,
    ROUND(AVG(duracao_segundos), 2) AS media_duracao,
    ROUND(SUM(duracao_segundos)/3600.0, 2) AS total_horas
FROM reproducoes
GROUP BY ano, dispositivo
ORDER BY ano, total_reproducoes DESC;
