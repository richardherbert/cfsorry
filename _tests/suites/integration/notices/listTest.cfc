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

			scenario('Get an existing Notices...', function() {
				given('I call getNotices()...', function() {
					when('I call the function...', function() {
						then('I should get back an array of Notice objects.', function() {
							var notice = variables.cfSorry.addNotice(
								 id=page.data.id
								,initial_comment=mockedNoticeData.initial_comment
							);

							var response = variables.cfSorry.getNotices(page.data.id);

							statusTest(response);

							expect(response.data).toBeArray();
						});
					});
				});
			});
		});
	}
}
