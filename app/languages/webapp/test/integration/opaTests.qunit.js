sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'languages/test/integration/FirstJourney',
		'languages/test/integration/pages/LanguagesList',
		'languages/test/integration/pages/LanguagesObjectPage'
    ],
    function(JourneyRunner, opaJourney, LanguagesList, LanguagesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('languages') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLanguagesList: LanguagesList,
					onTheLanguagesObjectPage: LanguagesObjectPage
                }
            },
            opaJourney.run
        );
    }
);