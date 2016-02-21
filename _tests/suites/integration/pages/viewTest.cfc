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

			scenario('Get an existing Page...', function() {
				given('I call getPage()...', function() {
					when('I provide an existing Page id...', function() {
						then('I should get the Page object.', function() {
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

							var response = variables.cfSorry.getPage(newPage.data.id);

							statusTest(response);

							debug(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBe(data.id);
							expect(data.name).toBe(mockedPageData.name);
							expect(data.timezone).toBe(mockedPageData.timezone);
							expect(data.support_email).toBe(mockedPageData.support_email);
							expect(data.support_telephone).toBe(mockedPageData.support_telephone);
							expect(data.support_url).toBe(mockedPageData.support_url);
							expect(data.visible_to_search).toBe(mockedPageData.visible_to_search);
							expect(data.meta_title).toBe(mockedPageData.meta_title);
							expect(data.meta_description).toBe(mockedPageData.meta_description);
							expect(data.google_analytics_id).toBe(mockedPageData.google_analytics_id);
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