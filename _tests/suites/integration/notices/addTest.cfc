component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();
	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Notices', function() {
			beforeEach(function(currentSpec) {
				page = variables.cfSorry.addPage();
			});

			afterEach(function(currentSpec) {
				variables.cfSorry.deletePage(page.data.id);
			});

			scenario('Add a new Notice...', function() {
				given('I call addNotice()...', function() {
					when('I provide minimal arguments...', function() {
						then('I should get a new Notice object with those values.', function() {
							var response = variables.cfSorry.addNotice(
								 id=page.data.id
								,initial_comment=mockedNoticeData.initial_comment
							);

							statusTest(response=response, code='201', status='Created');

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBeNumeric();
							expect(data.state).toBe('open');
							expect(data.created_at).toBeDate();
							expect(data.updated_at).toBeDate();
						});
					});
				});
			});
		});
	}
}
