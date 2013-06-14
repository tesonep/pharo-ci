baselines
baselineDev: spec
	<version: 'dev-baseline'>

	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
	
		self soup: spec;
			fileSystemLegacy: spec;
			commandShell: spec;
			fuelMetalevel: spec;
			zinc: spec;
			xmlWriter: spec;
			seamless: spec.
				
		spec
			package: 'CI-Core' with: [ 
				spec requires: #('FuelMetalevel'  'FileSystem-Legacy' 'CommandShell' 'XMLWriter' 'Seamless')];
			package: 'CI-FogBugzAPI' with: [ 
				spec requires: #('CI-Core')];
			package: 'CI-GoogleIssueTracker' with: [
				spec requires: #('CI-Core')];
			package: 'CI-Integration' with: [ 
				spec requires: #('CI-Core' 'CI-FogBugzAPI' 'Soup' 'CommandShell')];
			package: 'CI-Loader' with: [ 
				spec requires: #('Soup' 'CI-Core')].
			
		spec 
			group: 'default' with: #('CI-Core' 'CI-Integration' 'CI-Loader');
			group: 'core'    with: #('CI-Core') ]