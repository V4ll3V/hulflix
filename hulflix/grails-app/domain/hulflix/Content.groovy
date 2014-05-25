package hulflix
/**
 * The Content entity.
 *
 * @author    
 *
 *
 */
class Content {
    static mapping = {
         table 'content'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         // In case a sequence is needed, changed the identity generator for the following code:
//       id generator:'sequence', column:'Content_ID', params:[sequence:'content_sequence']
         id generator:'identity', column:'Content_ID'
         seasonID column:'Season_ID'
    }
    String contentTitle
    String contentDescription
    java.sql.Time contentLength
    String contentPath
    String contentType
	String contentPicture
    // Relation
    Season seasonID

    static hasMany = [ contentGenre : ContentGenre]

    static belongsTo = [  Season ]
	
	static searchable = true
    static constraints = {
        contentTitle(size: 0..45)
        contentDescription(size: 0..500)
        contentLength(size: 0.value..100000)
        contentPath(size: 0..45)
        contentType(size: 0..45)
        seasonID()
    }
	static {
		grails.converters.JSON.registerObjectMarshaller(Content) {Content c ->
			def ar = [:]
			ar['cid'] = c.id
			ar['contentTitle'] = c.contentTitle
			ar['contentDescription'] = c.contentDescription
			ar['contentPicture'] = c.contentPicture
			ar
		}
	}
}
