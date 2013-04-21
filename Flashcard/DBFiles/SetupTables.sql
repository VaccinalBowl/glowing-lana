
DROP TABLE noun_base;
CREATE TABLE noun_base
(
	id INTEGER PRIMARY KEY,
	gender ENUM('m','f','n'),
    animate boolean
);
DROP TABLE noun_declension;
CREATE TABLE noun_declension
(
	id INTEGER PRIMARY KEY, 
	gcase ENUM('nominative','accusative','dative','genetive','instrumental','prepositional','locative'),
	gnumber ENUM('singular','plural'),
	lexicalform varchar(100),
	transliteration varchar(100),
	ipa varchar(100)
);
DROP TABLE translation;
CREATE TABLE translation
(
	id INTEGER PRIMARY KEY,
	meaning VARCHAR(200)
);
DROP TABLE noun_base_x_translations;
CREATE TABLE noun_base_x_translations
(
	noun_base_id INTEGER,
	translation_order_number INTEGER,
	translation_id INTEGER,
	PRIMARY KEY(noun_base_id,translation_order_number,translation_id)

);

