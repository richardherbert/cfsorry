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

			scenario('Update a Notice Update...', function() {
				given('I call updateNoticeUpdate()...', function() {
					when('I provide new arguments...', function() {
						then('I should get an updated Notice Update object with those values...', function() {
							var update = variables.cfSorry.addNoticeUpdate(
								 id=page.data.id
								,notice=notice.data.id
								,content=mockedNoticeUpdateData.content
							);

							var response = variables.cfSorry.updateNoticeUpdate(
								 id=page.data.id
								,notice=notice.data.id
								,update=update.data.id
								,content=mockedNoticeUpdateDataUpdated.content
							);

							statusTest(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBeNumeric();
							expect(data.content).toBe(mockedNoticeUpdateDataUpdated.content);
							expect(data.created_at).toBeDate();
							expect(data.updated_at).toBeDate();
						});
					});
				});
			});
		});
	}
}
