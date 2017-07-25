const {spawn, execFile} = require('child_process');
const debounce = require('lodash.debounce');
const browserSync = require('browser-sync');
const config = require('./bs-config');

const bs = browserSync.create();
const middleman = spawn('bundle', ['exec', 'middleman', 'server']);
let builtServer = false;

middleman.stdout.on('data', data => {
  if (!builtServer) {
    const curl = execFile('curl', ['localhost:4567']);
    curl.on('exit', code => {
      if (code === 0) {
        builtServer = true;
        bsInit(middleman);
      }
    });
  }
});

function bsInit(middleman) {
  const handleReload = debounce(bs.reload, 150);

  bs.init(config, () => {
    middleman.stdout.on('data', data => {
      if (/LiveReloading/.test(data.toString())) {
        handleReload();
      }
    });
  });
}
