package hulflix

import java.io.Serializable;



class Playlistentry implements Serializable {
	Playlist playlist
	Content content
	
	static mapping = {
		table 'playlistentry'
		// version is set to false, because this isn't available by default for legacy databases
		version false
		
		id composite:['playlist', 'content']

   }
	static hasMany = [ content : Content]
	
	static belongsTo = [Playlist]
	
	static {
		grails.converters.JSON.registerObjectMarshaller(Playlistentry) {
			def entry = it.properties.findAll {k,v -> v!=null}
			entry.remove('class')
			entry.remove('id')
			return entry.findAll {k,v -> v!=''}
		}
	}
	
}
