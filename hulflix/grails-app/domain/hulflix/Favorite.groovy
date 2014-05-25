package hulflix

import java.io.Serializable;



class Favorite implements Serializable {
	User user
	Genre genre
	
	static mapping = {
		table 'favorite'
		// version is set to false, because this isn't available by default for legacy databases
		version false
		
		id composite:['user', 'genre']

   }
	static hasMany = [ genre : Genre]
	
	static belongsTo = User
	
	static {
		grails.converters.JSON.registerObjectMarshaller(Favorite) {
			def entry = it.properties.findAll {k,v -> v!=null}
			entry.remove('class')
			entry.remove('userID')
			return entry.findAll {k,v -> v!=''}
		}
	}
}