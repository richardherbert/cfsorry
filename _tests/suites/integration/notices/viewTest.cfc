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

			scenario('Get an existing Notice...', function() {
				given('I call getNotice()...', function() {
					when('I provide an existing Page id and Notice id...', function() {
						then('I should get the Notice object.', function() {
							var notice = variables.cfSorry.addNotice(
								 id=page.data.id
								,initial_comment=mockedNoticeData.initial_comment
							);

							var response = variables.cfSorry.getNotice(page.data.id, notice.data.id);

							statusTest(response);

							var data = response.data;

							expect(data).toBeStruct();

							expect(data.id).toBe(notice.data.id);
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
