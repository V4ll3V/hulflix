package hulflix
/**
 * The Genre entity.
 *
 * @author    
 *
 *
 */
class Genre {
    static mapping = {
         table 'genre'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         // In case a sequence is needed, changed the identity generator for the following code:
//       id generator:'sequence', column:'Genre_ID', params:[sequence:'genre_sequence']
         id generator:'identity', column:'Genre_ID'
    }
    String genreName
    String genreDescription

    static constraints = {
        genreName(size: 0..45)
        genreDescription(size: 0..45)
    }
	static {
		grails.converters.JSON.registerObjectMarshaller(Genre) {
			def entry = it.properties.findAll {k,v -> v!=null}
			entry.remove('class')
			entry.remove('userID')
			return entry.findAll {k,v -> v!=''}
		}
	}
}
