package flashcard.russian.xtend

import org.jsoup.Jsoup
import org.jsoup.nodes.Document

import java.util.HashMap

class WiktionaryPage {
	String entry
	HashMap<String,LanguageSection>  languageSections
	Document wiktionaryPage
	
	
	new(String entry)
	{
		this.entry = entry	
		wiktionaryPage = lookupWiktionaryPage(entry)
		println("yes")
		var russianSectionDocument = isolateLanguageSection("Russian",wiktionaryPage)
		println("no")
		var russianSection = new RussianSection(russianSectionDocument)
		println("maybe")
		languageSections = new HashMap<String,LanguageSection>
		println("so")
		languageSections.put("Russian",russianSection)
		println("fuck")
	}

										
										
	def private isolateLanguageSection(String language,Document document){
		var documentSplitInTwo =document.toString.split("<span class=\"mw-headline\" id=\"Russian\">Russian</span>")
		println(document)
		var docBeginningWithRussianSection = documentSplitInTwo.get(1)
		var String docBeginEndRussianSection
		Jsoup::parse(docBeginningWithRussianSection)
		var hrElements = Jsoup::parse(docBeginningWithRussianSection).select("hr")
		var divElements = Jsoup::parse(docBeginningWithRussianSection).select("div.printfooter")
		
		
		//println(hrSplitArrayLength)
		if (hrElements.size > 0)
		{
			var hrSplitDocument = docBeginningWithRussianSection.split(hrElements.get(0).toString)
			//println("Here")
			docBeginEndRussianSection		=	hrSplitDocument.get(0)	
		} else if (divElements.size> 0){
			//println("There")
			var divSplitDocument = docBeginningWithRussianSection.split("<div class=\"printfooter\">")
			docBeginEndRussianSection	=	divSplitDocument.get(0)
		} else {
			throw new Exception("The word you are looking up on Wiktionary contains HTML which violates the constraints of the parser")
		}
		var documentJustContainingRussianSection = Jsoup::parse(docBeginEndRussianSection)
		
		
		return documentJustContainingRussianSection

			
	
	}									
										
										
	def private lookupWiktionaryPage(String word){
		var w =  word.replaceAll(" ", "_").toLowerCase
		val doc = Jsoup::connect("http://en.wiktionary.org/w/index.php?title="+w+"").get();
		doc
	}									
																		 		
											 		
											 		
	def static void main(String[] args)
	{
	
			
			try	{
				new WiktionaryPage("человек")
				//new WiktionaryPage("лев")
			}catch(org.jsoup.HttpStatusException e){
				println("Word Not Available On Wiktionary")
			}catch(java.net.SocketTimeoutException e){
				println("Connection Fucked when looking for word")
			}
			
			
			
			
		
		
	}
	

	



}