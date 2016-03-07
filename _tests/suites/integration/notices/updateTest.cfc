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

			scenario('Update a Notice...', function() {
				given('I call updateNotice()...', function() {
					when('I provide new arguments...', function() {
						then('I should get an updated Notice object with those values...', function() {
							var notice = variables.cfSorry.addNotice(
								 id=page.data.id
								,initial_comment=mockedNoticeData.initial_comment
							);

							var response = variables.cfSorry.updateNotice(
								 id=page.data.id
								,notice=notice.data.id
								,additional_comment="Updated Notice"
								,state_event="close"
							);

							statusTest(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBeNumeric();
							expect(data.state).toBe('closed');
							expect(data.created_at).toBeDate();
							expect(data.updated_at).toBeDate();
						});
					});
				});
			});
		});
	}
}
