component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();

	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		describe('GET "https://api.sorryapp.com/v1/pages"...', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			it(title='...and expect an array', body=function() {
				var response = variables.cfSorry.getPages();

				debug(response);

				expect(response.data).toBeArray();
			}, data={});
		});

		describe('GET "https://api.sorryapp.com/v1/pages"...', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			it(title='...and expect an array of structures', body=function() {
				var response = variables.cfSorry.getPages();

				debug(response);

				for (var entry in response.data) {
					// debug(entry);

					expect(entry).toBeStruct();
				}

			}, data={});
		});

		describe('GET "https://api.sorryapp.com/v1/pages/:page_id"...', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			it(title='...and expect a structure', body=function() {
				var response = variables.cfSorry.getPage('4293842c');

				debug(response);

				expect(response).toBeStruct();
			}, data={});
		});

		describe('GET "https://api.sorryapp.com/v1/pages/:page_id"...', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			var responseKeyList = 'code,data,error,failure,status,success';

			it(title='...and expect a structure of specific top-level keys ("#responseKeyList#")', body=function() {
				var response = variables.cfSorry.getPage('4293842c');

				debug(response);

				for (var responseKey in responseKeyList) {
					expect(response).toHaveKey(responseKey);
				}
			}, data={});
		});
	}
}