component extends='testbox.system.BaseSpec' {
	function beforeAll() {
		variables.cfSorry = new example.cfSorry('myAccessToken');
	}

	function afterAll() {
	}

	function run() {
	}
}