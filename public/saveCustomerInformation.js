$(function() {
    $.ajax({
    data: {email: "", shopid: "",productid: "",price: "",end: ""},
    type: 'JSON',
    method: 'POST',
    url: 'http://localhost:3000/wishlist/subscribe'
  })
});