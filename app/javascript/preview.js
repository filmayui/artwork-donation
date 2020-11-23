if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    
    document.getElementById('content-image').addEventListener('change', function(e){
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}

// 選択した画像を表示する関数
const createImageHTML = (blob) => {

  const ImageList = document.getElementById('image-list');

  // 画像を表示するためのdiv要素を生成
  const imageElement = document.createElement('div');

  // 表示する画像を生成
  const blobImage = document.createElement('img');

  //画像サイズを調整
  blobImage.height = 100;
  blobImage.width = 100;

  blobImage.setAttribute('src', blob);

  // 生成したHTMLの要素をブラウザに表示させる
  imageElement.appendChild(blobImage);
  ImageList.appendChild(imageElement);
};