package inventory

import org.springframework.dao.DataIntegrityViolationException

class MaintenanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [maintenanceInstanceList: Maintenance.list(params), maintenanceInstanceTotal: Maintenance.count()]
    }

    def create() {
        [maintenanceInstance: new Maintenance(params)]
    }

    def save() {
        def maintenanceInstance = new Maintenance(params)
        if (!maintenanceInstance.save(flush: true)) {
            render(view: "create", model: [maintenanceInstance: maintenanceInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), maintenanceInstance.id])
        redirect(action: "show", id: maintenanceInstance.id)
    }

    def show() {
        def maintenanceInstance = Maintenance.get(params.id)
        if (!maintenanceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), params.id])
            redirect(action: "list")
            return
        }

        [maintenanceInstance: maintenanceInstance]
    }

    def edit() {
        def maintenanceInstance = Maintenance.get(params.id)
        if (!maintenanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), params.id])
            redirect(action: "list")
            return
        }

        [maintenanceInstance: maintenanceInstance]
    }

    def update() {
        def maintenanceInstance = Maintenance.get(params.id)
        if (!maintenanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (maintenanceInstance.version > version) {
                maintenanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'maintenance.label', default: 'Maintenance')] as Object[],
                          "Another user has updated this Maintenance while you were editing")
                render(view: "edit", model: [maintenanceInstance: maintenanceInstance])
                return
            }
        }

        maintenanceInstance.properties = params

        if (!maintenanceInstance.save(flush: true)) {
            render(view: "edit", model: [maintenanceInstance: maintenanceInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), maintenanceInstance.id])
        redirect(action: "show", id: maintenanceInstance.id)
    }

    def delete() {
        def maintenanceInstance = Maintenance.get(params.id)
        if (!maintenanceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), params.id])
            redirect(action: "list")
            return
        }

        try {
            maintenanceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'maintenance.label', default: 'Maintenance'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
