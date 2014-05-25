package hulflix

import org.springframework.dao.DataIntegrityViolationException

class ShowController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [showInstanceList: Show.list(params), showInstanceTotal: Show.count()]
    }

    def create() {
        [showInstance: new Show(params)]
    }

    def save() {
        def showInstance = new Show(params)
        if (!showInstance.save(flush: true)) {
            render(view: "create", model: [showInstance: showInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'show.label', default: 'Show'), showInstance.id])
        redirect(action: "show", id: showInstance.id)
    }

    def show(Long id) {
        def showInstance = Show.get(id)
        if (!showInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'show.label', default: 'Show'), id])
            redirect(action: "list")
            return
        }

        [showInstance: showInstance]
    }

    def edit(Long id) {
        def showInstance = Show.get(id)
        if (!showInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'show.label', default: 'Show'), id])
            redirect(action: "list")
            return
        }

        [showInstance: showInstance]
    }

    def update(Long id, Long version) {
        def showInstance = Show.get(id)
        if (!showInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'show.label', default: 'Show'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (showInstance.version > version) {
                showInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'show.label', default: 'Show')] as Object[],
                          "Another user has updated this Show while you were editing")
                render(view: "edit", model: [showInstance: showInstance])
                return
            }
        }

        showInstance.properties = params

        if (!showInstance.save(flush: true)) {
            render(view: "edit", model: [showInstance: showInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'show.label', default: 'Show'), showInstance.id])
        redirect(action: "show", id: showInstance.id)
    }

    def delete(Long id) {
        def showInstance = Show.get(id)
        if (!showInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'show.label', default: 'Show'), id])
            redirect(action: "list")
            return
        }

        try {
            showInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'show.label', default: 'Show'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'show.label', default: 'Show'), id])
            redirect(action: "show", id: id)
        }
    }
}
