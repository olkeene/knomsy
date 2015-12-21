_.mixin({
  isBlank: function(string) {
    return (_.isUndefined(string) || _.isNull(string) || string.trim().length === 0)
  }
});