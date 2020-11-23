if (document.URL.match( /artworks/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const artwork = document.getElementById("artwork");

    //現在のお気に入り登録数を取得
    const count = document.getElementById("count");

    artwork.addEventListener("click", function () {
        const artworkId = artwork.getAttribute("data-id");
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/users/${artworkId}/favorite`, true);
        XHR.responseType = "json";
        XHR.send();

        XHR.onload = () => {
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null;
          }
          const isfavorite = XHR.response.or;

          //コントローラーから送られてきた値のtrue、falseで条件分岐
          if (isfavorite) {
            artwork.setAttribute("data-check", "true");

            //文字列を数値変換
            const intCount= parseInt(count.innerHTML)

            //現在のお気に入り登録数を+1する
            count.innerHTML = intCount + 1
            
          } else {
            artwork.removeAttribute("data-check");

            //現在のお気に入り登録数を-1する
            count.innerHTML = count.innerHTML - 1
            
          }
        };
    });
  });
}
