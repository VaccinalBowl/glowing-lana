INSERT INTO word_entry (word) VALUES ('и');
INSERT INTO conjunction_base(id,word,transliteration) VALUES (1,'и','i');
INSERT INTO translation(id, meaning) VALUES (1,'and');
INSERT INTO translation(id, meaning) VALUES (2,'even though');
INSERT INTO conjunction_base_x_translation(conjunction_base_id,translation_order_number,translation_id) VALUES(1,1,1);
INSERT INTO conjunction_base_x_translation(conjunction_base_id,translation_order_number,translation_id) VALUES(1,2,2);