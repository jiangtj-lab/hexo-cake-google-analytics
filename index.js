
const utils = require('hexo-cake-utils')(hexo, __dirname);

hexo.extend.filter.register('theme_inject', function(injects) {
  let config = utils.defaultConfigFile('google_analytics', 'default.yaml');
  injects.head.file('google-analytics', utils.getFilePath('google-analytics.swig'), config, {cache: true, only: true});
});
