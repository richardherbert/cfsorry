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

			scenario('Get a existing Notice Updates...', function() {
				given('I call getNoticeUpdates()...', function() {
					when('I call the function...', function() {
						then('I should get back an array of Notice Update objects.', function() {
							var update = variables.cfSorry.addNoticeUpdate(
								 id=page.data.id
								,notice=notice.data.id
								,content=mockedNoticeUpdateData.content
							);

							var update = variables.cfSorry.addNoticeUpdate(
								 id=page.data.id
								,notice=notice.data.id
								,content=mockedNoticeUpdateDataUpdated.content
							);

							var response = variables.cfSorry.getNoticeUpdates(page.data.id, notice.data.id);

							statusTest(response);

							expect(response.data).toBeArray();
						});
					});
				});
			});
		});
	}
}
