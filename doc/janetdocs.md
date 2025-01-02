# JanetDocs

## Notable characteristics

* URL nice (and may be known to many community users?)
* Customized look and feel (vs say github wiki)
* Top page has search-as-you-type-with-filtering (e.g. try "string")
  * Results are "on-site" (vs results shown via external search
    engine)
  * Produces "narrowed" view consisting of all matches (easier to go
    through than unfiltered total view)
* Playground for exploration
  * In-the-web-browser benefits
    * Can use from devices that don't have janet installed
    * Even with janet-installed devices, don't need to start a
      terminal
  * Format button powered by spork/fmt - can show a decent way to
    format code
  * Demonstrates that a fair bit of janet works in wasm
* GitHub SignIn
  * Relatively low-barrier to entry?
  * Individual users can create and edit only their own content
    (contrast with gh (or other) wiki)
* "I'm feeling lucky" link that provides channel for enthusiasm /
  curiosity
* Examples linked to from official docs (core api page)
* Current data available via: https://janetdocs.com/export.json
  * \> 500 examples: `jq '. | length' export.json`
  * \> 50 contributing users: `jq '.[]."gh-username"' export.json | sort -u | wc -l`
* In the past, the project encouraged some contributions to itself
  * Nice to have something "web-visible" in janet that various folks
    can contribute to

## Some current drawbacks

* When a user is unreachable, content is hard to modify?
  * Issue of fixing inaccuracies (whether initially off or due to
    language changes)
    * Example [here](https://github.com/swlkr/janetdocs/issues/50)
  * Potential issue of coping with abuse
    * Effectively nothing can be done atm?
* Maintenance activities can be hard to pull off
* May require operating system and related upgrades for security and
  other reasons
* Features
  * ["See also" needs
    work](https://github.com/swlkr/janetdocs/issues/40)
  * Unable to make a new example from playground content directly
  * Search seems to be constrained to "leading substring" type?
  * [Other issues](https://github.com/swlkr/janetdocs/issues)

