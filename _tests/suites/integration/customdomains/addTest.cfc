component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();

	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Custom Domains', function() {
			beforeEach(function(currentSpec) {
				page = variables.cfSorry.addPage();
			});

			afterEach(function(currentSpec) {
				variables.cfSorry.deleteCustomDomain(page.data.id);
				variables.cfSorry.deletePage(page.data.id);
			});

			scenario('Add a new Custom Domain to a Page...', function() {
				given('I call addCustomDomain()...', function() {
					when('I provide minimal arguments...', function() {
						then('I should get a new Custom Domain object.', function() {
							var response = variables.cfSorry
								.addCustomDomain(page.data.id, variables.mockedCustomDomainData.domain);

							statusTest(response=response, code='201', status='Created');

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.type).toBe(variables.mockedCustomDomainData.type);
							expect(data.from).toBe(variables.mockedCustomDomainData.domain);
							expect(data.to).toMatch('^[0-9a-z]*.sorryapp.com$');
							expect(data.created_at).toBeDate();
							expect(data.updated_at).toBeDate();
						});
					});
				});
			});
		});
	}
}
