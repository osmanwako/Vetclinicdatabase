/*
 The following queries are taking too much time (1 sec = 1000ms can be considered
 as too much time for database query).Try them on your machine to confirm it:
 */
EXPLAIN ANALYZE
SELECT
  COUNT(*)
FROM
  visits
where
  animal_id = 4;


EXPLAIN ANALYZE
SELECT
  *
FROM
  visits
where
  vet_id = 2;


EXPLAIN ANALYZE
SELECT
  *
FROM
  owners
where
  email = 'owner_18327@mail.com';
