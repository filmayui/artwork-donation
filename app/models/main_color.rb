class MainColor < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '暖色' },
    { id: 2, name: '寒色' },
    { id: 3, name: '原色' },
    { id: 4, name: 'カラフル' },
    { id: 5, name: 'モノクロ' },
    { id: 6, name: 'パステルカラー' },
    { id: 7, name: 'メタリック' },
    { id: 8, name: '透明' },
    { id: 9, name: 'その他' }
  ]
end
