package flashcard.russian.xtend

import org.jsoup.nodes.Document


import java.util.Collections
import org.jsoup.select.Elements


class RussianSection extends LanguageSection {
	
	public static val russianPartsOfSpeech = newArrayList("Adjective","Adverb","Conjunction","Determiner","Interjection","Noun","Participle","Predicative","Preposition","Pronoun","Pronunciation","Verb"); 
	
	
	
	
	new(Document russianDocument){
		super()
		printSubHeadings(russianDocument)
	}
	def private printSubHeadings(Document document)
	{
		var headings = document.select("h3,h4,h5,h6,h7")	
		headings = removeNonInterestingHeadings(headings)	
		for(head:headings){
			println(head)
			var headingRegex = head.toString.replace("[","\\[")
			headingRegex = headingRegex.replace("]","\\]") 
			var splitDoc = document.toString.split(headingRegex)
			println(splitDoc.size)
		}
		
	

	}
	
	/* 
	def private writeToFile(String word,Document document)
	{
		var fstream = new FileWriter("/Users/jonathncummins/git/glowing-lana/Flashcard/OtherFiles/"+word+".txt");
  		var out = new BufferedWriter(fstream);
  		out.write(document.toString);

  		out.close();
	}*/
	
	def static removeNonInterestingHeadings(Elements headings)
	{
		var interestingHeadings = new Elements
		for(heading:headings){
			var headingText = heading.select("span.mw-headline").get(0).ownText
			var indexOfItem = Collections::binarySearch(russianPartsOfSpeech,headingText)
			if(indexOfItem>=0){
				interestingHeadings.add(heading)
			}
		}
		interestingHeadings
	}
	
}