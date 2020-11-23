if (document.URL.match( /artwork/ ) && document.URL.match( /new/ ) || document.URL.match( /artwork/ ) && document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){

    const artwork_price = document.getElementById("artwork-price")

    //設定金額欄に入力があった場合に処理
    artwork_price.addEventListener("keyup", () => {

      const price = artwork_price.value

      const add_tax_price = document.getElementById("add-tax-price")

      //手数料を計算
      let price_tax = price * 0.1
      price_tax = Math.floor(price_tax)

      //計算した手数料を画面に表示
      add_tax_price.innerHTML = price_tax

      const donation = document.getElementById("donation")

      //寄付金額を計算
      let price_donation = price - price_tax
      price_donation = Math.floor(price_donation)

      //計算した寄付金額を画面に表示
      donation.innerHTML = price_donation
    })
  })
}

