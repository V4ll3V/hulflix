package hulflix

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class GenreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def getgenre = {params->
		List<Genre> genre = Genre.findAll{}
		if(genre.isEmpty()){
			
			def error = ['Error genre not found']
			render error as JSON
		}
		else{
			def genres =[genres:genre]
			render genres as JSON
		}
		
	}
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [genreInstanceList: Genre.list(params), genreInstanceTotal: Genre.count()]
    }

    def create() {
        [genreInstance: new Genre(params)]
    }

    def save() {
        def genreInstance = new Genre(params)
        if (!genreInstance.save(flush: true)) {
            render(view: "create", model: [genreInstance: genreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'genre.label', default: 'Genre'), genreInstance.id])
        redirect(action: "show", id: genreInstance.id)
    }

    def show(Long id) {
        def genreInstance = Genre.get(id)
        if (!genreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), id])
            redirect(action: "list")
            return
        }

        [genreInstance: genreInstance]
    }

    def edit(Long id) {
        def genreInstance = Genre.get(id)
        if (!genreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), id])
            redirect(action: "list")
            return
        }

        [genreInstance: genreInstance]
    }

    def update(Long id, Long version) {
        def genreInstance = Genre.get(id)
        if (!genreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (genreInstance.version > version) {
                genreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'genre.label', default: 'Genre')] as Object[],
                          "Another user has updated this Genre while you were editing")
                render(view: "edit", model: [genreInstance: genreInstance])
                return
            }
        }

        genreInstance.properties = params

        if (!genreInstance.save(flush: true)) {
            render(view: "edit", model: [genreInstance: genreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'genre.label', default: 'Genre'), genreInstance.id])
        redirect(action: "show", id: genreInstance.id)
    }

    def delete(Long id) {
        def genreInstance = Genre.get(id)
        if (!genreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), id])
            redirect(action: "list")
            return
        }

        try {
            genreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'genre.label', default: 'Genre'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'genre.label', default: 'Genre'), id])
            redirect(action: "show", id: id)
        }
    }
}
