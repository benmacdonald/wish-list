var productForm = document.getElementsByClassName("product-form")[0];

if (!document.getElementById('buttonDiv')) {

  var underDiv = document.createElement('div');
  underDiv.setAttribute('id', 'buttonDiv')
  var inner = "<p>Is this price to high?</p><button id='requestPrice'>Request Lower Price</button>";
  underDiv.innerHTML = inner;
  productForm.parentNode.insertBefore(underDiv, productForm.nextSibling);


  var modal = document.createElement('div');
  modal.style.display = 'none';
  modal.setAttribute('id', 'modal');
  var innerModal = "<div id='modalBody'><span><a id='closeModal'>x</a></span><div id='formContainer'></div><div id='success'>Successfully requested price</div></div>";
  modal.innerHTML = innerModal;
  document.body.insertBefore(modal, document.body.firstChild);

  var form = "<form>" +
  "<label for='email'>Email Address</label>" +
  "<input id='email' name='email' type='email'></input>" +
  "<p id='emailValidation'></p>" +
  "<label for='price'>Desired Price</label>" +
  "<input id='price' name='price' type='number'></input>" +
  "<p id='priceValidation'></p>" +
  "<label for='quantity'>Quantity</label>" +
  "<input id='quantity' name='quantity' type='number'></input>" +
  "<p id='quantityValidation'></p>" +
  "<input id='end' name='end' type='date'></input>" +
  "</br>" +
  "</br>" +
  "<button id='priceAjustSubmit'>Submit</button>" +
  "</form>"

  document.getElementById('formContainer').innerHTML = form

  // Setting the CSS

  document.getElementById('emailValidation').setAttribute('style',
  "color:red;"
  )
  document.getElementById('priceValidation').setAttribute('style',
  "color:red;"
  )
  document.getElementById('quantityValidation').setAttribute('style',
  "color:red;"
  )
  document.getElementById('quantityValidation').setAttribute('style',
  "color:red;"
  )
  document.getElementById('priceValidation').setAttribute('style',
  "color:red;"
  )

  productForm.setAttribute('style',
  "margin-bottom: 18px;"
  )

  document.getElementById('buttonDiv').setAttribute('style',
  "text-align:center;"
  )

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
    document.getElementById('success').style.display = 'none'
    document.getElementById('formContainer').style.display = 'block'

    document.getElementById('emailValidation').innerHTML = ''
    document.getElementById('priceValidation').innerHTML = ''
    document.getElementById('quantityValidation').innerHTML = ''
    document.getElementById('quantityValidation').innerHTML = ''
    document.getElementById('priceValidation').innerHTML = ''
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
    var end = document.getElementById('end').value
    var productId = JSON.parse(document.getElementById('ProductJson-product').innerHTML).id || ""
    var url = window.location.host
    var name = document.querySelector('meta[property="og:title"]').content;

    var isValid = true
    // validation
    if (email == "" || email == null) {
      document.getElementById('emailValidation').innerHTML = 'Email is required'
      isValid = false
    }
    if (price == "" || price == null) {
      document.getElementById('priceValidation').innerHTML = 'Price is required'
      isValid = false
    }
    if (quantity == "" || quantity == null) {
      document.getElementById('quantityValidation').innerHTML = 'Quantity is required'
      isValid = false
    }
    if (quantity < 1) {
      document.getElementById('quantityValidation').innerHTML = 'Quantity has to be greater than 1'
      isValid = false
    }
    if (price > JSON.parse(document.getElementById('ProductJson-product').innerHTML).price / 100) {
      document.getElementById('priceValidation').innerHTML = 'Price has to be lower than the current price'
      isValid = false
    }

    if (!isValid) {
      return
    }

    $.post({
      url: 'https://e9a36180.ngrok.io/wishlist/subscribe',
      method: 'POST',
      crossDomain: true,
      data: {
        email: email,
        productid: productId,
        quantity: quantity,
        domain_name: url,
        price: price,
        name: name,
        end: end
      },
      success: function(data) {
        console.log('updated price')
        document.getElementById('success').style.display = 'block'
        document.getElementById('formContainer').style.display = 'none'
      }
    })

  })

}
