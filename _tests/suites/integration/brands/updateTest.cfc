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

			scenario('Update a Brand...', function() {
				given('I call updateBrand()...', function() {
					when('I provide new arguments...', function() {
						then('I should get an updated Brand object with those values...', function() {
							var page = variables.cfSorry.addPage();

							var response = variables.cfSorry.updateBrand(
								 id=page.data.id
								,color_state_ok=mockedBrandData.color_state_ok
								,color_state_warning=mockedBrandData.color_state_warning
								,color_navbar_background=mockedBrandData.color_navbar_background
								,color_navbar_links=mockedBrandData.color_navbar_links
								,color_header_background=mockedBrandData.color_header_background
								,color_header_links=mockedBrandData.color_header_links
								,color_header_text=mockedBrandData.color_header_text
								,color_body_background=mockedBrandData.color_body_background
								,color_body_links=mockedBrandData.color_body_links
								,color_body_text=mockedBrandData.color_body_text
							);

							statusTest(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.color_state_ok).toBe(mockedBrandData.color_state_ok);
							expect(data.color_state_warning).toBe(mockedBrandData.color_state_warning);
							expect(data.color_navbar_background).toBe(mockedBrandData.color_navbar_background);
							expect(data.color_navbar_links).toBe(mockedBrandData.color_navbar_links);
							expect(data.color_header_background).toBe(mockedBrandData.color_header_background);
							expect(data.color_header_links).toBe(mockedBrandData.color_header_links);
							expect(data.color_header_text).toBe(mockedBrandData.color_header_text);
							expect(data.color_body_background).toBe(mockedBrandData.color_body_background);
							expect(data.color_body_links).toBe(mockedBrandData.color_body_links);
							expect(data.color_body_text).toBe(mockedBrandData.color_body_text);

							variables.cfSorry.deletePage(page.data.id);
						});
					});
				});
			});
		});
	}
}
