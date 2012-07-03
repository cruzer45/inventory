package inventory



import org.junit.*
import grails.test.mixin.*

@TestFor(MaintenanceController)
@Mock(Maintenance)
class MaintenanceControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/maintenance/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.maintenanceInstanceList.size() == 0
        assert model.maintenanceInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.maintenanceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.maintenanceInstance != null
        assert view == '/maintenance/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/maintenance/show/1'
        assert controller.flash.message != null
        assert Maintenance.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/maintenance/list'


        populateValidParams(params)
        def maintenance = new Maintenance(params)

        assert maintenance.save() != null

        params.id = maintenance.id

        def model = controller.show()

        assert model.maintenanceInstance == maintenance
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/maintenance/list'


        populateValidParams(params)
        def maintenance = new Maintenance(params)

        assert maintenance.save() != null

        params.id = maintenance.id

        def model = controller.edit()

        assert model.maintenanceInstance == maintenance
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/maintenance/list'

        response.reset()


        populateValidParams(params)
        def maintenance = new Maintenance(params)

        assert maintenance.save() != null

        // test invalid parameters in update
        params.id = maintenance.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/maintenance/edit"
        assert model.maintenanceInstance != null

        maintenance.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/maintenance/show/$maintenance.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        maintenance.clearErrors()

        populateValidParams(params)
        params.id = maintenance.id
        params.version = -1
        controller.update()

        assert view == "/maintenance/edit"
        assert model.maintenanceInstance != null
        assert model.maintenanceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/maintenance/list'

        response.reset()

        populateValidParams(params)
        def maintenance = new Maintenance(params)

        assert maintenance.save() != null
        assert Maintenance.count() == 1

        params.id = maintenance.id

        controller.delete()

        assert Maintenance.count() == 0
        assert Maintenance.get(maintenance.id) == null
        assert response.redirectedUrl == '/maintenance/list'
    }
}
