USE vk;

CREATE TABLE country (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	user_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE city (
	id SERIAL PRIMARY KEY,
	country VARCHAR(100),
	name VARCHAR(100),
	user_id BIGINT UNSIGNED DEFAULT NULL,
	country_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED DEFAULT NULL,
	media_id BIGINT UNSIGNED DEFAULT NULL,
	created_at DATETIME default NOW(),
	foreign key (user_id) references users(id),
	foreign key (media_id) references media(id)
);