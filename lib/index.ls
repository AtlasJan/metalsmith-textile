/* Forked from `metalsmith-markdown` by GitHub:segmentio
*  <https://github.com/segmentio/metalsmith-markdown> */

require! {
textile
path: {dirname, extname}:path
}
debug = require(\debug) \metalsmith-textile

fnmatch = /txti$|textile$/

/**
* Check if a file is a textile file 
*
* @param string fn
* @return boolean
*/
txti = (fn) ->
  fnmatch.test extname fn

plugin = (opts) ->
     opts.pattern = if opts? then opts else {}
     keys = if opts.keys? then opts.keys else []
     (files,metalsmith,done) ->
           set-immediate(done)
           for file, value of files
                return if !txti file
                data = files[file]
                dir = dirname[file]
                html = file.replace fnmatch \.html
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

module.exports = plugin

