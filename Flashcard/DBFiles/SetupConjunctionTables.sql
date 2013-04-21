DROP TABLE conjunction_base;
CREATE TABLE conjunction_base
(
	id INTEGER PRIMARY KEY,
	word varchar(100),
	transliteration varchar(100),
	FOREIGN KEY (word) REFERENCES word_entry(word)
);

DROP TABLE conjunction_base_x_translation;
CREATE TABLE conjunction_base_x_translation
(
	conjunction_base_id INTEGER,
	translation_order_number INTEGER,
	translation_id INTEGER,
	PRIMARY KEY(conjunction_base_id,translation_order_number,translation_id),
	FOREIGN KEY(conjunction_base_id) REFERENCES conjunction_base(id) ON DELETE CASCADE,
	FOREIGN KEY(translation_id) REFERENCES translation(id) ON DELETE CASCADE

);