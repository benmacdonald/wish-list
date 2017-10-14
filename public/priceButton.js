var productForm = document.getElementsByClassName("product-form")[0];

if (!document.getElementById('buttonDiv')) {

  var underDiv = document.createElement('div');
  underDiv.setAttribute('id', 'buttonDiv')
  var inner = "<button id='requestPrice'>Request Price</button>";
  underDiv.innerHTML = inner;
  productForm.parentNode.insertBefore(underDiv, productForm.nextSibling);


  var modal = document.createElement('div');
  modal.style.display = 'none';
  modal.setAttribute('id', 'modal');
  var innerModal = "<div id='modalBody'><span><a id='closeModal'>x</a></span><div id='formContainer'></div></div>";
  modal.innerHTML = innerModal;
  document.body.insertBefore(modal, document.body.firstChild);

  var form = "<form>" +
  "<label for='email'>Email Address</label>" +
  "<input id='email' name='email' type='email'></input>" +
  "<label for='price'>Desired Price</label>" +
  "<input id='price' name='price' type='number'></input>" +
  "<label for='quantity'>Quantity</label>" +
  "<input id='quantity' name='quantity' type='number'></input>" +
  "<button id='priceAjustSubmit'>Submit</button>" +
  "</form>"

  document.getElementById('formContainer').innerHTML = form

  // Setting the CSS
  modal.setAttribute('style',
  "display :none;" +
  "position: fixed;" +
  "z-index: 1;" +
  "left: 0;" +
  "top: 0;" +
  "width: 100%;" +
  "height: 100%;" +
  "overflow: auto;" +
  "background-color: rgb(0,0,0);" +
  "background-color: rgba(0,0,0,0.4);"
  )

  document.getElementById('modalBody').setAttribute('style',
  "background-color : #FFF;" +
  "margin : 15% auto;" +
  "padding: 20px;" +
  "width: 80%;"
  )

  document.getElementById('requestPrice').addEventListener("click", function () {
    document.getElementById('modal').style.display = 'block'
  })

  document.getElementById('closeModal').addEventListener("click", function () {
    document.getElementById('modal').style.display = 'none'
  })

  document.getElementById('priceAjustSubmit').addEventListener("click", function (e) {
    e.preventDefault();
    var email = document.getElementById('email').value
    var price = document.getElementById('price').value
    var quantity = document.getElementById('quantity').value
    var merchantEmail = document.getElementById('in-context-paypal-metadata').value
    var productId = document.getElementById('ProductSelect-product').options[0].value || ""
    var url = window.location.host
    var name = document.querySelector('meta[property="og:title"]').content;

    console.log('here')

    $.post({
      url: 'https://e9a36180.ngrok.io/wishlist/subscribe',
      method: 'POST',
      mode: 'no-cors',
      data: {
        email: email,
        productid: productId,
        quantity: quantity,
        domain_name: url,
        price: price,
        name: name
      }
    })

  })

}
