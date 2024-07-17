document.addEventListener('DOMContentLoaded', async () => {
    _init();
    _sendData();
})

async function _init() {
    var items = await CartManager.getItem()
    console.log(items);
    showDatas(items)
}

async function showDatas(items) {
    var dataList = document.querySelector(".dataList")
    var dataItem = dataList.querySelector(".dataItem").cloneNode(true)
    dataList.innerHTML = ""
    var totalPrice = 0;
    Object.keys(items).forEach(item => {
        let cloneData = dataItem.cloneNode(true)

        cloneData.querySelector("._hrefProductDetail").textContent = item
        cloneData.querySelector("img").src = Helper.getLink(items[item]['Img'])
        cloneData.querySelector(".product-quantity span").textContent = items[item]['Quantity']
        cloneData.querySelector(".price").textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(parseInt(items[item]['Price']) * items[item]['Quantity']  * 1000)
        cloneData.querySelector(".remove").addEventListener("click", () => {
            CartManager.removeItem(item)
            location.reload()
        })
        totalPrice += (parseInt(items[item]['Price']) * items[item]['Quantity'] * 1000)
        dataList.appendChild(cloneData)
    });

    document.querySelector(".total_price").textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(totalPrice)
}

async function _sendData() {
    document.querySelector("._btnOrder").addEventListener('click', (event) => {
        event.preventDefault(); // Corrected preventDefault usage
        const formData = new FormData(document.querySelector("#_formCheckout"));
        formData.append('TotalPrice', parseInt(document.querySelector(".total_price").textContent.replace(/[^\d]/g, ""))/1000);
        formData.append('orderDetails', JSON.stringify(CartManager.getItem()));
        fetch('../../backend/?controller=order&action=insert', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(result => {
            console.log(result);
            if (result == true) {
                alert("Cảm ơn bạn đã tin tưởng mua hàng!")
                CartManager.clear()
                window.location.href = "./";
            }
        })
        .catch(error => {
            console.error('Error sending data:', error);
        });
    });
}
