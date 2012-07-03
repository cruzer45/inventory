package inventory

import org.springframework.dao.DataIntegrityViolationException

class AssetCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetCategoryInstanceList: AssetCategory.list(params), assetCategoryInstanceTotal: AssetCategory.count()]
    }

    def create() {
        [assetCategoryInstance: new AssetCategory(params)]
    }

    def save() {
        def assetCategoryInstance = new AssetCategory(params)
        if (!assetCategoryInstance.save(flush: true)) {
            render(view: "create", model: [assetCategoryInstance: assetCategoryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), assetCategoryInstance.id])
        redirect(action: "show", id: assetCategoryInstance.id)
    }

    def show() {
        def assetCategoryInstance = AssetCategory.get(params.id)
        if (!assetCategoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), params.id])
            redirect(action: "list")
            return
        }

        [assetCategoryInstance: assetCategoryInstance]
    }

    def edit() {
        def assetCategoryInstance = AssetCategory.get(params.id)
        if (!assetCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), params.id])
            redirect(action: "list")
            return
        }

        [assetCategoryInstance: assetCategoryInstance]
    }

    def update() {
        def assetCategoryInstance = AssetCategory.get(params.id)
        if (!assetCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (assetCategoryInstance.version > version) {
                assetCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'assetCategory.label', default: 'AssetCategory')] as Object[],
                          "Another user has updated this AssetCategory while you were editing")
                render(view: "edit", model: [assetCategoryInstance: assetCategoryInstance])
                return
            }
        }

        assetCategoryInstance.properties = params

        if (!assetCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [assetCategoryInstance: assetCategoryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), assetCategoryInstance.id])
        redirect(action: "show", id: assetCategoryInstance.id)
    }

    def delete() {
        def assetCategoryInstance = AssetCategory.get(params.id)
        if (!assetCategoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), params.id])
            redirect(action: "list")
            return
        }

        try {
            assetCategoryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'assetCategory.label', default: 'AssetCategory'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
