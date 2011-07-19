Tupalo API Client
---

An interface to [Tupalo.com](Tupalo.com)'s Easy API. This allows you
to

* search for spots
* find spots within a certain area
* display detailed information about a spot
* display spots on a map
* post reviews via review widgets
* match your spots to our spots
* tell us about spots not yet in our database

Basically this allows you to build a specialized location-based site
or integrate Tupalo.com's content into your page.

API access
---

Without an API token you will be limited to 200 requests per
month. This has to do with the way we are licensing data from our
partners. For the same reason tokenless requests will not include the
phone numbers of spots.

To get an API token please email api@tupalo.com and let us know what
kind of app you have in mind, as well as an estimate on the number of
requests you will approximately need per month.

Some more guidelines:

* Use the API for good and not for evil.
* Do not scrape us.
* Do not resell our data.
* Create something awesome.
* Have fun.

Creating an API client instance
---

    require 'tupalo_api_client'
    tup = TupaloApiClient.new

Alternatively `#new` can take an options hash with the keys `:lang`
and `:token` to customize the language and supply your API token.

   tup = TupaloApiClient.new(:lang => 'nl', :token => 'abc123')

Language-wise we currently support English (the default), German, Dutch,
Danish, Finnish, Polish, Swedish and French.

Spots search
---

Used for retrieving spots in a certain area.

    tup.spots(:origin => 'Schmalzhofgasse 26, Vienna, Austria',
       :includecategories => 'restaurant')

This will return all restaurants within 0.3km (the default radius)
with the Tupalo.com office.

The following parameters are supported in the options hash:

* `name`: name or part of the name of a spot
* `origin`: an address string (example: "Schmalzhofgasse 26, Vienna, Austria")
* `latitude`: latitude coordinate
* `longitude`: longitude coordinate
* `spot_id`: uses the latitude and longitude of the given spot
* `radius`: search radius (default 0.3km)
* `excludecategories`: comma separated category keys
* `includecategories`: comma separated category keys
* `map_size`: size of the static map image
* `offset`: used for pagination (maximum 40, default 0)
* `limit`: number of results to return (maximum 10)
* `token`: optional access key token

The list of category keys can be found here in JSON format:

[http://tupalo.com/en/api/v1/categories/tree.json](http://tupalo.com/en/api/v1/categories/tree.json)

Spot details
---

Returns detailed information about a spot, including reviews.

    tup.spot_details(:spot_id => 'gubi')

This needs a `spot_id` which has to be retrieved via `#spots` first.

Review widget
---

Returns an HTML partial for a Tupalo.com review widget that you can
use for embedding Tupalo.com reviews in your site.

_This token-only method is further described in the official API
documentation._

Matching
---

Used for augmenting spot information on Tupalo.com or pushing new
spots into our database. Changes to existing information as well as
newly added spots will be manually reviewed before being added to the
site.

_This token-only method is further described in the official API
documentation._

Error handling
---

In case something goes wrong, an `TupaloApiErrors::ClientError` (HTTP
4xx) or a `TupaloApiErrors::ServerError` (HTTP 5xx) get raised.

A "HTTP 412 Precondition Failed" status code is returned if you go
over your API request limit.

Known problems
---

None at the moment.

Todo
---

This gem models the current state of Tupalo.com's Easy API.

Authors
---

Michael Kohl <michi@tupalo.com> and Andreas Tiefenthaler <andy@tupalo.com>

License
---

This gem is licensed under the MIT license. See the `LICENSE` file for details.
