document.addEventListener("DOMContentLoaded", function () {
    const addToCartButtons = document.querySelectorAll(".add-to-cart");
    const filterTags = document.querySelectorAll(".filter-tag");
    const categoryGroups = document.querySelectorAll(".category-group");
    const cartItems = [];
    let totalWeight = 0;
    let totalPrice = 0;
    let itemTypes = 0;

    addToCartButtons.forEach((button) => {
        button.addEventListener("click", function () {
            const itemId = this.dataset.id;
            const itemName = this.dataset.name;
            const itemPrice = parseFloat(this.dataset.price);
            const itemImage = this.dataset.image;
            const itemWeight = 1; // Default weight to 1 kg

            // Add item to cart
            const cartItem = cartItems.find((item) => item.id === itemId);
            if (cartItem) {
                cartItem.weight += itemWeight;
            } else {
                cartItems.push({
                    id: itemId,
                    name: itemName,
                    price: itemPrice,
                    image: itemImage,
                    weight: itemWeight,
                });
                itemTypes++;
            }

            totalWeight += itemWeight;
            totalPrice += itemPrice;

            updateCart();
        });
    });

    filterTags.forEach((tag) => {
        tag.addEventListener("click", function () {
            const filter = this.dataset.filter;

            // Update active tag
            filterTags.forEach((t) => t.classList.remove("active"));
            this.classList.add("active");

            // Filter categories
            categoryGroups.forEach((group) => {
                if (filter === "all" || group.dataset.category === filter) {
                    group.style.display = "block";
                } else {
                    group.style.display = "none";
                }
            });
        });
    });

    function updateCart() {
        const cartElement = document.getElementById("cart");
        // const cartItemsElement = document.getElementById("cart-items");
        const cartWeightElement = document.getElementById("cart-weight");
        const cartTotalElement = document.getElementById("cart-total");
        const cartItemsInput = document.getElementById("cart-items-input");
        const totalWeightInput = document.getElementById("total-weight-input");
        const totalPriceInput = document.getElementById("total-price-input");

        // cartItemsElement.innerHTML = "";

        cartWeightElement.textContent = `Jual · ${totalWeight} kg | ${itemTypes} jenis`;
        cartTotalElement.textContent = `Rp. ${totalPrice}`;

        cartItemsInput.value = JSON.stringify(cartItems);
        totalWeightInput.value = totalWeight;
        totalPriceInput.value = totalPrice;

        cartElement.classList.remove("d-none");
        cartElement.classList.add(
            "d-flex",
            "justify-content-between",
            "align-items-center"
        );
    }
});
