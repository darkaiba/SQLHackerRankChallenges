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
SELECT
    w.id, wp.age, w.coins_needed, w.power
FROM
    Wands AS w
JOIN
    Wands_Property AS wp ON w.code=wp.code
WHERE
    wp.is_evil=0 AND w.coins_needed = (SELECT MIN(coins_needed) FROM wands WHERE code=w.code AND power=w.power)
ORDER BY
    w.power DESC, wp.age DESC;