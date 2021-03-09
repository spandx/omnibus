base_dir './tmp'
cache_dir     './tmp/omnibus/cache'
git_cache_dir './tmp/omnibus/cache/git_cache'
source_dir    './tmp/omnibus/src'
build_dir     './tmp/omnibus/build'
package_dir   './tmp/omnibus/pkg'
package_tmp   './tmp/omnibus/pkg-tmp'

use_git_caching true

# build_retries 5
# fetcher_read_timeout 120
# fetcher_retries 5

append_timestamp false
software_gems ['omnibus-software']
