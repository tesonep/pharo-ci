versions
version130: spec
	<version: '1.30' imports: #('1.3-baseline')>

	spec for: #'common' do: [
		spec timestamp: 'CamilloBruni 2013-10-16'.
		
		spec 
			project: 'Soup'          with: '1.2';
			project: 'CommandShell'  with: '1.1';
			project: 'XMLWriter'     with: #stable.
		
		spec 
			"ErwanDouaille CamilloBruni"
			package: 'CI-Core'               with: 'CI-Core-CamilloBruni.460';
			package: 'CI-FogBugzAPI'         with: 'CI-FogBugzAPI-CamilloBruni.49';
			package: 'CI-Integration'        with: 'CI-Integration-CamilloBruni.79';
			package: 'CI-Loader'             with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].
