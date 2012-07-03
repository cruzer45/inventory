package inventory

import org.springframework.dao.DataIntegrityViolationException

class DepartmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [departmentInstanceList: Department.list(params), departmentInstanceTotal: Department.count()]
    }

    def create() {
        [departmentInstance: new Department(params)]
    }

    def save() {
        def departmentInstance = new Department(params)
        if (!departmentInstance.save(flush: true)) {
            render(view: "create", model: [departmentInstance: departmentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'department.label', default: 'Department'), departmentInstance.id])
        redirect(action: "show", id: departmentInstance.id)
    }

    def show() {
        def departmentInstance = Department.get(params.id)
        if (!departmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
            redirect(action: "list")
            return
        }

        [departmentInstance: departmentInstance]
    }

    def edit() {
        def departmentInstance = Department.get(params.id)
        if (!departmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
            redirect(action: "list")
            return
        }

        [departmentInstance: departmentInstance]
    }

    def update() {
        def departmentInstance = Department.get(params.id)
        if (!departmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (departmentInstance.version > version) {
                departmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'department.label', default: 'Department')] as Object[],
                          "Another user has updated this Department while you were editing")
                render(view: "edit", model: [departmentInstance: departmentInstance])
                return
            }
        }

        departmentInstance.properties = params

        if (!departmentInstance.save(flush: true)) {
            render(view: "edit", model: [departmentInstance: departmentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'department.label', default: 'Department'), departmentInstance.id])
        redirect(action: "show", id: departmentInstance.id)
    }

    def delete() {
        def departmentInstance = Department.get(params.id)
        if (!departmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
            redirect(action: "list")
            return
        }

        try {
            departmentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'department.label', default: 'Department'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'department.label', default: 'Department'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
