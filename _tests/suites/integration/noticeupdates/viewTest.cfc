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

			scenario('Get an existing Notice Update...', function() {
				given('I call getNoticeUpdate()...', function() {
					when('I provide an existing Page id, Notice id and Update id...', function() {
						then('I should get the Notice Update object.', function() {
							var update = variables.cfSorry.addNoticeUpdate(
								 id=page.data.id
								,notice=notice.data.id
								,content=mockedNoticeUpdateData.content
							);

							var response = variables.cfSorry.getNoticeUpdate(page.data.id, notice.data.id, update.data.id);

							statusTest(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBe(update.data.id);
							expect(data.content).toBe(mockedNoticeUpdateData.content);
							expect(data.created_at).toBeDate();
							expect(data.updated_at).toBeDate();
						});
					});
				});
			});
		});
	}
}
