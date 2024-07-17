document.addEventListener('DOMContentLoaded', async () => {
    await Helper.fetchBackendLink();
    _init();
    _showCategories();
})

async function _init() {
    var item = await Helper.fetchData("product&action=find&id=" + Helper.getParameter("id"))
    showDatas(item)

    var iRelated = await Helper.fetchData("product")
    showProductsRelated(iRelated)
}

async function showDatas(item) {
    document.querySelector(".tzshop-summary h3").textContent = item.Name
    document.querySelector(".tzshop-summary .tzproduct-single-price").textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.Price * 1000)
    document.querySelector(".tzshop-summary .productView").textContent = item.View
    document.querySelector(".tztab-content p").textContent = item.Description
    document.querySelector("#slider img").src = Helper.getLink(item.Img)
}

async function showProductsRelated(items) {
    var dataList = document.querySelector(".dataList")
    var dataItem = dataList.querySelector(".dataItem").cloneNode(true)
    dataList.innerHTML = ""
    await items.forEach(item => {
        let cloneData = dataItem.cloneNode(true)

        cloneData.querySelector("._hrefProductDetail").textContent = item.Name
        cloneData.querySelectorAll("a._hrefProductDetail").forEach(i => i.href = `./?page=productDetails&id=${item.ID}`)
        cloneData.querySelector("img").src = Helper.getLink(item.Img)
        cloneData.querySelector("small").textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.Price * 1000)

        dataList.appendChild(cloneData)
    });
}

async function _showCategories() {
    var items = await Helper.fetchData("category")
    var dataList = document.querySelector(".sidebar-list")
    dataList.innerHTML = ""
    items.forEach(item => {
        let dataItem = document.createElement("li")
        dataItem.innerHTML = `
            <i class="fa fa-chevron-right"></i>
            <a href="./?page=products&category=${item.Name}"> ${item.Name}</a>
        `
        dataList.appendChild(dataItem)
    })
}

