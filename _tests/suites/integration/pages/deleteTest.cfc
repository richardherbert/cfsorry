component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();

	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Pages', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			scenario('Delete a Page...', function() {
				given('I call deletePage()...', function() {
					when('I provide an existing Page id...', function() {
						then('the Page should be deleted.', function() {
							var newPage = variables.cfSorry.addPage();

							var response = variables.cfSorry.deletePage(newPage.data.id);

							statusTest(response=response, code='204', status='No Content');

							debug(response);

							expect(response.data).toBeEmpty();
						});
					});
				});
			});
		});

	}
}