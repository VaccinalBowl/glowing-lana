package flashcard.russian.xtend


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document

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
														
														
														
	public static val testConjunctions = 
	'''
а
абы
будто
в итоге
в результате
в то время как
ведь
всё-таки
где
да
дабы
до сих пор
до тех пор пока
ежели
если
если не
если только
еслибы
же
и
ибо
или
иль
как
как будто
когда
коли
кто
куда
ли
ль
настолько
не говоря уже о
нежели
несмотря на то, что
ни
но
пока
пока не
покуда
поскольку
после того, как
потому что
почём
правда
причём
пусть
раз
ровно
с тех пор как
сколь
словно
так как
то
тогда как
точно
хотя
хотя бы
чем
что
чтоб
чтобы	'''
										
										
	def static  isolateRussianSection(Document document,int number){
		var documentSplitInTwo =document.toString.split("<span class=\"mw-headline\" id=\"Russian\">Russian</span>")
		var docBeginningWithRussianSection = documentSplitInTwo.get(1)
		var String docBeginEndRussianSection
		Jsoup::parse(docBeginningWithRussianSection)
		var hrElements = Jsoup::parse(docBeginningWithRussianSection).select("hr")
		var divElements = Jsoup::parse(docBeginningWithRussianSection).select("div.printfooter")
		
		
		//println(hrSplitArrayLength)
		if (hrElements.size > 0)
		{
			var hrSplitDocument = docBeginningWithRussianSection.split(hrElements.get(0).toString)
			println("Here")
			docBeginEndRussianSection		=	hrSplitDocument.get(0)	
		} else if (divElements.size> 0){
			println("There")
			var divSplitDocument = docBeginningWithRussianSection.split("<div class=\"printfooter\">")
			docBeginEndRussianSection	=	divSplitDocument.get(0)
		} else {
			throw new Exception("The word you are looking up on Wiktionary contains HTML which violates the constraints of the parser")
		}
		var documentJustContainingRussianSection = Jsoup::parse(docBeginEndRussianSection)
		println(documentJustContainingRussianSection)
		return documentJustContainingRussianSection

			
	
	}									
										
										
	def static void lookupWiktionaryPage(String word,int number){
		print(number+"."+word+":")
		val doc = Jsoup::connect("http://en.wiktionary.org/w/index.php?title="+word+"").get();
		isolateRussianSection(doc,number)
		
		
	}									
																		 		
											 		
											 		
	def static void main(String[] args)
	{
		 
		
		testNouns.forEach[word,number|
			try	
				lookupWiktionaryPage(word.replaceAll(" ", "_").toLowerCase,number)
			catch(org.jsoup.HttpStatusException e)
				println("Word Not Available On Wiktionary")
			catch(java.net.SocketTimeoutException e)
				println("Connection Fucked when looking for word")
		]
		
	}
	
}