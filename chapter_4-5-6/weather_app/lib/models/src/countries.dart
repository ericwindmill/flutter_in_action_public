// original : https://raw.githubusercontent.com/biessek/flutter_country_picker/master/lib/country.dart

import 'package:flutter/foundation.dart';

class Country {
  final String dialingCode;
  final String isoCode;
  final String name;

  const Country({
    @required this.dialingCode,
    @required this.isoCode,
    this.name = "",
  });

  @override
  bool operator ==(o) =>
      o is Country &&
      o.dialingCode == this.dialingCode &&
      o.isoCode == this.isoCode &&
      o.name == this.name;

  int get hashCode {
    int hash = 7;
    hash = 31 * hash + this.dialingCode.hashCode;
    hash = 31 * hash + this.name.hashCode;
    hash = 31 * hash + this.isoCode.hashCode;
    return hash;
  }

  static const Country AD = Country(
    dialingCode: "376",
    isoCode: "AD",
    name: "andorra",
  );
  static const Country AE = Country(
    dialingCode: "971",
    isoCode: "AE",
    name: "United Arab Emirates",
  );
  static const Country AF = Country(
    dialingCode: "93",
    isoCode: "AF",
    name: "Afghanistan",
  );
  static const Country AG = Country(
    dialingCode: "1",
    isoCode: "AG",
    name: "Antigua and Barbuda",
  );
  static const Country AI = Country(
    dialingCode: "1",
    isoCode: "AI",
    name: "Anguilla",
  );
  static const Country AL = Country(
    dialingCode: "355",
    isoCode: "AL",
    name: "Albania",
  );
  static const Country AM = Country(
    dialingCode: "374",
    isoCode: "AM",
    name: "Armenia",
  );
  static const Country AO = Country(
    dialingCode: "244",
    isoCode: "AO",
    name: "Angola",
  );
  static const Country AQ = Country(
    dialingCode: "672",
    isoCode: "AQ",
    name: "Antarctica",
  );
  static const Country AR = Country(
    dialingCode: "54",
    isoCode: "AR",
    name: "Argentina",
  );
  static const Country AS = Country(
    dialingCode: "1",
    isoCode: "AS",
    name: "American Samoa",
  );
  static const Country AT = Country(
    dialingCode: "43",
    isoCode: "AT",
    name: "Austria",
  );
  static const Country AU = Country(
    dialingCode: "61",
    isoCode: "AU",
    name: "Australia",
  );
  static const Country AW = Country(
    dialingCode: "297",
    isoCode: "AW",
    name: "Aruba",
  );
  static const Country AX = Country(
    dialingCode: "358",
    isoCode: "AX",
    name: "Aaland Islands",
  );
  static const Country AZ = Country(
    dialingCode: "994",
    isoCode: "AZ",
    name: "Azerbaijan",
  );
  static const Country BA = Country(
    dialingCode: "387",
    isoCode: "BA",
    name: "Bosnia and Herzegowina",
  );
  static const Country BB = Country(
    dialingCode: "1",
    isoCode: "BB",
    name: "Barbados",
  );
  static const Country BD = Country(
    dialingCode: "880",
    isoCode: "BD",
    name: "Bangladesh",
  );
  static const Country BE = Country(
    dialingCode: "32",
    isoCode: "BE",
    name: "Belgium",
  );
  static const Country BF = Country(
    dialingCode: "226",
    isoCode: "BF",
    name: "Burkina Faso",
  );
  static const Country BG = Country(
    dialingCode: "359",
    isoCode: "BG",
    name: "Bulgaria",
  );
  static const Country BH = Country(
    dialingCode: "973",
    isoCode: "BH",
    name: "Bahrain",
  );
  static const Country BI = Country(
    dialingCode: "257",
    isoCode: "BI",
    name: "Burundi",
  );
  static const Country BJ = Country(
    dialingCode: "229",
    isoCode: "BJ",
    name: "Benin",
  );
  static const Country BL = Country(
    dialingCode: "590",
    isoCode: "BL",
    name: "Saint-Barthélemy",
  );
  static const Country BM = Country(
    dialingCode: "1",
    isoCode: "BM",
    name: "Bermuda",
  );
  static const Country BN = Country(
    dialingCode: "673",
    isoCode: "BN",
    name: "Brunei Darussalam",
  );
  static const Country BO = Country(
    dialingCode: "591",
    isoCode: "BO",
    name: "Bolivia",
  );
  static const Country BQ = Country(
    dialingCode: "599",
    isoCode: "BQ",
    name: "Bonaire, Sint Eustatius and Saba",
  );
  static const Country BR = Country(
    dialingCode: "55",
    isoCode: "BR",
    name: "Brazil",
  );
  static const Country BS = Country(
    dialingCode: "1",
    isoCode: "BS",
    name: "Bahamas",
  );
  static const Country BT = Country(
    dialingCode: "975",
    isoCode: "BT",
    name: "Bhutan",
  );
  static const Country BV = Country(
    dialingCode: "55",
    isoCode: "BV",
    name: "Bouvet Island",
  );
  static const Country BW = Country(
    dialingCode: "267",
    isoCode: "BW",
    name: "Botswana",
  );
  static const Country BY = Country(
    dialingCode: "375",
    isoCode: "BY",
    name: "Belarus",
  );
  static const Country BZ = Country(
    dialingCode: "501",
    isoCode: "BZ",
    name: "Belize",
  );
  static const Country CA = Country(
    dialingCode: "1",
    isoCode: "CA",
    name: "Canada",
  );
  static const Country CC = Country(
    dialingCode: "891",
    isoCode: "CC",
    name: "Cocos (Keeling) Islands",
  );
  static const Country CD = Country(
    dialingCode: "243",
    isoCode: "CD",
    name: "Congo, Democratic Republic Of (Was Zaire)",
  );
  static const Country CF = Country(
    dialingCode: "236",
    isoCode: "CF",
    name: "Central African Republic",
  );
  static const Country CG = Country(
    dialingCode: "242",
    isoCode: "CG",
    name: "Congo, Republic Of",
  );
  static const Country CH = Country(
    dialingCode: "41",
    isoCode: "CH",
    name: "Switzerland",
  );
  static const Country CI = Country(
    dialingCode: "225",
    isoCode: "CI",
    name: "Cote D'ivoire",
  );
  static const Country CK = Country(
    dialingCode: "682",
    isoCode: "CK",
    name: "Cook Islands",
  );
  static const Country CL = Country(
    dialingCode: "56",
    isoCode: "CL",
    name: "Chile",
  );
  static const Country CM = Country(
    dialingCode: "237",
    isoCode: "CM",
    name: "Cameroon",
  );
  static const Country CN = Country(
    dialingCode: "86",
    isoCode: "CN",
    name: "China",
  );
  static const Country CO = Country(
    dialingCode: "57",
    isoCode: "CO",
    name: "Colombia",
  );
  static const Country CR = Country(
    dialingCode: "506",
    isoCode: "CR",
    name: "Costa Rica",
  );
  static const Country CU = Country(
    dialingCode: "53",
    isoCode: "CU",
    name: "Cuba",
  );
  static const Country CV = Country(
    dialingCode: "238",
    isoCode: "CV",
    name: "Cape Verde",
  );
  static const Country CW = Country(
    dialingCode: "599",
    isoCode: "CW",
    name: "Curaçao",
  );
  static const Country CX = Country(
    dialingCode: "61",
    isoCode: "CX",
    name: "Christmas Island",
  );
  static const Country CY = Country(
    dialingCode: "357",
    isoCode: "CY",
    name: "Cyprus",
  );
  static const Country CZ = Country(
    dialingCode: "420",
    isoCode: "CZ",
    name: "Czech Republic",
  );
  static const Country DE = Country(
    dialingCode: "49",
    isoCode: "DE",
    name: "Germany",
  );
  static const Country DJ = Country(
    dialingCode: "253",
    isoCode: "DJ",
    name: "Djibouti",
  );
  static const Country DK = Country(
    dialingCode: "45",
    isoCode: "DK",
    name: "Denmark",
  );
  static const Country DM = Country(
    dialingCode: "1",
    isoCode: "DM",
    name: "Dominica",
  );
  static const Country DO = Country(
    dialingCode: "1",
    isoCode: "DO",
    name: "Dominican Republic",
  );
  static const Country DZ = Country(
    dialingCode: "213",
    isoCode: "DZ",
    name: "Algeria",
  );
  static const Country EC = Country(
    dialingCode: "593",
    isoCode: "EC",
    name: "Ecuador",
  );
  static const Country EE = Country(
    dialingCode: "372",
    isoCode: "EE",
    name: "Estonia",
  );
  static const Country EG = Country(
    dialingCode: "20",
    isoCode: "EG",
    name: "Egypt",
  );
  static const Country EH = Country(
    dialingCode: "212",
    isoCode: "EH",
    name: "Western Sahara",
  );
  static const Country ER = Country(
    dialingCode: "291",
    isoCode: "ER",
    name: "Eritrea",
  );
  static const Country ES = Country(
    dialingCode: "34",
    isoCode: "ES",
    name: "Spain",
  );
  static const Country ET = Country(
    dialingCode: "251",
    isoCode: "ET",
    name: "Ethiopia",
  );
  static const Country FI = Country(
    dialingCode: "358",
    isoCode: "FI",
    name: "Finland",
  );
  static const Country FJ = Country(
    dialingCode: "679",
    isoCode: "FJ",
    name: "Fiji",
  );
  static const Country FK = Country(
    dialingCode: "500",
    isoCode: "FK",
    name: "Falkland Islands (Malvinas)",
  );
  static const Country FM = Country(
    dialingCode: "691",
    isoCode: "FM",
    name: "Micronesia, Federated States Of",
  );
  static const Country FO = Country(
    dialingCode: "298",
    isoCode: "FO",
    name: "Faroe Islands",
  );
  static const Country FR = Country(
    dialingCode: "33",
    isoCode: "FR",
    name: "France",
  );
  static const Country GA = Country(
    dialingCode: "241",
    isoCode: "GA",
    name: "Gabon",
  );
  static const Country GB = Country(
    dialingCode: "44",
    isoCode: "GB",
    name: "United Kingdom",
  );
  static const Country GD = Country(
    dialingCode: "1",
    isoCode: "GD",
    name: "Grenada",
  );
  static const Country GE = Country(
    dialingCode: "995",
    isoCode: "GE",
    name: "Georgia",
  );
  static const Country GF = Country(
    dialingCode: "594",
    isoCode: "GF",
    name: "French Guiana",
  );
  static const Country GG = Country(
    dialingCode: "44",
    isoCode: "GG",
    name: "Guernsey",
  );
  static const Country GH = Country(
    dialingCode: "233",
    isoCode: "GH",
    name: "Ghana",
  );
  static const Country GI = Country(
    dialingCode: "350",
    isoCode: "GI",
    name: "Gibraltar",
  );
  static const Country GL = Country(
    dialingCode: "299",
    isoCode: "GL",
    name: "Greenland",
  );
  static const Country GM = Country(
    dialingCode: "220",
    isoCode: "GM",
    name: "Gambia",
  );
  static const Country GN = Country(
    dialingCode: "224",
    isoCode: "GN",
    name: "Guinea",
  );
  static const Country GP = Country(
    dialingCode: "590",
    isoCode: "GP",
    name: "Guadeloupe",
  );
  static const Country GQ = Country(
    dialingCode: "240",
    isoCode: "GQ",
    name: "Equatorial Guinea",
  );
  static const Country GR = Country(
    dialingCode: "30",
    isoCode: "GR",
    name: "Greece",
  );
  static const Country GS = Country(
    dialingCode: "500",
    isoCode: "GS",
    name: "South Georgia and The South Sandwich Islands",
  );
  static const Country GT = Country(
    dialingCode: "502",
    isoCode: "GT",
    name: "Guatemala",
  );
  static const Country GU = Country(
    dialingCode: "1",
    isoCode: "GU",
    name: "Guam",
  );
  static const Country GW = Country(
    dialingCode: "245",
    isoCode: "GW",
    name: "Guinea-bissau",
  );
  static const Country GY = Country(
    dialingCode: "592",
    isoCode: "GY",
    name: "Guyana",
  );
  static const Country HK = Country(
    dialingCode: "852",
    isoCode: "HK",
    name: "Hong Kong",
  );
  static const Country HM = Country(
    dialingCode: "61",
    isoCode: "HM",
    name: "Heard and Mc Donald Islands",
  );
  static const Country HN = Country(
    dialingCode: "504",
    isoCode: "HN",
    name: "Honduras",
  );
  static const Country HR = Country(
    dialingCode: "385",
    isoCode: "HR",
    name: "Croatia (Local Name: Hrvatska)",
  );
  static const Country HT = Country(
    dialingCode: "509",
    isoCode: "HT",
    name: "Haiti",
  );
  static const Country HU = Country(
    dialingCode: "36",
    isoCode: "HU",
    name: "Hungary",
  );
  static const Country ID = Country(
    dialingCode: "62",
    isoCode: "ID",
    name: "Indonesia",
  );
  static const Country IE = Country(
    dialingCode: "353",
    isoCode: "IE",
    name: "Ireland",
  );
  static const Country IL = Country(
    dialingCode: "972",
    isoCode: "IL",
    name: "Israel",
  );
  static const Country IM = Country(
    dialingCode: "44",
    isoCode: "IM",
    name: "Isle of Man",
  );
  static const Country IN = Country(
    dialingCode: "91",
    isoCode: "IN",
    name: "India",
  );
  static const Country IO = Country(
    dialingCode: "246",
    isoCode: "IO",
    name: "British Indian Ocean Territory",
  );
  static const Country IQ = Country(
    dialingCode: "964",
    isoCode: "IQ",
    name: "Iraq",
  );
  static const Country IR = Country(
    dialingCode: "98",
    isoCode: "IR",
    name: "Iran (Islamic Republic Of)",
  );
  static const Country IS = Country(
    dialingCode: "354",
    isoCode: "IS",
    name: "Iceland",
  );
  static const Country IT = Country(
    dialingCode: "39",
    isoCode: "IT",
    name: "Italy",
  );
  static const Country JE = Country(
    dialingCode: "44",
    isoCode: "JE",
    name: "Jersey",
  );
  static const Country JM = Country(
    dialingCode: "1",
    isoCode: "JM",
    name: "Jamaica",
  );
  static const Country JO = Country(
    dialingCode: "962",
    isoCode: "JO",
    name: "Jordan",
  );
  static const Country JP = Country(
    dialingCode: "81",
    isoCode: "JP",
    name: "Japan",
  );
  static const Country KE = Country(
    dialingCode: "254",
    isoCode: "KE",
    name: "Kenya",
  );
  static const Country KG = Country(
    dialingCode: "996",
    isoCode: "KG",
    name: "Kyrgyzstan",
  );
  static const Country KH = Country(
    dialingCode: "855",
    isoCode: "KH",
    name: "Cambodia",
  );
  static const Country KI = Country(
    dialingCode: "686",
    isoCode: "KI",
    name: "Kiribati",
  );
  static const Country KM = Country(
    dialingCode: "269",
    isoCode: "KM",
    name: "Comoros",
  );
  static const Country KN = Country(
    dialingCode: "1",
    isoCode: "KN",
    name: "Saint Kitts and Nevis",
  );
  static const Country KP = Country(
    dialingCode: "850",
    isoCode: "KP",
    name: "Korea, Democratic People's Republic Of",
  );
  static const Country KR = Country(
    dialingCode: "82",
    isoCode: "KR",
    name: "Korea, Republic Of",
  );
  static const Country KW = Country(
    dialingCode: "965",
    isoCode: "KW",
    name: "Kuwait",
  );
  static const Country KY = Country(
    dialingCode: "965",
    isoCode: "KY",
    name: "Cayman Islands",
  );
  static const Country KZ = Country(
    dialingCode: "7",
    isoCode: "KZ",
    name: "Kazakhstan",
  );
  static const Country LA = Country(
    dialingCode: "856",
    isoCode: "LA",
    name: "Lao People's Democratic Republic",
  );
  static const Country LB = Country(
    dialingCode: "961",
    isoCode: "LB",
    name: "Lebanon",
  );
  static const Country LC = Country(
    dialingCode: "1",
    isoCode: "LC",
    name: "Saint Lucia",
  );
  static const Country LI = Country(
    dialingCode: "423",
    isoCode: "LI",
    name: "Liechtenstein",
  );
  static const Country LK = Country(
    dialingCode: "94",
    isoCode: "LK",
    name: "Sri Lanka",
  );
  static const Country LR = Country(
    dialingCode: "231",
    isoCode: "LR",
    name: "Liberia",
  );
  static const Country LS = Country(
    dialingCode: "266",
    isoCode: "LS",
    name: "Lesotho",
  );
  static const Country LT = Country(
    dialingCode: "370",
    isoCode: "LT",
    name: "Lithuania",
  );
  static const Country LU = Country(
    dialingCode: "352",
    isoCode: "LU",
    name: "Luxembourg",
  );
  static const Country LV = Country(
    dialingCode: "371",
    isoCode: "LV",
    name: "Latvia",
  );
  static const Country LY = Country(
    dialingCode: "218",
    isoCode: "LY",
    name: "Libyan Arab Jamahiriya",
  );
  static const Country MA = Country(
    dialingCode: "212",
    isoCode: "MA",
    name: "Morocco",
  );
  static const Country MC = Country(
    dialingCode: "377",
    isoCode: "MC",
    name: "Monaco",
  );
  static const Country MD = Country(
    dialingCode: "373",
    isoCode: "MD",
    name: "Moldova, Republic Of",
  );
  static const Country ME = Country(
    dialingCode: "382",
    isoCode: "ME",
    name: "Montenegro",
  );
  static const Country MF = Country(
    dialingCode: "1",
    isoCode: "MF",
    name: "Saint-Martin",
  );
  static const Country MG = Country(
    dialingCode: "261",
    isoCode: "MG",
    name: "Madagascar",
  );
  static const Country MH = Country(
    dialingCode: "692",
    isoCode: "MH",
    name: "Marshall Islands",
  );
  static const Country MK = Country(
    dialingCode: "389",
    isoCode: "MK",
    name: "Macedonia, The Former Yugoslav Republic Of",
  );
  static const Country ML = Country(
    dialingCode: "223",
    isoCode: "ML",
    name: "Mali",
  );
  static const Country MM = Country(
    dialingCode: "95",
    isoCode: "MM",
    name: "Myanmar",
  );
  static const Country MN = Country(
    dialingCode: "976",
    isoCode: "MN",
    name: "Mongolia",
  );
  static const Country MO = Country(
    dialingCode: "853",
    isoCode: "MO",
    name: "Macau",
  );
  static const Country MP = Country(
    dialingCode: "1",
    isoCode: "MP",
    name: "Northern Mariana Islands",
  );
  static const Country MQ = Country(
    dialingCode: "596",
    isoCode: "MQ",
    name: "Martinique",
  );
  static const Country MR = Country(
    dialingCode: "222",
    isoCode: "MR",
    name: "Mauritania",
  );
  static const Country MS = Country(
    dialingCode: "1",
    isoCode: "MS",
    name: "Montserrat",
  );
  static const Country MT = Country(
    dialingCode: "356",
    isoCode: "MT",
    name: "Malta",
  );
  static const Country MU = Country(
    dialingCode: "230",
    isoCode: "MU",
    name: "Mauritius",
  );
  static const Country MV = Country(
    dialingCode: "960",
    isoCode: "MV",
    name: "Maldives",
  );
  static const Country MW = Country(
    dialingCode: "265",
    isoCode: "MW",
    name: "Malawi",
  );
  static const Country MX = Country(
    dialingCode: "52",
    isoCode: "MX",
    name: "Mexico",
  );
  static const Country MY = Country(
    dialingCode: "60",
    isoCode: "MY",
    name: "Malaysia",
  );
  static const Country MZ = Country(
    dialingCode: "258",
    isoCode: "MZ",
    name: "Mozambique",
  );
  static const Country NA = Country(
    dialingCode: "264",
    isoCode: "NA",
    name: "Namibia",
  );
  static const Country NC = Country(
    dialingCode: "687",
    isoCode: "NC",
    name: "New Caledonia",
  );
  static const Country NE = Country(
    dialingCode: "227",
    isoCode: "NE",
    name: "Niger",
  );
  static const Country NF = Country(
    dialingCode: "672",
    isoCode: "NF",
    name: "Norfolk Island",
  );
  static const Country NG = Country(
    dialingCode: "234",
    isoCode: "NG",
    name: "Nigeria",
  );
  static const Country NI = Country(
    dialingCode: "505",
    isoCode: "NI",
    name: "Nicaragua",
  );
  static const Country NL = Country(
    dialingCode: "31",
    isoCode: "NL",
    name: "Netherlands",
  );
  static const Country NO = Country(
    dialingCode: "47",
    isoCode: "NO",
    name: "Norway",
  );
  static const Country NP = Country(
    dialingCode: "977",
    isoCode: "NP",
    name: "Nepal",
  );
  static const Country NR = Country(
    dialingCode: "674",
    isoCode: "NR",
    name: "Nauru",
  );
  static const Country NU = Country(
    dialingCode: "683",
    isoCode: "NU",
    name: "Niue",
  );
  static const Country NZ = Country(
    dialingCode: "64",
    isoCode: "NZ",
    name: "New Zealand",
  );
  static const Country OM = Country(
    dialingCode: "968",
    isoCode: "OM",
    name: "Oman",
  );
  static const Country PA = Country(
    dialingCode: "507",
    isoCode: "PA",
    name: "Panama",
  );
  static const Country PE = Country(
    dialingCode: "51",
    isoCode: "PE",
    name: "Peru",
  );
  static const Country PF = Country(
    dialingCode: "689",
    isoCode: "PF",
    name: "French Polynesia",
  );
  static const Country PG = Country(
    dialingCode: "675",
    isoCode: "PG",
    name: "Papua New Guinea",
  );
  static const Country PH = Country(
    dialingCode: "63",
    isoCode: "PH",
    name: "Philippines",
  );
  static const Country PK = Country(
    dialingCode: "92",
    isoCode: "PK",
    name: "Pakistan",
  );
  static const Country PL = Country(
    dialingCode: "48",
    isoCode: "PL",
    name: "Poland",
  );
  static const Country PM = Country(
    dialingCode: "508",
    isoCode: "PM",
    name: "Saint Pierre and Miquelon",
  );
  static const Country PN = Country(
    dialingCode: "64",
    isoCode: "PN",
    name: "Pitcairn",
  );
  static const Country PR = Country(
    dialingCode: "1",
    isoCode: "PR",
    name: "Puerto Rico",
  );
  static const Country PS = Country(
    dialingCode: "970",
    isoCode: "PS",
    name: "Palestinian Territory, Occupied",
  );
  static const Country PT = Country(
    dialingCode: "351",
    isoCode: "PT",
    name: "Portugal",
  );
  static const Country PW = Country(
    dialingCode: "680",
    isoCode: "PW",
    name: "Palau",
  );
  static const Country PY = Country(
    dialingCode: "595",
    isoCode: "PY",
    name: "Paraguay",
  );
  static const Country QA = Country(
    dialingCode: "974",
    isoCode: "QA",
    name: "Qatar",
  );
  static const Country RE = Country(
    dialingCode: "262",
    isoCode: "RE",
    name: "Reunion",
  );
  static const Country RO = Country(
    dialingCode: "40",
    isoCode: "RO",
    name: "Romania",
  );
  static const Country RS = Country(
    dialingCode: "381",
    isoCode: "RS",
    name: "Serbia",
  );
  static const Country RU = Country(
    dialingCode: "7",
    isoCode: "RU",
    name: "Russian Federation",
  );
  static const Country RW = Country(
    dialingCode: "250",
    isoCode: "RW",
    name: "Rwanda",
  );
  static const Country SA = Country(
    dialingCode: "966",
    isoCode: "SA",
    name: "Saudi Arabia",
  );
  static const Country SB = Country(
    dialingCode: "677",
    isoCode: "SB",
    name: "Solomon Islands",
  );
  static const Country SC = Country(
    dialingCode: "248",
    isoCode: "SC",
    name: "Seychelles",
  );
  static const Country SD = Country(
    dialingCode: "249",
    isoCode: "SD",
    name: "Sudan",
  );
  static const Country SE = Country(
    dialingCode: "46",
    isoCode: "SE",
    name: "Sweden",
  );
  static const Country SG = Country(
    dialingCode: "65",
    isoCode: "SG",
    name: "Singapore",
  );
  static const Country SH = Country(
    dialingCode: "290",
    isoCode: "SH",
    name: "Saint Helena",
  );
  static const Country SI = Country(
    dialingCode: "386",
    isoCode: "SI",
    name: "Slovenia",
  );
  static const Country SJ = Country(
    dialingCode: "47",
    isoCode: "SJ",
    name: "Svalbard and Jan Mayen Islands",
  );
  static const Country SK = Country(
    dialingCode: "421",
    isoCode: "SK",
    name: "Slovakia",
  );
  static const Country SL = Country(
    dialingCode: "232",
    isoCode: "SL",
    name: "Sierra Leone",
  );
  static const Country SM = Country(
    dialingCode: "378",
    isoCode: "SM",
    name: "San Marino",
  );
  static const Country SN = Country(
    dialingCode: "221",
    isoCode: "SN",
    name: "Senegal",
  );
  static const Country SO = Country(
    dialingCode: "252",
    isoCode: "SO",
    name: "Somalia",
  );
  static const Country SR = Country(
    dialingCode: "597",
    isoCode: "SR",
    name: "Suriname",
  );
  static const Country SS = Country(
    dialingCode: "211",
    isoCode: "SS",
    name: "South Sudan",
  );
  static const Country ST = Country(
    dialingCode: "239",
    isoCode: "ST",
    name: "Sao Tome and Principe",
  );
  static const Country SV = Country(
    dialingCode: "503",
    isoCode: "SV",
    name: "El Salvador",
  );
  static const Country SX = Country(
    dialingCode: "1",
    isoCode: "SX",
    name: "Sint Maarten",
  );
  static const Country SY = Country(
    dialingCode: "963",
    isoCode: "SY",
    name: "Syrian Arab Republic",
  );
  static const Country SZ = Country(
    dialingCode: "268",
    isoCode: "SZ",
    name: "Swaziland",
  );
  static const Country TC = Country(
    dialingCode: "1",
    isoCode: "TC",
    name: "Turks and Caicos Islands",
  );
  static const Country TD = Country(
    dialingCode: "235",
    isoCode: "TD",
    name: "Chad",
  );
  static const Country TF = Country(
    dialingCode: "262",
    isoCode: "TF",
    name: "French Southern Territories",
  );
  static const Country TG = Country(
    dialingCode: "228",
    isoCode: "TG",
    name: "Togo",
  );
  static const Country TH = Country(
    dialingCode: "66",
    isoCode: "TH",
    name: "Thailand",
  );
  static const Country TJ = Country(
    dialingCode: "992",
    isoCode: "TJ",
    name: "Tajikistan",
  );
  static const Country TK = Country(
    dialingCode: "690",
    isoCode: "TK",
    name: "Tokelau",
  );
  static const Country TL = Country(
    dialingCode: "670",
    isoCode: "TL",
    name: "Timor-leste",
  );
  static const Country TM = Country(
    dialingCode: "993",
    isoCode: "TM",
    name: "Turkmenistan",
  );
  static const Country TN = Country(
    dialingCode: "216",
    isoCode: "TN",
    name: "Tunisia",
  );
  static const Country TO = Country(
    dialingCode: "676",
    isoCode: "TO",
    name: "Tonga",
  );
  static const Country TR = Country(
    dialingCode: "90",
    isoCode: "TR",
    name: "Turkey",
  );
  static const Country TT = Country(
    dialingCode: "1",
    isoCode: "TT",
    name: "Trinidad and Tobago",
  );
  static const Country TV = Country(
    dialingCode: "688",
    isoCode: "TV",
    name: "Tuvalu",
  );
  static const Country TW = Country(
    dialingCode: "886",
    isoCode: "TW",
    name: "Taiwan",
  );
  static const Country TZ = Country(
    dialingCode: "255",
    isoCode: "TZ",
    name: "Tanzania, United Republic Of",
  );
  static const Country UA = Country(
    dialingCode: "380",
    isoCode: "UA",
    name: "Ukraine",
  );
  static const Country UG = Country(
    dialingCode: "256",
    isoCode: "UG",
    name: "Uganda",
  );
  static const Country UM = Country(
    dialingCode: "1",
    isoCode: "UM",
    name: "United States Minor Outlying Islands",
  );
  static const Country US = Country(
    dialingCode: "1",
    isoCode: "US",
    name: "United States",
  );
  static const Country UY = Country(
    dialingCode: "598",
    isoCode: "UY",
    name: "Uruguay",
  );
  static const Country UZ = Country(
    dialingCode: "998",
    isoCode: "UZ",
    name: "Uzbekistan",
  );
  static const Country VA = Country(
    dialingCode: "379",
    isoCode: "VA",
    name: "Vatican City State (Holy See)",
  );
  static const Country VC = Country(
    dialingCode: "1",
    isoCode: "VC",
    name: "Saint Vincent and The Grenadines",
  );
  static const Country VE = Country(
    dialingCode: "58",
    isoCode: "VE",
    name: "Venezuela",
  );
  static const Country VG = Country(
    dialingCode: "1",
    isoCode: "VG",
    name: "Virgin Islands (British)",
  );
  static const Country VI = Country(
    dialingCode: "1",
    isoCode: "VI",
    name: "Virgin Islands (U.S.)",
  );
  static const Country VN = Country(
    dialingCode: "84",
    isoCode: "VN",
    name: "Viet Nam",
  );
  static const Country VU = Country(
    dialingCode: "678",
    isoCode: "VU",
    name: "Vanuatu",
  );
  static const Country WF = Country(
    dialingCode: "681",
    isoCode: "WF",
    name: "Wallis and Futuna Islands",
  );
  static const Country WS = Country(
    dialingCode: "685",
    isoCode: "WS",
    name: "Samoa",
  );
  static const Country YE = Country(
    dialingCode: "967",
    isoCode: "YE",
    name: "Yemen",
  );
  static const Country YT = Country(
    dialingCode: "262",
    isoCode: "YT",
    name: "Mayotte",
  );
  static const Country ZA = Country(
    dialingCode: "27",
    isoCode: "ZA",
    name: "South Africa",
  );
  static const Country ZM = Country(
    dialingCode: "260",
    isoCode: "ZM",
    name: "Zambia",
  );
  static const Country ZW = Country(
    dialingCode: "263",
    isoCode: "ZW",
    name: "Zimbabwe",
  );

