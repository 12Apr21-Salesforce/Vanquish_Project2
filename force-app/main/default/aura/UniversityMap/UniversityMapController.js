({
    init: function (cmp, event, helper) {

        cmp.set('v.mapMarkers', [
        {
            location: {
                // Location Information
                City: 'Cambridge',
                Country: 'USA',
                PostalCode: '02138',
                State: 'MA',
                // Street: '',
            },

            // For onmarkerselect
            value: 'U1',

            // Extra info for tile in list and info window
            title: 'Harvard University',
            description: 'Uncover a world of possibility, as limitless as your imagination.',
        },
        {
            location: {
                // Location Information
                City: 'Providence',
                Country: 'USA',
                PostalCode: '02912',
                State: 'RI',
            },

            // For onmarkerselect
            value: 'U2',

            // Extra info for tile in list
            title: 'Brown University',
            description: 'At Brown, our students have the freedom to choose their academic journeys.',
        },
        {
            location: {
                // Location Information
                City: 'Ithaca',
                Country: 'USA',
                PostalCode: '14850',
                State: 'NY',
            },

            // For onmarkerselect
            value: 'U3',

            // Extra info for tile in list
            title: 'Cornell University',
            description: 'I would found an institution where any person can find instruction in any study. - Ezra Cornell, 1868',
        },
        {
            location: {
                // Location Information
                City: 'Durham',
                Country: 'USA',
                PostalCode: '27708',
                State: 'NC',
            },

            // For onmarkerselect
            value: 'U4',

            // Extra info for tile in list
            title: 'Duke University',
            description: 'Private research school with gardens & dramatic buildings is known for medicine & basketball.',
        },
        {
            location: {
                // Location Information
                City: 'Cambridge',
                Country: 'USA',
                PostalCode: '02139',
                State: 'MA',
                Street: '77 Massachusetts Ave',
            },

            // For onmarkerselect
            value: 'U5',

            // Extra info for tile in list
            title: 'Massachusetts Institute of Technology',
            description: 'The MIT community is driven by a shared purpose: to make a better world through education, research, and innovation. We are fun and quirky, elite but not elitist, inventive and artistic, obsessed with numbers, and welcoming to talented people regardless of where they come from.',
        },
        {
            location: {
                // Location Information
                City: 'College Station',
                Country: 'USA',
                PostalCode: '77843',
                State: 'TX',
                Street: '400 Bizzell St',
            },

            // For onmarkerselect
            value: 'U6',

            // Extra info for tile in list
            title: 'Texas A&M University',
            description: 'Texas A&M opened its doors in 1876 as the state\'s first public institution of higher learning. Today, we stand as a research-intensive flagship university dedicated to sending Aggie leaders out into the world prepared to take on the challenges of tomorrow.',
        },
        {
            location: {
                // Location Information
                City: 'Notre Dame',
                Country: 'USA',
                PostalCode: '46556',
                State: 'IN',
            },

            // For onmarkerselect
            value: 'U7',

            // Extra info for tile in list
            title: 'University of Notre Dame',
            description: 'In an ever-shrinking world, Notre Dame seeks to approach problems in context.',
        },
        {
            location: {
                // Location Information
                City: 'Eugene',
                Country: 'USA',
                PostalCode: '97403',
                State: 'OR',
                Street: '1585 E 13th Ave',
            },

            // For onmarkerselect
            value: 'U8',

            // Extra info for tile in list
            title: 'University of Oregon',
            description: 'Nestled in the lush Willamette Valley, with an easy drive to both the Pacific Ocean and the Cascade Mountains, the University of Oregon is renowned for its research prowess and commitment to teaching.',
        },
        {
            location: {
                // Location Information
                City: 'Seattle',
                Country: 'USA',
                PostalCode: '98195',
                State: 'WA',
                Street: '4001 E Stevens Way NE',
            },

            // For onmarkerselect
            value: 'U9',

            // Extra info for tile in list
            title: 'University of Washington',
            description: 'What are you driven to discover? A lifesaving cure? An entirely new art form? A solution for greener technologies? At the UW, you’ll do more than read about change; you’ll be the catalyst making positive change happen. Explore our colleges, schools and programs.',
        },
        {
            location: {
                // Location Information
                City: 'New Haven',
                Country: 'USA',
                PostalCode: '06520',
                State: 'CT',
            },

            // For onmarkerselect
            value: 'U10',

            // Extra info for tile in list
            title: 'Yale University',
            description: 'Since its founding in 1701, Yale has been dedicated to expanding and sharing knowledge, inspiring innovation, and preserving cultural and scientific information for future generations.',
        }
    ]);

    cmp.set('v.markersTitle', 'United States Universities');

        cmp.set('v.mapOptions', {
            draggable: false, 
            disableDefaultUI: true,
            scrollwheel: false,
            zoomControl: false 
        })
    },

    handleMarkerSelect: function (cmp, event, helper) {
        var marker = event.getParam("selectedMarkerValue");
    }
})