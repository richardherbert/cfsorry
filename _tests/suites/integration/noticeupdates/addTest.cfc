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

			scenario('Add a new Notice Update...', function() {
				given('I call addNoticeUpdate()...', function() {
					when('I provide minimal arguments...', function() {
						then('I should get a new Notice Update object with those values.', function() {
							var response = variables.cfSorry.addNoticeUpdate(
								 id=page.data.id
								,notice=notice.data.id
								,content=mockedNoticeUpdateData.content
							);

							statusTest(response=response, code='201', status='Created');

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBeNumeric();
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
