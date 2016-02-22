component {
	cfSorry function init(required string apiToken) {
		variables.apiToken = arguments.apiToken;

		variables.endpointURL = 'https://api.sorryapp.com/v1';
		variables.charset = 'utf-8';

		return this;
	}

	function getVersion() {
		return 'v0.2';
	}

	function getPages() {
		var packet = {
			 resource: '/pages'
			,method = 'GET'
		};

		var response = send(packet);
		var parsedResponse = parseResponse(response);

		return parsedResponse;
	}

	function getPage(required string id) {
		var packet = {
			 resource: '/pages/#arguments.id#'
			,method = 'GET'
		};

		var response = send(packet);
		var parsedResponse = parseResponse(response);

		return parsedResponse;
	}

	function addPage(
		 string name=''
		,string timezone=''
		,string support_email=''
		,string support_telephone=''
		,string support_url=''
		,string visible_to_search=''
		,string meta_title=''
		,string meta_description=''
		,string google_analytics_id=''
	) {
		var packet = {
			 resource: '/pages'
			,method = 'POST'
		};

		packet.params = [];

		for (var argument in arguments) {
			arrayAppend(packet.params, {name=argument, value=arguments[argument]});
		}

		var response = send(packet);
		var parsedResponse = parseResponse(response);

		return parsedResponse;
	}

	function updatePage(
		 required string id
		,string name=''
		,string timezone=''
		,string support_email=''
		,string support_telephone=''
		,string support_url=''
		,string visible_to_search=''
		,string meta_title=''
		,string meta_description=''
		,string google_analytics_id=''
	) {
		var packet = {
			 resource: '/pages/#arguments.id#'
			,method = 'PATCH'
		};

		packet.params = [];

		for (var argument in arguments) {
			arrayAppend(packet.params, {name=argument, value=arguments[argument]});
		}

		var response = send(packet);
		var parsedResponse = parseResponse(response);

		return parsedResponse;
	}

	function deletePage(required string id) {
		var packet = {
			 resource: '/pages/#arguments.id#'
			,method = 'DELETE'
		};

		var response = send(packet);
		var parsedResponse = parseResponse(response);

		return parsedResponse;
	}

/////////////////////////////////////////////////////////////////////

	function getTimezones() {
		var packet = {
			 resource: '/timezones'
			,method = 'GET'
		};

		var response = send(packet);
		var parsedResponse = parseResponse(response);

		return parsedResponse;
	}

/////////////////////////////////////////////////////////////////////

	function getHello() {
		var packet = {
			 resource: '/hello'
			,method = 'GET'
		};

		var response = send(packet);
		var parsedResponse = parseResponse(response);

		return parsedResponse;
	}

/////////////////////////////////////////////////////////////////////
// private methods
/////////////////////////////////////////////////////////////////////
	private struct function send(required struct packet)
		hint='I send the data packet to the http service'
	{
		var endpointURL = variables.endpointURL & arguments.packet.resource;

		var httpService = new http();

		httpService['getParameters'] = getParameters;

		switch(packet.method){
			case "POST":
			case "PATCH":
				httpService.addParam(name='Content-Type', type='header', value='application/x-www-form-urlencoded; charset=UTF-8');

				for (var param in arguments.packet.params) {
					endpointURL = listAppend(endpointURL, '#param.name#=#urlEncodedFormat(param.value)#', '&');
				}

// replace the first & with ? so the URL is compliant
				endpointURL = replaceNoCase(endpointURL, '&', '?', 'one');
			break;
		}

		httpService.setURL(endpointURL);
		httpService.setMethod(packet.method);
		httpService.setCharset(variables.charset);

		httpService.addParam(name='wrapper', value='cfSorry', type='header');
		httpService.addParam(name='Authorization', value='Bearer #variables.apiToken#', type='header');

		response = httpService.send().getPrefix();

		return response;
	}

	private struct function parseResponse(required struct response)
		hint='I parse the response'
	{
		var result = {
			 success = true
			,failure = false
			,data = {}
			,error = {}
			,code = '200'
			,status = 'OK'
		};

		var fileContentJSON = arguments.response.filecontent.toString();

		if (isSimpleValue(fileContentJSON) && fileContentJSON == 'Connection Failure') {
			result.success = false;
			result.failure = true;
			result.error = 'Connection Failure';
			result.code = '503';
			result.status = 'Connection Failure';

			return result;
		}

		var statusCode = arguments.response.responseHeader.status_code;
		var statusText = arguments.response.responseHeader.explanation;

		result.code = statusCode;
		result.status = statusText;

// replace all the "null" values in the JSON packet with a ColdFusion empty string
		fileContentJSON = reReplaceNoCase(fileContentJSON, ':null', ':""', "all");

		switch(statusCode) {
			case '200':
			case '201':
			case '204':
				if (len(fileContentJSON) == 0) {
					result.data = {};
				} else {
					result.data = deserializeJSON(fileContentJSON).response;
				}
			break;

			default:
				if (len(fileContentJSON) == 0) {
					result.error = {};
				} else {
					result.error = deserializeJSON(fileContentJSON);
				}

				result.success = false;
				result.failure = true;
				result.data = {};
			break;
		}

		parseDateTimeStrings(result, 'created_at');
		parseDateTimeStrings(result, 'updated_at');

		return result;
	}

	private struct function parseDateTimeStrings(required struct data, required string key)
		hint='I parse a date/time string into a ColdFusion datetime object'
	{
		var entries = structFindKey(arguments.data, arguments.key, 'all');

		for (var entry in entries) {
			var newValue = parseDateTime(entry.value);

			structUpdate(entry.owner, arguments.key, newValue);
		}

		return arguments.data;
	}

	private array function getParameters()
		hint='I return the HTTP service parameters'
	{
		return variables.params;
	}
}