# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create([
                  { name: 'Lego Inc.' },
                  { name: 'Nike' },
                  { name: 'BYU' },
                  { name: 'Marvel' },
                  { name: 'Happy Madison' },
                  { name: 'Betty Crocker' },
                  { name: 'Johnny Knoxville' },
                  { name: 'Extra' }
                ])

CompArray.create([
                   {
                     description: 'Kevin Worthin asked for this array',
                     install_date: '2015-05-01',
                     initial_value: 120_000.00,
                     location: 'Provo, UT',
                     customer: Customer.find_by(name: 'BYU'),
                     serial_number: 'C3P0-R2D2'
                   },
                   {
                     description: 'Bubble Gum',
                     install_date: '2015-04-02',
                     initial_value: 43_000.00,
                     location: 'Provo, UT',
                     customer: Customer.find_by(name: 'BYU'),
                     serial_number: '8910385'
                   },
                   {
                     description: "George Foreman's Grill Array",
                     install_date: '2016-02-26',
                     initial_value: 15_000.00,
                     location: 'New York, NY',
                     customer: Customer.find_by(name: 'Betty Crocker'),
                     serial_number: '8675309'
                   },
                   {
                     description: "Polly Pocket Database",
                     install_date: '2015-02-03',
                     initial_value: 80_053.00,
                     location: 'Dallas, TX',
                     customer: Customer.find_by(name: 'Marvel'),
                     serial_number: 'HUNGRYH1PP0S'
                   },
                   {
                     description: "Arrays for days",
                     install_date: '2016-03-17',
                     initial_value: 170_000.00,
                     location: 'Tulsa, OK',
                     customer: Customer.find_by(name: 'Johnny Knoxville'),
                     serial_number: 'GR347'
                   },
                   {
                     description: "Happiest array in the world",
                     install_date: '2016-05-01',
                     initial_value: 30_000.00,
                     location: 'Bentonville, AR',
                     customer: Customer.find_by(name: 'BYU'),
                     serial_number: 'V4N4D1UM'
                   },
                   {
                     description: "The last array",
                     install_date: '2013-10-14',
                     initial_value: 100_000.00,
                     location: 'Anchorage, AK',
                     customer: Customer.find_by(name: 'Lego Inc.'),
                     serial_number: 'MU51C'
                   },
                   {
                     description: "Lego's first array",
                     install_date: '2015-10-01',
                     initial_value: 1_000.00,
                     location: 'Dallas, TX',
                     customer: Customer.find_by(name: 'Lego Inc.'),
                     serial_number: 'TT3401'
                   },
                   {
                     description: "Bought in late 2013, installed first of the month",
                     install_date: '2014-01-01',
                     initial_value: 50_000.00,
                     location: 'Pittsburgh, PA',
                     customer: Customer.find_by(name: 'Nike'),
                     serial_number: '391INEJ'
                   },
                   {
                     description: "New Array for San Francisco",
                     install_date: '2016-01-16',
                     initial_value: 55_000.00,
                     location: 'San Francisco, CA',
                     customer: Customer.find_by(name: 'Happy Madison'),
                     serial_number: 'O10l0IOl1'
                   }
                 ])

Component.create([
                   {
                     description: 'Flashy lightbulbs for the array',
                     install_date: '2015-10-30',
                     initial_value: 30_000.00,
                     comp_array: CompArray.find_by(description: 'Kevin Worthin asked for this array')
                   },
                   {
                     description: 'Gumby vs. Hulk',
                     install_date: '2016-03-04',
                     initial_value: 30.00,
                     comp_array: CompArray.find_by(description: 'New Array for San Francisco')
                   },
                   {
                     description: 'I forgot what this is linked to, but we needed more RAM',
                     install_date: '2016-09-10',
                     initial_value: 6_500.00,
                     comp_array: CompArray.find_by(description: 'Bubble Gum')
                   },
                   {
                     description: 'I have a lot of homework',
                     install_date: '2016-01-01',
                     initial_value: 2_00.00,
                     comp_array: CompArray.find_by(description: "Lego's first array")
                   },
                   {
                     description: 'Samsung is better',
                     install_date: '2016-04-01',
                     initial_value: 1_50.00,
                     comp_array: CompArray.find_by(description: "George Foreman's Grill Array")
                   },
                 ])
