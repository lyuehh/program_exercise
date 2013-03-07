/*
 * tiny-store
 * https://github.com/lyuehh/tiny-store
 *
 * Copyright (c) 2012 lyuehh
 * Licensed under the MIT license.
 */

function Store() {
  this._data = {};
}

Store.prototype.set = function(key, value) {
  this._data[key] = value;
};

Store.prototype.get = function(key) {
  return this._data[key];
};

Store.prototype.clear = function() {
  this._data = {};
};

module.exports = Store;
