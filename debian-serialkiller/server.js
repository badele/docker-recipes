var http = require('http');
var PORT = 3000;
var server = http.createServer(function(request, response) {
  response.writeHead(200);
  response.end('Ok ça marche - ' + new Date());
});

server.listen(PORT, function() {
    console.log('server tourne sur port' + PORT);
});