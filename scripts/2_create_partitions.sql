-- criação partições

CREATE TABLE reproducoes_2024 PARTITION OF reproducoes
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE reproducoes_2025 PARTITION OF reproducoes
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
