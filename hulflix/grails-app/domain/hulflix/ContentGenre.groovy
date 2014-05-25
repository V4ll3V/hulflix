package hulflix

import java.io.Serializable;



class ContentGenre implements Serializable {
	Genre genre
	Content content
	
	static mapping = {
		table 'contentGenre'
		// version is set to false, because this isn't available by default for legacy databases
		version false
		
		id composite:['content', 'genre']

   }
	static hasMany = [ genre : Genre]
	
	static belongsTo = Content
	
	static {
		grails.converters.JSON.registerObjectMarshaller(ContentGenre) {
			def entry = it.properties.findAll {k,v -> v!=null}
			entry.remove('class')
			entry.remove('userID')
			entry.remove('contentList')
			return entry.findAll {k,v -> v!=''}
		}
	}
}
