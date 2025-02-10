--1
SELECT
    h.hacker_id,
    h.name
FROM
    hackers AS h
JOIN
    submissions AS s ON h.hacker_id = s.hacker_id
JOIN
    challenges AS c ON s.challenge_id = c.challenge_id
JOIN
    difficulty AS d ON d.difficulty_level = c.difficulty_level
WHERE
    s.score = d.score
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(s.submission_id) > 1
ORDER BY
    COUNT(s.submission_id) DESC,
    hacker_id ASC;

--2
WITH cte AS(
    SELECT
        a.power as pow, b.age, a.coins_needed,  a.id
    FROM
        wands AS a
    JOIN
        Wands_Property AS b ON a.code = b.code
    WHERE b.is_evil = 0
),
cte2 AS(
    SELECT
        age, pow, MIN(coins_needed) as min_coins
    FROM
        cte
    GROUP BY
        age, pow
)
SELECT
    c.id, c.age, c2.min_coins, c.pow
FROM
    cte2 AS c2
INNER JOIN
    cte AS c ON c.age = c2.age AND c2.min_coins = c.coins_needed AND c.pow = c2.pow
ORDER BY
    c2.pow DESC, c2.age DESC;