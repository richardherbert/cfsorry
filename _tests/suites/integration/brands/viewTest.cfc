component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();

	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Brands', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			scenario('Get the Brand for a Page...', function() {
				given('I call getBrand()...', function() {
					when('I provide an existing Page id...', function() {
						then('I should get the Brand object.', function() {
							var page = variables.cfSorry.addPage(
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

							var response = variables.cfSorry.getBrand(page.data.id);

							statusTest(response);

							debug(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.color_state_ok).toBe('##27ae60');
							expect(data.color_state_warning).toBe('##e67e22');
							expect(data.color_navbar_background).toBe('rgba(0,0,0,0.01)');
							expect(data.color_navbar_links).toBe('##2c3e50');
							expect(data.color_header_background).toBe('##F7F8F9');
							expect(data.color_header_links).toBe('##2980b9');
							expect(data.color_header_text).toBe('##2c3e50');
							expect(data.color_body_background).toBe('##FFFFFF');
							expect(data.color_body_links).toBe('##2980b9');
							expect(data.color_body_text).toBe('##2c3e50');

							variables.cfSorry.deletePage(page.data.id);
						});
					});
				});
			});
		});
	}
}
