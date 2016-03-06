component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();

	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Custom Domain', function() {
			beforeEach(function(currentSpec) {
				page = variables.cfSorry.addPage();
			});

			afterEach(function(currentSpec) {
				variables.cfSorry.deletePage(page.data.id);
			});

			scenario('Delete the Custom Domain of a Page...', function() {
				given('I call deleteCustomDomain()...', function() {
					when('I provide an existing Page id...', function() {
						then('the Custom Domain should be deleted.', function() {
							var customDomain = variables.cfSorry
								.addCustomDomain(page.data.id, variables.mockedCustomDomainData.domain);

							var response = variables.cfSorry.deleteCustomDomain(page.data.id);

							statusTest(response=response, code='204', status='No Content');

							expect(response.data).toBeEmpty();
						});
					});
				});
			});
		});

	}
}
