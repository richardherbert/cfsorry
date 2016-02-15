component extends='example._tests.BaseTest' {
	function beforeAll() {
		super.beforeAll();
	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		describe('GET "https://api.sorryapp.com/v1/hello" endpoint...', function() {
			beforeEach(function(currentSpec) {});
			afterEach(function(currentSpec) {});

			it(title='...and get back a ramdom response beginning with the text "Hello"', body=function() {
				var response = variables.cfSorry.getHello();

				debug(response);

				expect(response.data).toMatch('^Hello');
			}, data={});
		});
	}
}