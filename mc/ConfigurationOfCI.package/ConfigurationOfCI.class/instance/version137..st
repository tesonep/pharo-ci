versions
version137: spec
	<version: '1.37' imports: #('1.3-baseline')>

	spec for: #'common' do: [
		spec timestamp: '2014-09-25 13:26'.
		
		spec 
			project: 'Soup'          with: '1.2';
			project: 'CommandShell'  with: '1.1';
			project: 'XMLWriter'     with: #stable.
		
		spec 
			package: 'CI-Core'               with: 'CI-Core-EstebanLorenzano.481';
			package: 'CI-FogBugzAPI'         with: 'CI-FogBugzAPI-EstebanLorenzano.60';
			package: 'CI-Integration'        with: 'CI-Integration-EstebanLorenzano.97';
			package: 'CI-Loader'             with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].
