prompt = function () {
  var serverHost = db.serverStatus().host;
  var text = db;
  if (hostname() != serverHost)
    text +='@' + serverHost;
  return '(' + text + ') > ';
}

DBQuery.prototype._prettyShell = true;

DB.prototype.rename = function(newName) {
  if (newName == this.getName() || newName.length === 0)
    return;
  this.copyDatabase(this.getName(), newName, "localhost");
  this.dropDatabase();
  db = this.getSiblingDB(newName);
};

DBCollection.prototype.first = function () {
  return this.find().sort({ _id: 1 }).limit(1)[0];
}

DBCollection.prototype.last = function () {
  return this.find().sort({ _id: -1 }).limit(1)[0];
}
