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
				customDomain = variables.cfSorry
					.addCustomDomain(page.data.id, variables.mockedCustomDomainData.domain);
			});

			afterEach(function(currentSpec) {
				variables.cfSorry.deleteCustomDomain(page.data.id);
				variables.cfSorry.deletePage(page.data.id);
			});

			scenario('Get the Custom Domain of a Page...', function() {
				given('I call getCustomDomain()...', function() {
					when('I provide an existing Page id...', function() {
						then('I should get the Custom Domain object.', function() {
							var response = variables.cfSorry.getCustomDomain(page.data.id);

							statusTest(response);

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
