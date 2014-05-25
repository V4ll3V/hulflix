package hulflix

import grails.converters.JSON

import org.springframework.dao.DataIntegrityViolationException

class PlaylistController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def deleteplaylist = {params->
		Playlist p = Playlist.findById(params.id)
		if(p.equals(null)){
			def error = [String:'Error Entry not found']
			render error as JSON
		}		
		else{
			User u = p.user
			p.delete(flush:true)
			List<Playlist> playlistResult = Playlist.findAll{
				user == u
			}
			
			if(p.equals(null)){
				def error = [String:'Error Playlist not found']
				render error as JSON
			}	
			else{
				def playlist = [playlist:playlistResult]
				render playlist as JSON
			}
		}
		
	}
	
	
	def addplaylist = {params->
		//params: userId, assetId
		int isDuplicat = 0
		List<Playlist> playlist
		User u = User.findById(params.id)
		if(u.equals(null)){
			def error = [String:'Error User not found']
			render error as JSON
		}else{
			playlist = Playlist.findAll{
				user == user
			}
		}
		if(!playlist.isEmpty()){
			for(Playlist e:playlist){
				if(params.target == e.playlistName){
					isDuplicat =isDuplicat +1
					println(isDuplicat)
				}
			}
		}
		if(isDuplicat == 0){
				Playlist newlist = Playlist.create()
				newlist.setUser(u)
				newlist.setPlaylistName(params.target)
				newlist.save()
				
				List<Playlist> list = Playlist.findAll{
					user == u
				}
				def playlists = [playlists: list]
				render playlists as JSON
		}else{
			def error = [String:'Error User addentry failed!']
			render error as JSON
		}
	}
	def getplaylist = {params->
		//get User from id:
		Playlist p = Playlist.findById(params.id)
		if(p.equals(null)){
			def error = [String:'Error Playlist not found']
			render error as JSON
		}else{
			//get all entries for current user with metaPlaylistType "playlist"
			List<Playlistentry> playlistResult = Playlistentry.findAll{
				playlist == p
			}
			if(playlistResult.equals(null)){
			def error = [String:'Error User not found']
			render error as JSON
			}else{
				def playlist = [playlist:playlistResult]
				render playlist as JSON
			}
		}
	}
	
	def getuserplaylist = {params->
		//get User from id:
		User u = User.findById(params.id)
		if(u.equals(null)){
			def error = [String:'Error User not found']
			render error as JSON
		}else{
			//get all entries for current user with metaPlaylistType "playlist"
			List<Playlist> playlist = Playlist.findAll{
				user == u 
			}
			if(playlist.equals(null)){
			def error = [String:'Error Playlist not found']
			render error as JSON
			}else{
				def playlists = [playlists:playlist]
				render playlists as JSON
			}
		}
	}
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [playlistInstanceList: Playlist.list(params), playlistInstanceTotal: Playlist.count()]
    }

    def create() {
        [playlistInstance: new Playlist(params)]
    }

    def save() {
        def playlistInstance = new Playlist(params)
        if (!playlistInstance.save(flush: true)) {
            render(view: "create", model: [playlistInstance: playlistInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'playlist.label', default: 'Playlist'), playlistInstance.id])
        redirect(action: "show", id: playlistInstance.id)
    }

    def show(Long id) {
        def playlistInstance = Playlist.get(id)
        if (!playlistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlist.label', default: 'Playlist'), id])
            redirect(action: "list")
            return
        }

        [playlistInstance: playlistInstance]
    }

    def edit(Long id) {
        def playlistInstance = Playlist.get(id)
        if (!playlistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlist.label', default: 'Playlist'), id])
            redirect(action: "list")
            return
        }

        [playlistInstance: playlistInstance]
    }

    def update(Long id, Long version) {
        def playlistInstance = Playlist.get(id)
        if (!playlistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlist.label', default: 'Playlist'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (playlistInstance.version > version) {
                playlistInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'playlist.label', default: 'Playlist')] as Object[],
                          "Another user has updated this Playlist while you were editing")
                render(view: "edit", model: [playlistInstance: playlistInstance])
                return
            }
        }

        playlistInstance.properties = params

        if (!playlistInstance.save(flush: true)) {
            render(view: "edit", model: [playlistInstance: playlistInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'playlist.label', default: 'Playlist'), playlistInstance.id])
        redirect(action: "show", id: playlistInstance.id)
    }

    def delete(Long id) {
        def playlistInstance = Playlist.get(id)
        if (!playlistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlist.label', default: 'Playlist'), id])
            redirect(action: "list")
            return
        }

        try {
            playlistInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'playlist.label', default: 'Playlist'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'playlist.label', default: 'Playlist'), id])
            redirect(action: "show", id: id)
        }
    }
}
