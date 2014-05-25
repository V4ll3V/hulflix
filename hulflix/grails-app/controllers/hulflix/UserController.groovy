package hulflix

import grails.converters.JSON

import org.apache.jasper.compiler.Node.ParamsAction;
import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def getuser = {params->
		User u = User.findById(params.id)
		if(u.equals(null)){
			def error = [String:'Error User not found']
			render error as JSON
		}else{
			def user = [user:u]
			render user as JSON				
		}
		
	}
	def finduser = {params ->
		User u = User.find{
			userName == params.id
		}
		if(u.equals(null)){
			def error = [String:'Error User not found']
			render error as JSON
		}
		else if(u.userPassword.equals(params.target)){
			def user =[user:u]
			render user as JSON
		}
		else{
				def error = [error:'Error wrong password']
			render error as JSON				
		}
    }
	
	def adduser = {params->
		int isDuplicat = 0
		List<User> user = User.findAll{}
		if(!user.isEmpty()){
			for(User u: user){
				if(params.id == u.userName){
					isDuplicat =isDuplicat +1
					println(isDuplicat)
				}
			}
		}
		else{
			isDuplicat = 1
		}
		if(isDuplicat == 0){
				User newuser = User.create()
				newuser.setUserName(params.id)
				newuser.setUserPassword(params.target)
				newuser.setUserPicture('http://localhost/pics/userdefault.png')
				newuser.save()
				
				def success = [success: newuser]
				render success as JSON
		}else{

			def error = [String:'Error newUser is duplicat']
			render error as JSON	
		}
	}
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
