Feature: German Search

	Scenario Outline: Analyze Köln
		Given the source text "<Source>"
		When passing to the "english" analyzer
		Then "<Result>" should be returned

		Examples:
		| Source | Result |
		| eat    | eat    |
		| eaten  | eat    |
		| ate    | eat    |
		| fly    | fly    |
		| flew   | fly    |
		| drank  | drink  |
		| Eat    | eat    |