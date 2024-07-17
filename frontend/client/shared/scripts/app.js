class CartManager {
    // Phương thức để thêm hoặc cập nhật một giá trị vào sessionStorage
    static setItem(key, value) {
        // Lấy danh sách mục từ sessionStorage
        var items = this.getItem();

        // Kiểm tra xem danh sách có tồn tại không
        if (!items) {
            // Nếu không tồn tại, tạo một mảng mới
            items = {};
        }

        // Thêm mục mới vào danh sách
        if (items[key]) {
            items[key]['Quantity'] = parseInt(items[key]['Quantity']) + parseInt(value['Quantity'])
        } else {
            items[key] = value;
        }
        // Lưu danh sách đã được cập nhật vào sessionStorage
        sessionStorage.setItem("cart", JSON.stringify(items));
    }

    // Phương thức để đọc một giá trị từ sessionStorage
    static getItem() {
        const item = sessionStorage.getItem("cart");
        return item ? JSON.parse(item) : null;
    }

    // Phương thức để kiểm tra xem một khóa đã tồn tại trong sessionStorage hay chưa
    static hasItem() {
        return sessionStorage.getItem("cart") !== null;
    }

    // Phương thức để xóa một giá trị khỏi sessionStorage
    static clear() {
        sessionStorage.removeItem("cart");
    }
    
    static removeItem(key) {
        const items = this.getItem();
        if (items && this.hasItem(key)) {
            delete items[key];
            sessionStorage.setItem("cart", JSON.stringify(items));
        }
    }
}

// Hàm dùng chung
class Helper {
    static backendLink = null;
    static async fetchBackendLink() {
        try {
            const response = await fetch("../conf.json");
            const data = await response.json();
            this.backendLink = data.backend;
        } catch (error) {
            console.error("Error:", error);
            this.backendLink = null;
        }
    }

    // Lấy dữ liệu từ BackEnd
    static async fetchData(controller) {
        return fetch(this.backendLink + '?controller=' + controller)
            .then(response => response.json())
            .then(data => {
                return data;
            })
            .catch(error => {
                console.log(error);
                return null;
            });
    }

    // Lấy dữ liệu html
    static async fetchHTML(url) {
        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error('Fetch HTML error:', response.status);
            }
            return await response.text();
        } catch (error) {
            console.error('Fetch HTML error:', error);
            throw error;
        }
    }

    // Lấy biến get của trình duyệt
    static getParameter(name) {
        // Tạo một đối tượng URLSearchParams từ query string của URL
        var queryParams = new URLSearchParams(window.location.search);

        // Kiểm tra xem có tham số có tên tương ứng không
        if (queryParams.has(name)) {
            // Nếu có, trả về giá trị của tham số đó
            return queryParams.get(name);
        }
        // Trả về null nếu không tìm thấy tham số có tên tương ứng
        return null;
    }

    // Lấy giá trị cokkie
    static getCookie(cookieName) {
        // Tách các cookie thành một mảng
        var cookies = document.cookie.split(';');

        // Lặp qua từng cookie để tìm cookieName
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i];
            // Loại bỏ khoảng trắng ở đầu và cuối chuỗi
            cookie = cookie.trim();
            // Kiểm tra xem cookie có bắt đầu bằng cookieName hay không
            if (cookie.startsWith(cookieName + '=')) {
                // Trích xuất và trả về giá trị của cookie
                return cookie.substring(cookieName.length + 1);
            }
        }
        // Nếu không tìm thấy cookie, trả về null
        return null;
    }

    // Lấy hình ảnh trong backend
    static getLink(link) {
        return this.backendLink + "www/" + link
    }
}

Helper.fetchBackendLink();
