var express = require('express');
var app = express();

var celeb = {
  "results": {
    "profession": "tv star & kinda-sorta movie star",
    "known_for": ["90s sitcom", "straight to video movies"],
    "gender": "female",
    "personal style": "homeless chic",
    "extra hint": "it takes two"
  }
}

app.get('/', function(req, res) {
  res.json( celeb );
})


app.get('/:id', function(req, res) {
  var guess = req.params.id.toLowerCase();
  console.log(guess);
  if (guess === "ashley_olsen") {
    res.send( {correct: "You got it, dude!"} );
  }
  else {
    res.send( {incorrect: "You're in big trouble, mister!"} );
  }
})

app.listen(3000);

console.log("listening on port 3000");
