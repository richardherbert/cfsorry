component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();

	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Brand', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			scenario('Delete a Brand...', function() {
				given('I call deleteBrand()...', function() {
					when('I provide an existing Page id...', function() {
						then('the Brand should be deleted.', function() {
							var newPage = variables.cfSorry.addPage();

							var response = variables.cfSorry.deleteBrand(newPage.data.id);

							statusTest(response=response, code='204', status='No Content');

							debug(response);

							expect(response.data).toBeEmpty();

							variables.cfSorry.deletePage(newPage.data.id);
						});
					});
				});
			});
		});

	}
}
