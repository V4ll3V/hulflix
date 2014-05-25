package hulflix
/**
 * The Playlist entity.
 *
 * @author    
 *
 *
 */
class Playlist {
    static mapping = {
         table 'playlist'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         // In case a sequence is needed, changed the identity generator for the following code:
//       id generator:'sequence', column:'Playlist_ID', params:[sequence:'playlist_sequence']
         id generator:'identity', column:'Playlist_ID'
    }
    String playlistName
    // Relation
    User user

    static hasMany = [ playlistentry : Playlistentry ]

    static constraints = {
        playlistName(size: 0..45)
    }
	static {
		grails.converters.JSON.registerObjectMarshaller(Playlist) {Playlist p ->
			def ar = [:]
			ar['id'] = p.id
			ar['playlistName'] = p.playlistName		
			ar
		}
	}
}
