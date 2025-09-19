# IDEA
There are many fields that we re-use mulitple time in different models or projects.
Like:

## Postal Codes / Cities / State
  List of Postal Code, Cities and States will be same in every project and it's not Malaysian government will suddenly decide to add a new state or postal code.

## Name:
Always save name in capital letter to avoid any kind of IC verification.
Name can have:
1. Alphabets A ~ Z
2. Special Characters (7 symbols only): @ , & ' . - / space
3. Saluations are not allowed in name: MR / MS / MRS / MADAM / DR / PROF / DATIN / DATO / YB / TAN SRI / DATN SRI / DATUK
4. Maximum 2 alphabets in the name
5. Maximum total length 80
Regex:
```
^(?=.{1,80}$)(?!.*\b(MR|MS|MRS|MADAM|DR|PROF|DATIN|DATO|YB|TAN\sSRI|DATN\sSRI|DATUK)\b)[A-Z][A-Za-z@&'.\-/ ]
{1,}(?:[A-Za-z@&'.\-/]{2,})$
```
without Saluations:
```
/^(?=.{1,80}$)[A-Z][A-Za-z@&'.\-/ ]{1,}(?:[A-Za-z@&'.\-/]{2,})$
```

## NRIC Number:
The input field should accept NRIC number without dash -
IC Number should only have digits and must be 12 digits
`YYMMDD-PB-NNNG`
`YYMMDD` => First 6 digits represnt date of birth, the age calculated from this should be not less than 12 years. (please don’t miss leap
years in age calculation)
`YY = Year`
`MM = Month`
`DD = Day`
`PB` => Two digits after Date-Of-Birth represents Place of Birth which is Sate or Country It cannot be 00, 17, 18, 19, 20
`NNN` => Random 3 digits 001 till 999. It cannot be 000
`G` => Last one digit represents gender. Even is Female, Odd is Male.

*Regex:*
```
^(0[0-9]|[1-9][0-9])(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])(0[1-9]|1[0-6]|2[1-9]|[3-9][0-9])(00[1-9]|0[1-9][0-
9]|[1-9][0-9]{2})([0-9])$
```
Let's break it into sections:

1. ^(0[0-9]|[1-9][0-9]) : This part checks the first two digits (AA) of the pattern to allow values from 00 to 99. It starts with 0 and then
allows any digit from 0 to 9, or it allows any non-zero digit followed by any digit.
2. (0[1-9]|1[0-2]) : Matches the next two digits (BB) for the months, allowing values from 01 to 12. It allows values from 01 to 09 as 0
followed by any digit, or it allows 10 to 12 as 1 followed by 0 to 2.
3. (0[1-9]|[12][0-9]|3[01]) : Validates the next two digits (CC) for the days, allowing values from 01 to 31. It covers values from 01 to
09 as 0 followed by any digit, 10 to 29 as 1 or 2 followed by any digit, and 30 or 31 as 3 followed by 0 or 1.
4. (0[1-9]|1[0-6]|2[1-9]|[3-9][0-9]) : Matches the next two digits (DD) for the day range, allowing values from 01 to 16 or 21 to 99. It
includes 01 to 09 as 0 followed by any digit, 10 to 16 as 1 followed by 0 to 6, 21 to 29 as 2 followed by 1 to 9, and 30 to 99 as any digit
other than 0 followed by any digit.
5. (00[1-9]|0[1-9][0-9]|[1-9][0-9]{2}) : Matches the next three digits (EEE) for a range from 001 to 999. It includes 001 to 009 as 00
followed by any digit, 010 to 099 as 0 followed by any two digits, and 100 to 999 as any non-zero digit followed by any two digits.
6. ([0-9])$ : Validates the last digit (F) of the pattern, allowing values from 0 to 9 at the end of the string.
Overall, this regex pattern aims to match a specific format of 12 digits (YYMMDDPBNNNG) while ensuring each part meets the specified
criteria.

*Age from Date:*
For Malaysians the date should be extracted from NRIC number and Age should also be calculated.
note: make sure that leap year is considered in age calculations.

## State:
State should be calculated from NRIC (PB)
  01, 21, 22, 23, 24 – Johor
  02, 25, 26, 27 – Kedah
  03, 28, 29 – Kelantan
  04, 30 – Malacca
  05, 31, 59 – Negeri Sembilan
  06, 32, 33 – Pahang
  07, 34, 35 – Penang
  08, 36, 37, 38, 39 – Perak
  09, 40 – Perlis
  10, 41, 42, 43, 44 – Selangor
  11, 45, 46 – Terengganu
  12, 47, 48, 49 – Sabah
  13, 50, 51, 52, 53 – Sarawak
  14, 54, 55, 56, 57 – Federal Territory of Kuala Lumpur
  15, 58 – Federal Territory of Labuan
  16 – Federal Territory of Putrajaya



and many many more more.....etc etc