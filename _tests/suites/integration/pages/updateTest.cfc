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

			scenario('Update a Page...', function() {
				given('I call updatePage()...', function() {
					when('I provide new arguments...', function() {
						then('I should get an updated Page object with those values...', function() {
							var newPage = variables.cfSorry.addPage(
								 name=mockedPageData.name
								,timezone=mockedPageData.timezone
								,support_email=mockedPageData.support_email
								,support_telephone=mockedPageData.support_telephone
								,support_url=mockedPageData.support_url
								,visible_to_search=mockedPageData.visible_to_search
								,meta_title=mockedPageData.meta_title
								,meta_description=mockedPageData.meta_description
								,google_analytics_id=mockedPageData.google_analytics_id
							);

							var response = variables.cfSorry.updatePage(
								 id=newPage.data.id
								,name=variables.mockedPageDataUpdated.name
								,timezone=variables.mockedPageDataUpdated.timezone
								,support_email=variables.mockedPageDataUpdated.support_email
								,support_telephone=variables.mockedPageDataUpdated.support_telephone
								,support_url=variables.mockedPageDataUpdated.support_url
								,visible_to_search=variables.mockedPageDataUpdated.visible_to_search
								,meta_title=variables.mockedPageDataUpdated.meta_title
								,meta_description=variables.mockedPageDataUpdated.meta_description
								,google_analytics_id=variables.mockedPageDataUpdated.google_analytics_id
							);

							debug(response);

							statusTest(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBeString();
							expect(data.name).toBe(variables.mockedPageDataUpdated.name);
							expect(data.timezone).toBe(variables.mockedPageDataUpdated.timezone);
							expect(data.support_email).toBe(variables.mockedPageDataUpdated.support_email);
							expect(data.support_telephone).toBe(variables.mockedPageDataUpdated.support_telephone);
							expect(data.support_url).toBe(variables.mockedPageDataUpdated.support_url);
							expect(data.visible_to_search).toBe(variables.mockedPageDataUpdated.visible_to_search);
							expect(data.meta_title).toBe(variables.mockedPageDataUpdated.meta_title);
							expect(data.meta_description).toBe(variables.mockedPageDataUpdated.meta_description);
							expect(data.google_analytics_id).toBe(variables.mockedPageDataUpdated.google_analytics_id);
							expect(data.created_at).toBeDate();
							expect(data.updated_at).toBeDate();

							variables.cfSorry.deletePage(data.id);
						});
					});
				});
			});
		});
	}
}