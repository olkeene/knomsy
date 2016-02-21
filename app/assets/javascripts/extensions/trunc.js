String.prototype.trunc = String.prototype.trunc ||
  function(n, ellip){
    if (!ellip) ellip = '...';
    
    return (this.length > n) ? this.substr(0,n-1) + ellip : this;
  };