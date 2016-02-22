component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();

	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Timezones', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			scenario('Get existing Timezones...', function() {
				given('I call getTimezones()...', function() {
					when('I call the function...', function() {
						then('I should get back an array of Timezone objects.', function() {
							var response = variables.cfSorry.getTimezones();

							statusTest(response);

							debug(response);

							expect(response.data).toBeArray();
						});
					});
				});
			});
		});
	}
}