if (document.URL.match( /card/ ) && document.URL.match( /new/ )) {
  document.addEventListener('DOMContentLoaded', function(){

    // 環境変数を読み込む
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); 
    const form = document.getElementById("charge-form"); 
    form.addEventListener("submit", (e) => { 
      e.preventDefault();

        // カード情報の取得先
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      const card = { 
        number: formData.get("number"),              // カード番号
        cvc: formData.get("cvc"),                    // カード裏面の3桁の数字
        exp_month: formData.get("exp_month"),        // 有効期限の月
        exp_year: `20${formData.get("exp_year")}`,   // 有効期限の年
      };

      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");   

          //paramsの中にトークンを含める
          const tokenObj = `<input value=${token} type="hidden" name='card_token'>`;   

          //フォームの一番最後に要素を追加
          renderDom.insertAdjacentHTML("beforeend", tokenObj);  

          document.getElementById("number").removeAttribute("name");
          document.getElementById("cvc").removeAttribute("name");
          document.getElementById("exp_month").removeAttribute("name");
          document.getElementById("exp_year").removeAttribute("name");

          document.getElementById("charge-form").submit();
          document.getElementById("charge-form").reset();
          alert("登録が完了しました")
        } else {
          alert("カード情報が正しくありません")
        }
      });
    });
  });
}
 