component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();
	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		feature('Notice Updates', function() {
			beforeEach(function(currentSpec) {
				page = variables.cfSorry.addPage();
				notice = variables.cfSorry.addNotice(page.data.id, mockedNoticeData.initial_comment);
			});

			afterEach(function(currentSpec) {
				variables.cfSorry.deletePage(page.data.id);
			});

			scenario('Delete a Notice Update...', function() {
				given('I call deleteNoticeUpdate()...', function() {
					when('I provide an existing Page id, Notice id and Update id...', function() {
						then('the Notice Update should be deleted.', function() {
							var update = variables.cfSorry.addNoticeUpdate(
								 id=page.data.id
								,notice=notice.data.id
								,content=mockedNoticeUpdateData.content
							);

							var response = variables.cfSorry.deleteNoticeUpdate(page.data.id, notice.data.id, update.data.id);

							statusTest(response=response, code='204', status='No Content');

							expect(response.data).toBeEmpty();
						});
					});
				});
			});
		});

	}
}
