# Okapi BM25 Full Text Search Ranking Function SQLite Extension

This NPM module is a simple repackaging of <https://github.com/rads/sqlite-okapi-bm25> so that it can work out of the box with a simple `npm install sqlite-okapi-bm25` instead of having to run the Makefile explicitly. The function is documented more explicitly in that repository.

This SQLite extension creates a SQL function called `okapi_bm25` that returns the [Okapi BM25 ranking][o] for results of a full-text search. Okapi BM25 is a modern ranking function that calculates a score for each result based on its relevance to the search query. This extension only works with `MATCH` queries on [FTS4 tables][f].

[o]: https://en.wikipedia.org/wiki/Okapi_BM25
[f]: https://www.sqlite.org/fts3.html

## Usage

First, install the module via `npm install sqlite3-okapi-bm25`, then you can attach the extension to a sqlite connection.

```js
var sqlite3 = require('sqlite3');

var db = new sqlite3.Database(':memory:')
require('sqlite3-fts4-rank')(db);

// Do stuff with the new rank UDF!
var sql = "SELECT docid, okapi_bm25(matchinfo(documents, 'pcnalx'), 0) AS rank " +
  "FROM documents " +
  "WHERE documents MATCH '\"serious mail\"' " +
  "ORDER BY rank DESC  " +
  " LIMIT 10 OFFSET 0;"
db.each(sql, function(err, row) {
  console.log(row.id + ": " + row.info);
});
```

## See Also

  * <https://github.com/zhm/node-spatialite> - Used as an example of building a sqlite3 extension
  * <http://n8.io/converting-a-c-library-to-gyp> - A post by TooTallNate on building gyp extensions
  * <http://www.sqlite.org/cvstrac/wiki?p=LoadableExtensions>
  * <https://github.com/rads/sqlite-okapi-bm25>
