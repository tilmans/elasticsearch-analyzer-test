Feature: German Search

	Scenario Outline: Analyze Köln
		Given the source text "<Source>"
		When passing to the "german" analyzer
		Then "<Result>" should be returned

		Examples:
		| Source | Result |
		| Köln   | koln   |
		| Koeln  | koln   |
		| koln   | koln   |
		| Kölsch | kolsch |
		| trinken | trink |
		| getrunken | trink |