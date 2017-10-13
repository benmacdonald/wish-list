var productForm = document.getElementsByClassName("product-form")[0];
var underDiv = document.createElement('div')

var inner = "<span><button id='requestPrice' onclick='openModal'>Request Price</button></span>"
underDiv.innerHTML = inner
productForm.parentNode.insertBefore(underDiv, productForm.nextSibling);



var modal = document.createElement('div')
modal.style.display = 'none'
modal.setAttribute('id', 'modal')
var innerModal = "<div><span><a id='closeModal'>x</a></span><p>This is a modal</p></div>"
modal.innerHTML = innerModal
document.body.insertBefore(modal, document.body.firstChild)

// Setting the CSS
// TODO::

document.getElementById('requestPrice').addEventListener("click", function () {
  document.getElementById('modal').style.display = 'block'
})

document.getElementById('closeModal').addEventListener("click", function () {
  document.getElementById('modal').style.display = 'none'
})
