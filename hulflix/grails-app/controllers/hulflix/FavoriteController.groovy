package hulflix

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class FavoriteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	
	def addfavorite = {params->
		int isDuplicat = 0
		User u = User.findById(params.id)
		Genre g = Genre.findById(params.target)
		List<Favorite> favor = Favorite.findAll{
			user == u && genre==g
		}
		if(!favor.isEmpty()){
					isDuplicat =isDuplicat +1
					println(isDuplicat)
		}
		if(isDuplicat == 0){
				
				Favorite f = Favorite.create()
				f.setUser(u)
				f.setGenre(g)
				f.save()
				
				def favorite = [favorite: f]
				render favorite as JSON
		}else{

			def error = [String:'Error newFavorite is duplicat']
			render error as JSON
		}
	}
	def getuserfavorite = {params->
		User u = User.findById(params.id)
		if(u.equals(null)){
			def error = [String:'Error User not found']
			render error as JSON
		}
		
		List<Favorite> favor = Favorite.findAll{
			user == u
		}
		if(favor.equals(null)){
			def error = [String:'Error Favorite not found']
			render error as JSON
			}else{
				def favorites = [favorites:favor]
				render favorites as JSON
			}
	}
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [favoriteInstanceList: Favorite.list(params), favoriteInstanceTotal: Favorite.count()]
    }

    def create() {
        [favoriteInstance: new Favorite(params)]
    }

    def save() {
        def favoriteInstance = new Favorite(params)
        if (!favoriteInstance.save(flush: true)) {
            render(view: "create", model: [favoriteInstance: favoriteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'favorite.label', default: 'Favorite'), favoriteInstance.id])
        redirect(action: "show", id: favoriteInstance.id)
    }

    def show(Long id) {
        def favoriteInstance = Favorite.get(id)
        if (!favoriteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'favorite.label', default: 'Favorite'), id])
            redirect(action: "list")
            return
        }

        [favoriteInstance: favoriteInstance]
    }

    def edit(Long id) {
        def favoriteInstance = Favorite.get(id)
        if (!favoriteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'favorite.label', default: 'Favorite'), id])
            redirect(action: "list")
            return
        }

        [favoriteInstance: favoriteInstance]
    }

    def update(Long id, Long version) {
        def favoriteInstance = Favorite.get(id)
        if (!favoriteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'favorite.label', default: 'Favorite'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (favoriteInstance.version > version) {
                favoriteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'favorite.label', default: 'Favorite')] as Object[],
                          "Another user has updated this Favorite while you were editing")
                render(view: "edit", model: [favoriteInstance: favoriteInstance])
                return
            }
        }

        favoriteInstance.properties = params

        if (!favoriteInstance.save(flush: true)) {
            render(view: "edit", model: [favoriteInstance: favoriteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'favorite.label', default: 'Favorite'), favoriteInstance.id])
        redirect(action: "show", id: favoriteInstance.id)
    }

    def delete(Long id) {
        def favoriteInstance = Favorite.get(id)
        if (!favoriteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'favorite.label', default: 'Favorite'), id])
            redirect(action: "list")
            return
        }

        try {
            favoriteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'favorite.label', default: 'Favorite'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'favorite.label', default: 'Favorite'), id])
            redirect(action: "show", id: id)
        }
    }
}
