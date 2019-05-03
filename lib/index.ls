/* Forked from `metalsmith-markdown` by GitHub:segmentio
*  <https://github.com/segmentio/metalsmith-markdown> */

require! {
textile
path: {dirname, extname}:path
}
debug = require(\debug) \metalsmith-textile

fnmatch = /txti$|txtl$|textile$/

/**
* Check if a file is a textile file 
*
* @param string fn
* @return boolean
*/
txti = (fn) -> fnmatch.test extname fn

module.exports = (options) ->
     options = if options? then options else {}
     keys = if options.keys? then options.keys else []
     (files,metalsmith,done) ->
           set-immediate done
           for file, value of files
                return if !txti file
                data = files[file]
                dir = dirname[file]
                html = file.replace fnmatch, \.html
                debug 'converting file: %s' file
                str = textile data.contents.to-string!, options
                try
                  data.contents = Buffer.from str
                catch e
                  data.contents new Buffer str
                  for i in keys
                     if data[i]
                        data[i] = textile data[key].to-string!,options
                delete files[file]
                files[html] = data

