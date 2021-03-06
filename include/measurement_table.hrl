%%========================================================================
%%  {name, plural, abbreviation, type, value}
%%========================================================================
-define(measurement_table,
	[
         {"unit","units","unit",undefined,1},
	 {"angstrom", "angstroms", "angstrom",distance, 10000000},
	 {"nanometer", "nanometers", "nm",distance, 1000000},
	 {"micrometer", "micrometers", "micron",distance, 1000},
	 {"millimeter", "millimeters", "mm",distance, 1},
	 {"centimeter", "centimeters", "cm", distance, 0.1},
	 {"decimeter", "decimeters", "dm", distance, 0.01},
	 {"meter", "meters", "m", distance, 0.001},
	 {"kilometer", "kilometers", "km", distance, 0.000001},
	 {"microinch", "microinches", "microinch", distance, 39370},
	 {"mil", "mil", "mil", distance, 39.37},
	 {"line", "line", "line", distance, 0.4724},
	 {"inch", "inches", "in", distance, 0.03937},
	 {"hand", "hands", "hand", distance, 0.009843},
	 {"link", "links", "link", distance, 0.004971},
	 {"survey foot", "survey feet", "survey foot", distance, 0.003281},
	 {"foot", "feet", "ft", distance, 0.003281},
	 {"yard", "yards", "yd", distance, 0.001094},
	 {"perch", "perches", "perch", distance,0.0001988},
	 {"rod", "rods", "rd", distance, 0.0001988},
	 {"chain", "chains", "chain", distance, 0.00004971},
	 {"furlong", "furlongs", "furlong", distance, 0.000004971},
	 {"mile", "miles", "mi", distance, 6.214e-7},
	 {"league", "leagues", "league", distance, 2.071e-7},
	 {"sea league", "sea leagues", "sea league", distance, 1.8e-7},
	 {"sea mile", "sea miles", "sea mile", distance, 5.4e-7},
	 {"cable", "cables", "cable", distance, 0.000004557},
	 {"short cable", "short cables", "short cable", distance, 0.0000054},
	 {"fathom", "fathoms", "fathom", distance, 0.0005468},
	 {"red shift", "red shifts", "z", distance, 7.676e-30},
	 {"parsec", "parsecs", "pc", distance, 3.241e-20},
	 {"light year", "light years", "light year", distance, 1.057e-19},
	 {"astronomical unit", "astronomical units", "au", distance, 6.685e-15},
	 {"light minute", "light minutes", "light minute", distance, 5.559e-14},
	 {"light second", "light seconds", "light second", distance, 3.336e-12},


	 {"celcius","celcius", "C",temperature,undefined},
	 {"fahrenheit","fahrenheit", "F",temperature,undefined},
	 {"kelvin", "kelvins", "K", temperature, undefined},
	 {"rankine", "rankines", "R", temperature, undefined},
	 {"delisle", "delisles", "De", temperature, undefined},
	 {"newtwon", "newtons", "N", temperature, undefined},
	 {"reaumur", "reaumur", "Re", temperature, undefined},
	 {"romer", "romers", "Ro", temperature, undefined},	 

	 {"atomic mass unit","atomic mass units", "amu",weight,602214200000000000000},
	 {"microgram","microrams", "mcg",weight,1000},
	 {"milligram","milligrams", "mg",weight,1},
	 {"centigram","centigrams", "centigram",weight,0.1},	 
	 {"gram", "grams", "g", weight,0.001},
	 {"carat","carats", "carat", weight,0.005},
	 {"newton (on Earth surface)","newtons (on Earth surface)", "Nes",weight,0.000009806652},
	 {"kilogram", "kilograms", "kg", weight, 0.000001},
	 {"centner", "centners", "centner", weight, 0.000000001},
	 {"kilonewton","kilonewton", "kN",weight,9.806652e-9},
	 {"tonne", "tonnes", "g", weight,0.0000000001},
	 {"kilotonne","kilotonnes", "kilotonne", weight,0.0000000000001},
	 {"stone","stones", "stone",weight,1.57473e-7},
	 {"pound","pounds", "lb",weight,0.000002204623},
	 {"ounce","ounces", "ounce",weight,0.00003527396},
	 {"dram","drams", "dr",weight,0.0005643834},
	 {"grain","grains", "gr",weight,0.01543236},
	 {"microliter","microliters", "ul",volume,1000},
	 {"milliliter","milliliters", "ml",volume,1},

	 {"centiliter","centiliters", "cl",volume,0.1},
	 {"deciliter","deciliters", "dl",volume,0.01},
	 {"liter","liters", "l",volume,0.001},
	 {"decaliter","decaliters", "decaliter",volume,0.0001},
	 {"hectoliter","hectoliters", "hl",volume,0.00001},
	 {"cubic millimeter","cubic millimeter", "mm3",volume,1000},
	 {"cubic centimeter","cubic centimeters", "cc",volume,1},
	 {"cubic decimeter","cubic decimeter", "dm3",volume,0.001},
	 {"cubic meter","cubic meters", "m3",volume,0.000001},

	 {"acre foot","acre feet", "acre foot",volume,8.107e-10},
	 {"barrel (petroleum)","barrel (petroleum)", "fluid barrel (U.S)",volume,0.00000629},
	 {"gallon (U.S.)","gallons (U.S.)", "gal (U.S.)",volume,0.0002642},
	 {"quart (U.S.)","quarts (U.S.)", "qt (U.S.)",volume,0.001057},
	 {"pint (U.S.)","pints (U.S.)", "pt (U.S.)",volume,0.002113},
	 {"gill (U.S.)","gills (U.S.)", "gill (U.S.)",volume,0.008454},
	 {"fluid ounce","fluid ounces", "oz (U.S.)",volume,0.03381},
	 {"fluid dram","fluid drams", "fluid dram",volume,0.2705},
	 {"minim","minims", "minim",volume,16.23},
	 {"barrel (U.S.)","barrels (U.S.)", "barrel (U.S)",volume,0.000008648},
	 {"bushel (U.S.)","bushels (U.S.)", "bu (U.S.)",volume,0.00002838},
	 {"peck (U.S.)","pecks (U.S.)", "pk (U.S.)",volume,0.0001135},
	 {"gallon (U.S.)","gallons (U.S.)", "gal (U.S.)",volume,0.000227},
	 {"quart (U.S.)","quarts (U.S.)", "qt (U.S.)",volume,0.0009081},
	 {"pint (U.S.)","pints (U.S.)", "pt (U.S.)",volume,0.001816},
	 {"gill","gills", "gill",volume,0.007265},
	 {"perch","perches", "perch",volume,0.000001427},
	 {"barrel","barrels", "barrel",volume,0.000006111},
	 {"bushel","bushels", "bu",volume,0.0000275},
	 {"peck","pecks", "pk",volume,0.00011},
	 {"gallon","gallons", "gal",volume,0.00022},
	 {"quart","quarts", "qt",volume,0.0008799},
	 {"pint","pints", "pt",volume,0.00176},
	 {"fluid ounce","fluid ounces", "fl. oz",volume,0.0352},
	 {"cubic yard","cubic yards", "yd3",volume,0.000001308},
	 {"cubic foot","cubic feet", "ft3",volume,0.00003531},
	 {"cubic inch","cubic inches", "in3",volume,0.06102},

	 {"cup (U.S.)","cups (U.S.)", "cup (U.S.)",cooking,0.004227},
	 {"tablespoon (U.S.)","tablespoons (U.S.)", "tblspn (U.S.)",cooking,0.06763},
	 {"teaspoon (U.S.)","teaspoons (U.S.)", "teaspn (U.S.)",cooking,0.2029},
	 {"cup","cups", "cup",cooking,0.004167},
	 {"tablespoon","tablespoons", "tblspn",cooking,0.06667},
	 {"teaspoon","teaspoons", "teaspn",cooking,0.2},
	 
	 {"Dirhams","United Arab Emirates Dirhams","AED",forex,undefined},
	 {"Afghanis","Afghanistan Afghanis","AFN",forex,undefined},
	 {"Leke","Albanian Leke","ALL",forex,undefined},
	 {"Drams","Armenian Drams","AMD",forex,undefined},
	 {"Florins)","Netherlands Antilles Florins)","ANG",forex,undefined},
	 {"Kwanza","Angola Kwanza","AOA",forex,undefined},
	 {"Pesos","Argentina Pesos","ARS",forex,undefined},
	 {"Dollars","Australian Dollars","AUD",forex,undefined},
	 {"Florins)","Aruba Guilders (also called Florins)","AWG",forex,undefined},
	 {"Manats","Azerbaijan New Manats","AZN",forex,undefined},
	 {"Marka","Bosnia and Herzegovina, convertible Marka","BAM",forex,undefined},
	 {"Dollars","Barbados Dollars","BBD",forex,undefined},
	 {"Taka","Bangladesh Taka","BDT",forex,undefined},
	 {"Leva","Bulgarian Leva","BGN",forex,undefined},
	 {"Dinars","Bahrain Dinars","BHD",forex,undefined},
	 {"Francs","Burundi Francs","BIF",forex,undefined},
	 {"Dollars","Bermuda Dollars","BMD",forex,undefined},
	 {"Dollars","Brunei Darussalam Dollars","BND",forex,undefined},
	 {"Bolivianos","Bolivia Bolivianos","BOB",forex,undefined},
	 {"Real","Brazil Real","BRL",forex,undefined},
	 {"Dollars","Bahamas Dollars","BSD",forex,undefined},
	 {"Ngultrum","Bhutan Ngultrum","BTN",forex,undefined},
	 {"Pulas","Botswana Pulas","BWP",forex,undefined},
	 {"Rubles","Belarus Rubles","BYR",forex,undefined},
	 {"Dollars","Belize Dollars","BZD",forex,undefined},
	 {"Dollars","Canada Dollars","CAD",forex,undefined},
	 {"Francs","Congo/Kinshasa, Congolese Francs","CDF",forex,undefined},
	 {"Francs","Switzerland Francs","CHF",forex,undefined},
	 {"Pesos","Chile Pesos","CLP",forex,undefined},
	 {"Renminbi","China,Yuan Renminbi","CNY",forex,undefined},
	 {"Pesos","Colombia Pesos","COP",forex,undefined},
	 {"Colones","Costa Rica Colones","CRC",forex,undefined},
	 {"Pesos","Cuba Pesos","CUP",forex,undefined},
	 {"Escudos","Cape Verde Escudos","CVE",forex,undefined},
	 {"Pounds","Cyprus Pounds)","CYP",forex,undefined},
	 {"Koruny","Czech Republic Koruny","CZK",forex,undefined},
	 {"Francs","Djibouti Francs","DJF",forex,undefined},
	 {"Kroner","Denmark Kroner","DKK",forex,undefined},
	 {"Pesos","Dominican Republic Pesos","DOP",forex,undefined},
	 {"Dinars","Algeria Dinars","DZD",forex,undefined},
	 {"Pounds","Egypt Pounds","EGP",forex,undefined},
	 {"Nakfa","Eritrea Nakfa","ERN",forex,undefined},
	 {"Birr","Ethiopia Birr","ETB",forex,undefined},
	 {"Euro","Euro Member Countries, Euro","EUR",forex,undefined},
	 {"Dollars","Fiji Dollars","FJD",forex,undefined},
	 {"Pounds","Falkland Islands (Malvinas) Pounds","FKP",forex,undefined},
	 {"Pounds","United Kingdom Pounds","GBP",forex,undefined},
	 {"Lari","Georgia Lari","GEL",forex,undefined},
	 {"Pounds","Guernsey Pounds","GGP",forex,undefined},
	 {"Cedis","Ghana Cedis","GHS",forex,undefined},
	 {"Pounds","Gibraltar Pounds","GIP",forex,undefined},
	 {"Dalasi","Gambia Dalasi","GMD",forex,undefined},
	 {"Francs","Guinea Francs","GNF",forex,undefined},
	 {"Quetzales","Guatemala Quetzales","GTQ",forex,undefined},
	 {"Dollars","Guyana Dollars","GYD",forex,undefined},
	 {"Dollars","Hong Kong Dollars","HKD",forex,undefined},
	 {"Lempiras","Honduras Lempiras","HNL",forex,undefined},
	 {"Kuna","Croatia Kuna","HRK",forex,undefined},
	 {"Gourdes","Haiti Gourdes","HTG",forex,undefined},
	 {"Forint","Hungary Forint","HUF",forex,undefined},
	 {"Rupiahs","Indonesia Rupiahs","IDR",forex,undefined},
	 {"Shekels","Israel New Shekels","ILS",forex,undefined},
	 {"Pounds","Isle of Man Pounds","IMP",forex,undefined},
	 {"Rupees","India Rupees","INR",forex,undefined},
	 {"Dinars","Iraq Dinars","IQD",forex,undefined},
	 {"Rials","Iran Rials","IRR",forex,undefined},
	 {"Kronur","Iceland Kronur","ISK",forex,undefined},
	 {"Pounds","Jersey Pounds","JEP",forex,undefined},
	 {"Dollars","Jamaica Dollars","JMD",forex,undefined},
	 {"Dinars","Jordan Dinars","JOD",forex,undefined},
	 {"Yen","Japan Yen","JPY",forex,undefined},
	 {"Shillings","Kenya Shillings","KES",forex,undefined},
	 {"Soms","Kyrgyzstan Soms","KGS",forex,undefined},
	 {"Riels","Cambodia Riels","KHR",forex,undefined},
	 {"Francs","Comoros Francs","KMF",forex,undefined},
	 {"Won","Korea Won","KPW",forex,undefined},
	 {"Won","Korea (South) Won","KRW",forex,undefined},
	 {"Dinars","Dinars","KWD",forex,undefined},
	 {"Dollars","Dinars Cayman Islands Dollars","KYD",forex,undefined},
	 {"Tenge","Kazakhstan Tenge","Kazakhstan KZT",forex,undefined},
	 {"Kips","Laos Kips","LAK",forex,undefined},
	 {"Pounds","Kips Lebanon Pounds","LBP",forex,undefined},
	 {"Rupees","Sri Lanka Rupees","Sri LKR",forex,undefined},
	 {"Dollars","Liberia Dollars","Dollars LRD",forex,undefined},
	 {"Maloti","Lesotho Maloti","Maloti LSL",forex,undefined},
	 {"Litai","Lithuania Litai","Litai LTL",forex,undefined},
	 {"Lati","Latvia Lati","LVL",forex,undefined},
	 {"Dinars","Lati Libya, Dinars","LYD",forex,undefined},
	 {"Dirhams","Morocco Dirhams","Morocco MAD",forex,undefined},
	 {"Lei","Moldova Lei","MDL", forex,undefined},
	 {"Ariary","Madagascar Ariary","Ariary MGA",forex,undefined},
	 {"Denars","Macedonia Denars","Denars MKD",forex,undefined},
	 {"Kyats","Myanmar (Burma) Kyats","Burma MMK",forex,undefined},
	 {"Tugriks","Mongolia Tugriks","Tugriks MNT",forex,undefined},
	 {"Patacas","Macau Patacas","MOP",forex,undefined},
	 {"Ouguiyas","Patacas  Mauritania, Ouguiyas","MRO",forex,undefined},
	 {"Liri","Malta Liri","MTL", forex,undefined},
	 {"Rupees","Mauritius Rupees","MUR",forex,undefined},
	 {"Rufiyaa","Maldives (Maldive Islands), Rufiyaa","MVR",forex,undefined},
	 {"Kwachas","Malawi Kwachas","MWK",forex,undefined},
	 {"Pesos","Kwachas Mexico Pesos","MXN",forex,undefined},
	 {"Ringgits","Malaysia Ringgits","Malaysia MYR",forex,undefined},
	 {"Meticais","Mozambique Meticais","Meticais MZN",forex,undefined},
	 {"Dollars","Namibia Dollars","Dollars NAD",forex,undefined},
	 {"Nairas","Nigeria Nairas","Nairas NGN",forex,undefined},
	 {"Cordobas","Nicaragua Cordobas","Cordobas NIO",forex,undefined},
	 {"Krone","Norway Krone","NOK",forex,undefined},
	 {"Rupees","Krone Nepal Rupees","NPR",forex,undefined},
	 {"Dollars","New Zealand Dollars","NZD",forex,undefined},
	 {"Rials","Oman Rials","OMR",forex,undefined},
	 {"Balboa","Rials Panama Balboa","PAB",forex,undefined},
	 {"Soles","Peru, Nuevos Soles","PEN",forex,undefined},
	 {"Kina","Papua New Guinea, Kina","PGK",forex,undefined},
	 {"Pesos","Philippines Pesos","PHP",forex,undefined},
	 {"Rupees","Pakistan Rupees","PKR",forex,undefined},
	 {"Zlotych","Poland Zlotych","PLN",forex,undefined},
	 {"Guarani","Zlotych Paraguay, Guarani","PYG",forex,undefined},
	 {"Rials","Qatar Rials","QAR",forex,undefined},
	 {"Lei","Romania New Lei","RON", forex,undefined},
	 {"Dinars","Serbia Dinars","RSD",forex,undefined},
	 {"Rubles","Dinars Russia Rubles","RUB",forex,undefined},
	 {"Francs","Rwanda Francs","RWF",forex,undefined},
	 {"Riyals","Saudi Arabia Riyals","SAR",forex,undefined},
	 {"Dollars","Solomon Islands, Dollars","SBD",forex,undefined},
	 {"Rupees","Seychelles Rupees","SCR",forex,undefined},
	 {"Pounds","Sudan Pounds","SDG",forex,undefined},
	 {"Kronor","Sweden Kronor","SEK",forex,undefined},
	 {"Dollars","Singapore Dollars","SGD",forex,undefined},
	 {"Pounds","Saint Helena Pounds","SHP",forex,undefined},
	 {"Leones","Sierra Leone, Leones","SLL",forex,undefined},
	 {"Shillings","Somalia Shillings","SOS",forex,undefined},
	 {"Luigini","Seborga Luigini","SPL",forex,undefined},
	 {"Dollars","Suriname Dollars","SRD",forex,undefined},
	 {"Dobras","São Tome and Principe, Dobras","STD",forex,undefined},
	 {"Colones","El Salvador Colones","SVC",forex,undefined},
	 {"Pounds","Syria Pounds","SYP",forex,undefined},
	 {"Emalangeni","Swaziland Emalangeni","SZL",forex,undefined},
	 {"Baht","Thailand Baht","THB", forex,undefined},
	 {"Somoni","Tajikistan Somoni","TJS",forex,undefined},
	 {"Manats","Turkmenistan Manats","TMM",forex,undefined},
	 {"Dinars","Tunisia Dinars","TND",forex,undefined},
	 {"Tonga Pa\'anga","anga Tonga Pa\'anga","TOP",forex,undefined},
	 {"Lira","Turkish Lira","TRY",forex,undefined},
	 {"Dollars","Trinidad Lira and Tobago, Dollars","TTD",forex,undefined},
	 {"Dollars","Tuvalu Dollars","TVD",forex,undefined},
	 {"Dollars","Taiwan New Dollars","TWD",forex,undefined},
	 {"Shillings","Tanzania Shillings","TZS",forex,undefined},
	 {"Hryvnia","Ukraine Hryvnia Hryvnia","UAH",forex,undefined},
	 {"Shillings","Uganda Shillings","UGX",forex,undefined},
	 {"Dollars","U.S. Dollars","USD",forex,undefined},
	 {"Pesos","Uruguay Pesos","UYU",forex,undefined},
	 {"Sums","Uzbekistan Sums","UZS",forex,undefined},
	 {"Bolivares","Venezuela Sums Bolivares","VEB",forex,undefined},
	 {"Bolivares Fuertes","Venezuela, Bolivares Fuertes","VEF",forex,undefined},
	 {"Dong","Viet Nam Dong","VND",forex,undefined},
	 {"Vatu","Vanuatu Dong Vatu","VUV",forex,undefined},
	 {"Tala","Samoa Tala","WST",forex,undefined},
	 {"Francs","Communauté Tala Financière Africaine BEAC, Francs","XAF",forex,undefined},
	 {"Ounces","Francs Silver Ounces","XAG",forex,undefined},
	 {"Ounces","Gold Ounces","XAU",forex,undefined},
	 {"Dollars","East Caribbean Dollars","XCD",forex,undefined},
	 {"Ounces","Palladium Ounces","XPD",forex,undefined},
	 {"Francs","Comptoirs XPD Français du Pacifique Francs","XPF",forex,undefined},
	 {"Ounces","Platinum Ounces","Ounces XPT",forex,undefined},
	 {"Rials","Yemen Rials","YER",forex,undefined},
	 {"Rand","South Africa Rand","ZAR",forex,undefined},
	 {"Kwacha","Zambia Kwacha","ZMK",forex,undefined},
	 {"Dollars","Zimbabwe Dollars","ZWD",forex,undefined}

	]).



