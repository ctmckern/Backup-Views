CREATE MATERIALIZED VIEW IF NOT EXISTS playlist_genre_ratios
AS
SELECT playlist_id, name, grand_total/count as ratio
FROM playlist_genre_totals
WITH DATA;