USE vk;
SELECT
	from_user_id,
	(SELECT CONCAT(firstname, ' ', lastname) FROM users where id = messages.from_user_id) as name,
	COUNT(*) as cnt
FROM messages
WHERE to_user_id = 1 AND from_user_id IN (
	SELECT initiator_user_id
	FROM friend_requests WHERE (target_user_id = 1) AND status='approved'
	UNION
	SELECT target_user_id
	FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved'
)
GROUP BY from_user_id
ORDER BY cnt DESC
LIMIT 1;

SELECT COUNT(*)
FROM likes
WHERE media_id in (
	SELECT id
	FROM media
	WHERE user_id in (
		SELECT
			user_id
		FROM profiles as p
		WHERE TIMESTAMPDIFF(YEAR,birthday,NOW())<10)
);

SELECT 
	gender
	, COUNT(*)
FROM (
	SELECT
		user_id AS user,
		(
			SELECT gender
			FROM vk.profiles
			WHERE user_id = user
		) AS gender
	FROM likes
) as dummy
GROUP BY gender;