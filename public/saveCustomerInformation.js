fetch("https://f563f4fa.ngrok.io/wishlist/subscribe", {
  method: "POST",
  mode: 'no-cors',
  body: JSON.stringify({
  	email: "1",
  	productid: 1,
  	storeid: 1,
  	quantity: 20
  })
})
.then( (response) => { 
   
});