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

			scenario('Delete a Notice...', function() {
				given('I call deleteNotice()...', function() {
					when('I provide an existing Page id and Notice id...', function() {
						then('the Notice should be deleted.', function() {
							var notice = variables.cfSorry.addNotice(
								 id=page.data.id
								,initial_comment=mockedNoticeData.initial_comment
							);

							var response = variables.cfSorry.deleteNotice(page.data.id, notice.data.id);

							statusTest(response=response, code='204', status='No Content');

							expect(response.data).toBeEmpty();
						});
					});
				});
			});
		});

	}
}
