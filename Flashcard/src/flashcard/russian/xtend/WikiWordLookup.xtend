package flashcard.russian.xtend

class WikiWordLookup {
	//public static 
	public static val testNouns = newArrayList(		'человек'	,	
											 		'год' 		,	
											 		'время'		, 	
											 		'рука' 		,
													'раз' 		,
													'глаз' 		,
											 		'жизнь' 	,	
											 		'день' 		,
											 		'голова'	,	
											 		'друг' 		,
											 		'дом' 		,
											 		'слово' 	,	
													'место' 	,	
											 		'лицо' 		,
											 		'сторона'	, 	
											 		'нога' 		,
											 		'дверь'		,
											 		'работа' 	,	
											 		'земля' 	)
											 		
											 		
	public static val testVerbs =	newArrayList(	'быть'		,
													'сказать'	,
													'мочь'		,	 	
												    'говорить'	, 	
													'знать'		, 	
													'стать'		, 	
													'есть'		, 	
													'хотеть'	, 	
												 	'видеть'	, 	
												 	'идти'		, 	
												 	'стоять'	, 	
												 	'думать'	, 	
												 	'спросить'	, 	
												 	'жить'		, 	
												 	'смотреть'	, 	
												 	'сидеть'	, 	
												 	'понять'	, 	
												 	'иметь'		, 	
												 	'делать'	, 	
												 	'взять'		) 	
												 	
	public static val testAdjectives =	newArrayList(	'политический'	,
														'обычный'		,
														'важный'		,
														'железный'		,
														'синий'			,
														'теплый'		,
														'немецкий'		,
														'частый'		,
														'поздний'		,
														'московский'	,
														'уверенный'		,
														'неизвестный'	,
														'тонкий'		,
														'внутренний'	,
														'верный'		,
														'прекрасный'	,
														'американский'	,
														'серьезный'		,
														'быстрый'		,
														'золотой'		)									 		
											 		
											 		
	def static void main(String[] args)
	{
		//println("Dude")
		println("Nouns:")
		WikiWordLookup::testNouns.forEach[element,index|  println("Looking up noun "+": "+element) ]
		println("Verbs:")
		WikiWordLookup::testVerbs.forEach[element,index|  println("Looking up verb "+": "+element) ]
		println("TestAdjectives:")
		WikiWordLookup::testAdjectives.forEach[element,index|  println("Looking up adjective "+": "+element) ]
	}
	
}