  /// All the countries in the picker list
  static const ALL = <Country>[
    AD,
    AE,
    AF,
    AG,
    AI,
    AL,
    AM,
    AO,
    AQ,
    AR,
    AS,
    AT,
    AU,
    AW,
    AX,
    AZ,
    BA,
    BB,
    BD,
    BE,
    BF,
    BG,
    BH,
    BI,
    BJ,
    BL,
    BM,
    BN,
    BO,
    BQ,
    BR,
    BS,
    BT,
    BV,
    BW,
    BY,
    BZ,
    CA,
    CC,
    CD,
    CF,
    CG,
    CH,
    CI,
    CK,
    CL,
    CM,
    CN,
    CO,
    CR,
    CU,
    CV,
    CW,
    CX,
    CY,
    CZ,
    DE,
    DJ,
    DK,
    DM,
    DO,
    DZ,
    EC,
    EE,
    EG,
    EH,
    ER,
    ES,
    ET,
    FI,
    FJ,
    FK,
    FM,
    FO,
    FR,
    GA,
    GB,
    GD,
    GE,
    GF,
    GG,
    GH,
    GI,
    GL,
    GM,
    GN,
    GP,
    GQ,
    GR,
    GS,
    GT,
    GU,
    GW,
    GY,
    HK,
    HM,
    HN,
    HR,
    HT,
    HU,
    ID,
    IE,
    IL,
    IM,
    IN,
    IO,
    IQ,
    IR,
    IS,
    IT,
    JE,
    JM,
    JO,
    JP,
    KE,
    KG,
    KH,
    KI,
    KM,
    KN,
    KP,
    KR,
    KW,
    KY,
    KZ,
    LA,
    LB,
    LC,
    LI,
    LK,
    LR,
    LS,
    LT,
    LU,
    LV,
    LY,
    MA,
    MC,
    MD,
    ME,
    MF,
    MG,
    MH,
    MK,
    ML,
    MM,
    MN,
    MO,
    MP,
    MQ,
    MR,
    MS,
    MT,
    MU,
    MV,
    MW,
    MX,
    MY,
    MZ,
    NA,
    NC,
    NE,
    NF,
    NG,
    NI,
    NL,
    NO,
    NP,
    NR,
    NU,
    NZ,
    OM,
    PA,
    PE,
    PF,
    PG,
    PH,
    PK,
    PL,
    PM,
    PN,
    PR,
    PS,
    PT,
    PW,
    PY,
    QA,
    RE,
    RO,
    RS,
    RU,
    RW,
    SA,
    SB,
    SC,
    SD,
    SE,
    SG,
    SH,
    SI,
    SJ,
    SK,
    SL,
    SM,
    SN,
    SO,
    SR,
    SS,
    ST,
    SV,
    SX,
    SY,
    SZ,
    TC,
    TD,
    TF,
    TG,
    TH,
    TJ,
    TK,
    TL,
    TM,
    TN,
    TO,
    TR,
    TT,
    TV,
    TW,
    TZ,
    UA,
    UG,
    UM,
    US,
    UY,
    UZ,
    VA,
    VC,
    VE,
    VG,
    VI,
    VN,
    VU,
    WF,
    WS,
    YE,
    YT,
    ZA,
    ZM,
    ZW,
  ];

  /// returns an country with the specified [isoCode] or ```null``` if
  /// none or more than 1 are found
  static findByIsoCode(String isoCode) {
    return ALL.singleWhere(
      (item) => item.isoCode == isoCode,
    );
  }

  /// Creates a copy with modified values
  Country copyWith({
    String name,
    String isoCode,
    String dialingCode,
  }) {
    return Country(
      name: name ?? this.name,
      isoCode: isoCode ?? this.isoCode,
      dialingCode: dialingCode ?? this.dialingCode,
    );
  }
}
