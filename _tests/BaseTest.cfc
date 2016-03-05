component extends='testbox.system.BaseSpec' {
	function beforeAll() {
		variables.cfSorry = new example.cfSorry('myAccessToken');

		variables.mockedPageData = {
			 name: "My first Status Page"
			,timezone: "UTC"
			,support_email: "ellen.page@example.com"
			,support_telephone: "123 45678"
			,support_url: "http://www.example.com"
			,visible_to_search: "true"
			,meta_title: "My search meta title"
			,meta_description: "My search meta description which has to be a minimum of 50 characters."
			,google_analytics_id: "UA-99999-99"
		};

		variables.mockedPageDataSecond = {
			 name: "My second Status Page"
			,timezone: "Rome"
			,support_email: "jimmy.page@example.com"
			,support_telephone: "555 12345"
			,support_url: "https://www.example.com"
			,visible_to_search: "false"
			,meta_title: "My second search meta title"
			,meta_description: "My second search meta description which has to be a minimum of 50 characters."
			,google_analytics_id: "UA-22222-22"
		};

		variables.mockedPageDataUpdated = {
			 name: "My updated Status Page"
			,timezone: "Greenland"
			,support_email: "jimmy.page@example.com"
			,support_telephone: "555 54321"
			,support_url: "http://www.example.com/updated"
			,visible_to_search: "true"
			,meta_title: "My updated search meta title"
			,meta_description: "My updated search meta description which has to be a minimum of 50 characters."
			,google_analytics_id: "UA-00000-00"
		};

		variables.mockedBrandData = {
			 color_state_ok: "##999"
			,color_state_warning: "##999"
			,color_navbar_background: "##999"
			,color_navbar_links: "##999"
			,color_header_background: "##999"
			,color_header_links: "##999"
			,color_header_text: "##999"
			,color_body_background: "##999"
			,color_body_links: "##999"
			,color_body_text: "##999"
		};
	}

	function afterAll() {
	}

	function run() {
	}

	private void function statusTest(required struct response, code='200', error={}, failure=false, status='OK', success=true) {
		expect(response.code).toBe(arguments.code);
		expect(response.error).toBe(arguments.error);
		expect(response.failure).toBeFalse(arguments.failure);
		expect(response.status).toBe(arguments.status);
		expect(response.success).toBeTrue(arguments.success);
	}
}
