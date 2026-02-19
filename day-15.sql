-- SQL Advent Calendar - Day 15
-- Title: The Grinch's Mischief Tracker
-- Difficulty: hard
--
-- Question:
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--


-- Table Schema:
-- Table: grinch_mischief_log
--   log_date: DATE
--   mischief_score: INTEGER
--

-- My Solution:

WITH previous_day_score AS (
  SELECT *,
  LAG(mischief_score, 1) 
  OVER (ORDER BY log_date) AS previous_mischief_score
  FROM grinch_mischief_log 
  )
SELECT *,
  mischief_score - previous_mischief_score as daily_diff
FROM previous_day_score
