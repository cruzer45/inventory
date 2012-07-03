package inventory



import org.junit.*
import grails.test.mixin.*

@TestFor(AssetCategoryController)
@Mock(AssetCategory)
class AssetCategoryControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/assetCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.assetCategoryInstanceList.size() == 0
        assert model.assetCategoryInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.assetCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.assetCategoryInstance != null
        assert view == '/assetCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/assetCategory/show/1'
        assert controller.flash.message != null
        assert AssetCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/assetCategory/list'


        populateValidParams(params)
        def assetCategory = new AssetCategory(params)

        assert assetCategory.save() != null

        params.id = assetCategory.id

        def model = controller.show()

        assert model.assetCategoryInstance == assetCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/assetCategory/list'


        populateValidParams(params)
        def assetCategory = new AssetCategory(params)

        assert assetCategory.save() != null

        params.id = assetCategory.id

        def model = controller.edit()

        assert model.assetCategoryInstance == assetCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/assetCategory/list'

        response.reset()


        populateValidParams(params)
        def assetCategory = new AssetCategory(params)

        assert assetCategory.save() != null

        // test invalid parameters in update
        params.id = assetCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/assetCategory/edit"
        assert model.assetCategoryInstance != null

        assetCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/assetCategory/show/$assetCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        assetCategory.clearErrors()

        populateValidParams(params)
        params.id = assetCategory.id
        params.version = -1
        controller.update()

        assert view == "/assetCategory/edit"
        assert model.assetCategoryInstance != null
        assert model.assetCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/assetCategory/list'

        response.reset()

        populateValidParams(params)
        def assetCategory = new AssetCategory(params)

        assert assetCategory.save() != null
        assert AssetCategory.count() == 1

        params.id = assetCategory.id

        controller.delete()

        assert AssetCategory.count() == 0
        assert AssetCategory.get(assetCategory.id) == null
        assert response.redirectedUrl == '/assetCategory/list'
    }
}
