# 🎬 Projeto de Particionamento de Dados – StreamNow

## 🏢 Cenário
A **StreamNow** é uma plataforma de streaming de vídeos que cresceu rapidamente nos últimos anos.  
Atualmente, o banco de dados contém **milhões de usuários** e **bilhões de registros de reproduções**.  

Com o aumento exponencial de dados, o **time de engenharia** enfrentou problemas de:
- Lentidão nas consultas;
- Dificuldade para realizar **backups**;
- Manutenção complexa das tabelas mais acessadas.

Como solução, a equipe decidiu implementar **particionamento de dados** no PostgreSQL, otimizando o desempenho das consultas e facilitando o gerenciamento das informações históricas.

---

## 🎯 Objetivo
Demonstrar a aplicação do **particionamento por faixa de valores (RANGE)** em uma tabela de registros de reprodução de vídeos.  
O objetivo é melhorar o **desempenho das consultas**, reduzir o **tempo de manutenção** e **simplificar o arquivamento de dados antigos**.

---

## ⚙️ Estratégia de Particionamento
O particionamento escolhido foi o **RANGE por data de reprodução (`data_reproducao`)**.  

Essa estratégia é ideal para cenários onde os dados crescem continuamente ao longo do tempo, como no caso da StreamNow.  
Cada partição representa um **ano de reproduções**, permitindo que:
- Consultas em períodos recentes sejam mais rápidas;
- Backups de anos anteriores sejam realizados separadamente;
- Manutenções afetem apenas parte dos dados.

---

## 🧱 Estrutura de Arquivos

| Arquivo | Descrição |
|----------|------------|
| `1_create_table_reproducoes.sql` | Criação da tabela principal particionada |
| `2_create_partitions.sql` | Criação das partições por ano |
| `3_insert_dados.sql` | Inserção de dados simulados |
| `4_select_teste.sql` | Consultas de validação e análise |
