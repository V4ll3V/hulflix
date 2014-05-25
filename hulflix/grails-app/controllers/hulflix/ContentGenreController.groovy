package hulflix

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class ContentGenreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	
	def getcontentgenre = {params->
		Content c = Content.findById(params.id)
		if(c.equals(null)){
			def error = [String:'Error User not found']
			render error as JSON
		}
		
		List<ContentGenre> cg = ContentGenre.findAll{
			content == c
		}
		if(cg.equals(null)){
			def error = [String:'Error Favorite not found']
			render error as JSON
			}else{
				def contentgenre = [contentgenre:cg]
				render contentgenre as JSON
			}
	}
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentGenreInstanceList: ContentGenre.list(params), contentGenreInstanceTotal: ContentGenre.count()]
    }

    def create() {
        [contentGenreInstance: new ContentGenre(params)]
    }

    def save() {
        def contentGenreInstance = new ContentGenre(params)
        if (!contentGenreInstance.save(flush: true)) {
            render(view: "create", model: [contentGenreInstance: contentGenreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), contentGenreInstance.id])
        redirect(action: "show", id: contentGenreInstance.id)
    }

    def show(Long id) {
        def contentGenreInstance = ContentGenre.get(id)
        if (!contentGenreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), id])
            redirect(action: "list")
            return
        }

        [contentGenreInstance: contentGenreInstance]
    }

    def edit(Long id) {
        def contentGenreInstance = ContentGenre.get(id)
        if (!contentGenreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), id])
            redirect(action: "list")
            return
        }

        [contentGenreInstance: contentGenreInstance]
    }

    def update(Long id, Long version) {
        def contentGenreInstance = ContentGenre.get(id)
        if (!contentGenreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contentGenreInstance.version > version) {
                contentGenreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contentGenre.label', default: 'ContentGenre')] as Object[],
                          "Another user has updated this ContentGenre while you were editing")
                render(view: "edit", model: [contentGenreInstance: contentGenreInstance])
                return
            }
        }

        contentGenreInstance.properties = params

        if (!contentGenreInstance.save(flush: true)) {
            render(view: "edit", model: [contentGenreInstance: contentGenreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), contentGenreInstance.id])
        redirect(action: "show", id: contentGenreInstance.id)
    }

    def delete(Long id) {
        def contentGenreInstance = ContentGenre.get(id)
        if (!contentGenreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), id])
            redirect(action: "list")
            return
        }

        try {
            contentGenreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contentGenre.label', default: 'ContentGenre'), id])
            redirect(action: "show", id: id)
        }
    }
}
