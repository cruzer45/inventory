package inventory

class AssetCategory {
	String category
	boolean deleted

	static constraints = {
		category(blank:false)
		deleted()
	}

	String toString() {
		return category
	}
}
