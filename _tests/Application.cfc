component {
	this.name = "A TestBox Browser " & hash( getCurrentTemplatePath() );
	// any other application.cfc stuff goes below:
	this.sessionManagement = true;

	// any mappings go here, we create one that points to the root called test.
	this.mappings[ "/test" ] = getDirectoryFromPath( getCurrentTemplatePath() );

	// request start
	public boolean function onRequestStart( String targetPage ){

		return true;
	}
}