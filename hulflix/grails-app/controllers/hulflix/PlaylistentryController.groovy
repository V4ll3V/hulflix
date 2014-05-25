package hulflix

import grails.converters.JSON

import org.springframework.dao.DataIntegrityViolationException

class PlaylistentryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def fillfavorite = {params->
		Playlist favoritePlaylist = Playlist.findById(999)
		favoritePlaylist.setUser(User.findById(params.id))
		favoritePlaylist.save(flush:true)
		List<Favorite> favorite = Favorite.findAll{
			user == favoritePlaylist.user
		}
		List <Content> content
		for(Favorite f: favorite){		
			content = Content.findAll{
				contentGenre.genre == f.genre
			}
			if(!content.isEmpty()){
				for(Content c:content){
					Playlistentry newentry = Playlistentry.create()
					newentry.setPlaylist(favoritePlaylist)
					newentry.setContent(c)
					newentry.save(flush:true)
					
				}
			}
		}
		if(content.isEmpty()){
			def error = [String:'Error Content not found']
			render error as JSON
		}else{
			List<Playlistentry> p = Playlistentry.findAll {  
				playlist == favoritePlaylist
			}
			if(p.isEmpty()){
				def error = [String:'Error Playlist not found']
				render error as JSON
			}else{
				def playlist = [playlist:p]
				render playlist as JSON
			}
		}
	}
	def addentry = {params->
		int isDuplicat = 0
		Playlist p = Playlist.findById(params.id)
		Content c = Content.findById(params.target)
		List<Playlistentry> entry = Playlistentry.findAll{
			playlist == p && content==c
		}
		if(!entry.isEmpty()){
					isDuplicat =isDuplicat +1
					println(isDuplicat)
		}
		if(isDuplicat == 0){
				
				Playlistentry e = Playlistentry.create()
				e.setPlaylist(p)
				e.setContent(c)
				e.save()
				
				def playlistentry = ['Sucess']
				render playlistentry as JSON
		}else{

			def error = [String:'Error newPlaylist is duplicat']
			render error as JSON
		}
	}
	
	def deleteentry = {params->
		Playlist p = Playlist.findById(params.id)
		Content c = Content.findById(params.target)
		List<Playlistentry> entry = Playlistentry.findAll{
			playlist == p && content==c
		}
		if(entry.equals(null)){
			def error = [String:'Error Entry not found']
			render error as JSON
		}
		else{
			Playlistentry e = entry.get(0)
			e.delete(flush:true)
			List<Playlistentry> playlistResult = Playlistentry.findAll{
				playlist == p
			}
			
		if(playlistResult.equals(null)){
			def error = [String:'Error Playlist not found']
			render error as JSON
			}
			else{				
				def playlist = [playlist:playlistResult]
				render playlist as JSON
			}
		}
	}
	
	def getentry ={params->
		Playlist p = Playlist.findById(params.id)
		Content c = Content.findById(params.target)
		List<Playlistentry> entry = Playlistentry.findAll{
			playlist == p && content==c}
		if(entry.equals(null)){
			def error = [String:'Error Entry not found']
			render error as JSON
		}
		else{
			
			render entry as JSON
		}
	}
	
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [playlistentryInstanceList: Playlistentry.list(params), playlistentryInstanceTotal: Playlistentry.count()]
    }

    def create() {
        [playlistentryInstance: new Playlistentry(params)]
    }

    def save() {
        def playlistentryInstance = new Playlistentry(params)
        if (!playlistentryInstance.save(flush: true)) {
            render(view: "create", model: [playlistentryInstance: playlistentryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), playlistentryInstance.id])
        redirect(action: "show", id: playlistentryInstance.id)
    }

    def show(Long id) {
        def playlistentryInstance = Playlistentry.get(id)
        if (!playlistentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), id])
            redirect(action: "list")
            return
        }

        [playlistentryInstance: playlistentryInstance]
    }

    def edit(Long id) {
        def playlistentryInstance = Playlistentry.get(id)
        if (!playlistentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), id])
            redirect(action: "list")
            return
        }

        [playlistentryInstance: playlistentryInstance]
    }

    def update(Long id, Long version) {
        def playlistentryInstance = Playlistentry.get(id)
        if (!playlistentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (playlistentryInstance.version > version) {
                playlistentryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'playlistentry.label', default: 'Playlistentry')] as Object[],
                          "Another user has updated this Playlistentry while you were editing")
                render(view: "edit", model: [playlistentryInstance: playlistentryInstance])
                return
            }
        }

        playlistentryInstance.properties = params

        if (!playlistentryInstance.save(flush: true)) {
            render(view: "edit", model: [playlistentryInstance: playlistentryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), playlistentryInstance.id])
        redirect(action: "show", id: playlistentryInstance.id)
    }

    def delete(Long id) {
        def playlistentryInstance = Playlistentry.get(id)
        if (!playlistentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), id])
            redirect(action: "list")
            return
        }

        try {
            playlistentryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'playlistentry.label', default: 'Playlistentry'), id])
            redirect(action: "show", id: id)
        }
    }
}
