
DROP TABLE word_entry;
CREATE TABLE word_entry
(
	word VARCHAR(100) PRIMARY KEY
	
);
DROP TABLE basic_pronounciation; 
CREATE TABLE basic_pronounciation
(
	id INTEGER PRIMARY KEY,
	ipa VARCHAR(100),
	audio_file_location VARCHAR(100),
	word VARCHAR(100),
	FOREIGN KEY (word) REFERENCES word_entry(word)
);

DROP TABLE noun_base;
CREATE TABLE noun_base
(
	id INTEGER PRIMARY KEY,
	gender ENUM('m','f','n'),
    animate boolean,
    word VARCHAR(100),
    FOREIGN KEY (word) REFERENCES word_entry(word)
);

DROP TABLE noun_declension;
CREATE TABLE noun_declension
(
	id INTEGER PRIMARY KEY, 
	gcase ENUM('nominative','accusative','dative','genetive','instrumental','prepositional','locative'),
	gnumber ENUM('singular','plural'),
	lexicalform varchar(100),
	transliteration varchar(100),
	ipa varchar(100),
	audio_file_location VARCHAR(100),
	noun_base_id INTEGER,
	FOREIGN KEY (noun_base_id) REFERENCES noun_base (id) ON DELETE CASCADE
);
DROP TABLE translation;
CREATE TABLE translation
(
	id INTEGER PRIMARY KEY,
	meaning VARCHAR(200)
);
DROP TABLE noun_base_x_translation;
CREATE TABLE noun_base_x_translation
(
	noun_base_id INTEGER,
	translation_order_number INTEGER,
	translation_id INTEGER,
	PRIMARY KEY(noun_base_id,translation_order_number,translation_id),
	FOREIGN KEY(noun_base_id) REFERENCES noun_base(id) ON DELETE CASCADE,
	FOREIGN KEY(translation_id) REFERENCES translation(id) ON DELETE CASCADE

);
DROP TABLE conjunction_base;
CREATE TABLE conjunction_base
(
	id INTEGER  PRIMARY KEY,
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





